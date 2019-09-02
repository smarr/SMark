Class {
	#name : #BGMeteorBoard,
	#superclass : #Object,
	#instVars : [
		'pieces',
		'ncol',
		'ncell',
		'twoRows',
		'sixRows',
		'oddRowsMask',
		'evenRowsMask',
		'southEdge',
		'eastEdge',
		'westEdge',
		'southToNorthMasks',
		'eastToWestMasks',
		'northWestMask',
		'northEastMask',
		'southWestMask',
		'southEastMask',
		'positionsPerPiece',
		'loopCount',
		'fillMask',
		'pieceFactory',
		'pieceWithIsland',
		'arrayFactory',
		'intervalFactory',
		'setFactory'
	],
	#category : 'CL-Benchmarks-Game-Meteor'
}

{ #category : #'instance creation' }
BGMeteorBoard class >> default [
    ^self new fromString:
'0 0 0 0 1 
 2 2 2 0 1 
2 6 6 1 1 
 2 6 1 5 5 
8 6 5 5 5 
 8 6 3 3 3 
4 8 8 9 3 
 4 4 8 9 3 
4 7 4 7 9 
 7 7 7 9 9'
]

{ #category : #solving }
BGMeteorBoard >> boardStringWithPieces: pArray [
    | board |
    board := ByteString new: ncell.
    1 to: pArray size do: [:i | | c |
        c := '0123456789*' at: i.
        (pArray at: i) fillSolution: board ncol: ncol withColor: c].
    ^board
]

{ #category : #generating }
BGMeteorBoard >> canShiftE: aPieceMask [
    ^(eastEdge bitAnd: aPieceMask) = 0
]

{ #category : #generating }
BGMeteorBoard >> canShiftNE: aPieceMask [
    ^(northEastMask bitAnd: aPieceMask) = 0
]

{ #category : #generating }
BGMeteorBoard >> canShiftNW: aPieceMask [
    ^(northWestMask bitAnd: aPieceMask) = 0
]

{ #category : #generating }
BGMeteorBoard >> canShiftSE: aPieceMask [
    ^(southEastMask bitAnd: aPieceMask) = 0
]

{ #category : #generating }
BGMeteorBoard >> canShiftSW: aPieceMask [
    ^(southEastMask bitAnd: aPieceMask) = 0
]

{ #category : #generating }
BGMeteorBoard >> canShiftW: aPieceMask [
    ^(westEdge bitAnd: aPieceMask) = 0
]

{ #category : #constructors }
BGMeteorBoard >> createMeteorPiece [
	^ pieceFactory new
]

{ #category : #constructors }
BGMeteorBoard >> createMeteorPieceWithIsland [
	^ pieceWithIsland new
]

{ #category : #islands }
BGMeteorBoard >> fillMaskStartingAt: pos stoppingAbove: maxCell ifFoundEnough: exitBlock [
    (fillMask bitAnd: pos) = 0 ifFalse: [^self].
    (pos > maxCell) ifTrue: [^exitBlock value].
    fillMask := fillMask + pos.
    (self canShiftE: pos) ifTrue: [self fillMaskStartingAt: (self shiftE: pos) stoppingAbove: maxCell ifFoundEnough: exitBlock].
    (self canShiftNE: pos) ifTrue: [self fillMaskStartingAt: (self shiftNE: pos) stoppingAbove: maxCell ifFoundEnough: exitBlock].
    (self canShiftNW: pos) ifTrue: [self fillMaskStartingAt: (self shiftNW: pos) stoppingAbove: maxCell ifFoundEnough: exitBlock].
    (self canShiftW: pos) ifTrue: [self fillMaskStartingAt: (self shiftW: pos) stoppingAbove: maxCell ifFoundEnough: exitBlock].
    ^self
]

{ #category : #islands }
BGMeteorBoard >> findIsland: aMask [
    | nextFreeCellMask open |
    nextFreeCellMask := 1 + aMask bitAnd: -1 - aMask.
    fillMask :=  aMask.
    open := false.
    self fillMaskStartingAt: nextFreeCellMask stoppingAbove: (1 bitShift: fillMask highBit - 1 // ncol * ncol - 1) ifFoundEnough: [open := true].
    ^open
        ifTrue: [0]
        ifFalse: [fillMask - aMask]
]

{ #category : #generating }
BGMeteorBoard >> flip: aPieceMask [
    ^self shiftSEmost: ((southToNorthMasks
        inject: 0 into: [:mask :rowMask |
            (mask bitShift:  ncol) + ((rowMask bitAnd: aPieceMask) bitShift: 1 - rowMask lowBit)])
                bitShift: 0 - ncol)
]

{ #category : #'initialize-release' }
BGMeteorBoard >> fromString: aString [
    | rawString |
    rawString := aString reject: [:e | e isSeparator].
    ncell := rawString size.
    ncol := 0.
    (aString readStream upTo: Character cr) do: [:e | e isSeparator ifFalse: [ncol := ncol + 1]].
    twoRows := ncol * 2.
    sixRows := ncol * 6.
    self initializeRowColMasks.
    pieces := (setFactory withAll: rawString) sorted collect: [:char |
        self shiftSEmost:
            (rawString inject: 0 into: [:pmask :c | pmask * 2 + (c = char ifTrue: [1] ifFalse: [0])])].
    self initializePossiblePositions
]

{ #category : #islands }
BGMeteorBoard >> hasEastOrWestIsland: aMask [
    ^ (self hasInsetZero: southEdge * (eastEdge bitAnd: aMask))
        or: [(self hasInsetZero: southEdge * (westEdge bitAnd: aMask))
            or: [(aMask bitAnd: eastEdge) > 0 and: [(aMask bitAnd: westEdge) > 0 and: [(self findIsland: aMask) bitCount \\ 5 > 0]]]]
]

{ #category : #islands }
BGMeteorBoard >> hasInsetZero: aMask [
    | allOnes |
    allOnes := aMask bitOr: aMask - 1.
    ^ (allOnes bitAnd: allOnes + 1) > 0
]

{ #category : #islands }
BGMeteorBoard >> hasNorthIsland: aPieceMask row: iRow [
    | bitReverse |
    bitReverse := (#(-1 -1 6 4 2) at: iRow) * ncol.
    ^self hasSouthIsland: (aPieceMask bitReverse: bitReverse)
]

{ #category : #islands }
BGMeteorBoard >> hasSouthIsland: aMask [
    ^(self findIsland: aMask) bitCount \\ 5 > 0
        or: [(self findIsland: fillMask) bitCount \\ 5 > 0]
]

{ #category : #'initialize-release' }
BGMeteorBoard >> initialize [
	pieceFactory    := BGMeteorPiece.
	pieceWithIsland := BGMeteorPieceWithIsland.
	arrayFactory    := Array.
	intervalFactory := Interval.
	setFactory      := Set.
]

{ #category : #'initialize-release' }
BGMeteorBoard >> initializePossiblePositions [
    | positionsPerPiecePerCell thePieceWhichBreakSymmetry |
    positionsPerPiecePerCell := self possiblePositionsOnTwoRows.
    thePieceWhichBreakSymmetry := 6.
    positionsPerPiece := (intervalFactory from: 1 to: 5) collect: [:iRow |
        | maxMaskForRow northRow |
        maxMaskForRow := (1 bitShift: (#(6 6 6 4 2) at: iRow) * ncol) - 1.
        northRow :=  southEdge bitShift: ((#(-1 -1 6 4 2) at: iRow) - 1 * ncol).
        (intervalFactory from: 1 to: twoRows) collect: [:cellNumber |
            (intervalFactory from: 1 to: pieces size) collect: [:pieceNumber |
                | orientations n str |
                orientations := (positionsPerPiecePerCell at: pieceNumber) at: cellNumber.
                n := pieceNumber = thePieceWhichBreakSymmetry ifTrue: [6] ifFalse: [12].
                str := (arrayFactory new: n) writeStream.
                1 to: n do: [:i |
                    | aPiece |
                    aPiece := orientations at: i.
                    (aPiece mask > 0 and: [aPiece mask <= maxMaskForRow])
                        ifTrue:
                            [(iRow = 1 and: [cellNumber <= ncol])
                                ifTrue: [(self hasSouthIsland: aPiece mask)
                                    ifFalse: [str nextPut: (self mask: aPiece mask islands: 0)]]
                                ifFalse: [(aPiece mask bitAnd: northRow) > 0
                                    ifTrue: [(self hasNorthIsland: aPiece mask row: iRow)
                                        ifFalse:
                                            [| isle |
                                            isle := iRow = 5
                                                ifTrue: [0]
                                                ifFalse: [self northIslandsFor: aPiece mask row: iRow].
                                            str nextPut: (self mask: aPiece mask islands: isle)]]
                                    ifFalse: [str nextPut: aPiece]]]].
                str contents]]]
]

{ #category : #'initialize-release' }
BGMeteorBoard >> initializeRowColMasks [
    southEdge := (1 bitShift: ncol) - 1.
    southToNorthMasks := (intervalFactory from: 0 to: 5) collect: [:i | southEdge bitShift: ncol * i].
    eastEdge := (1 bitShift: sixRows)-1/southEdge.
    eastToWestMasks := (intervalFactory from: 0 to: ncol - 1) collect: [:i | eastEdge bitShift: i].
    westEdge := eastToWestMasks last.
    oddRowsMask := (1 bitShift: sixRows)-1/((1 bitShift: twoRows)-1)*southEdge.
    evenRowsMask := oddRowsMask bitShift: ncol.
    northWestMask := westEdge bitAnd: evenRowsMask.
    northEastMask := eastEdge bitAnd: oddRowsMask.
    southWestMask := southEdge bitOr: (westEdge bitAnd: evenRowsMask).
    southEastMask := southEdge bitOr: (eastEdge bitAnd: oddRowsMask).
]

{ #category : #islands }
BGMeteorBoard >> islandsFor: aPieceMask [
    | islands aMask nextFreeCellMask open top |
    islands := 0.
    fillMask := aPieceMask.
    top := 1 bitShift: (fillMask highBit - 1 // ncol * ncol - 1).
    [(nextFreeCellMask := 1 + fillMask bitAnd: -1 - fillMask) <= top]
        whileTrue:
            [open := false.
            aMask := fillMask.
            self fillMaskStartingAt: nextFreeCellMask stoppingAbove: top ifFoundEnough: [open := true].
            open ifFalse: [islands := islands + (fillMask - aMask)]].
    ^islands
]

{ #category : #'initialize-release' }
BGMeteorBoard >> mask: p islands: i [
    ^ i = 0
        ifTrue:  [self createMeteorPiece mask: p]
        ifFalse: [self createMeteorPieceWithIsland mask: p; islands: i]
]

{ #category : #islands }
BGMeteorBoard >> northIslandsFor: aPieceMask row: iRow [
    | filled isleSEW bitReverse isleNE isleNW |
    bitReverse := (#(-1 -1 6 4 2) at: iRow) * ncol.
    filled := aPieceMask bitOr: aPieceMask - 1.
    isleSEW := self islandsFor: filled.
    (aPieceMask bitAnd: (eastEdge bitOr: westEdge)) = 0 ifFalse: [^isleSEW].
    (isleSEW bitAnd: (eastEdge bitOr: westEdge)) = 0 ifFalse: [^isleSEW].
    (southEdge bitAnd: aPieceMask) = 0
        ifTrue: [filled := (filled bitShift: 0 - ncol) bitShift: ncol].
    isleNE := ((self islandsFor: (filled bitReverse: bitReverse)) bitReverse: bitReverse) bitOr: isleSEW.
    isleNW := ((1 bitShift: bitReverse) - 1 - (isleNE bitOr: (aPieceMask bitOr: aPieceMask - 1))) bitOr: isleSEW.
    ^isleNW bitCount < isleNE bitCount
        ifTrue: [isleNW]
        ifFalse: [isleNE]
]

{ #category : #generating }
BGMeteorBoard >> placesFor: aPieceMask do: aBlock [
    | westMask eastMask |
    eastMask := self shiftSEmost: aPieceMask.
    
    [[westMask := eastMask.
    [westMask lowBit > twoRows ifTrue: [^self].
    (self hasEastOrWestIsland: westMask) ifFalse: [aBlock value: westMask].
    self canShiftW: westMask] whileTrue: [westMask := self shiftW: westMask].
    self canShiftNE: eastMask] whileTrue: [eastMask := self shiftNE: eastMask].
    self canShiftNW: eastMask] whileTrue: [eastMask := self shiftNW: eastMask]
]

{ #category : #generating }
BGMeteorBoard >> possiblePositionsOnTwoRows [
    ^pieces collect: [:aPieceMask |
        | possible iRot |
        possible := (arrayFactory new: twoRows) collect: [:freeCell | arrayFactory new: 12 withAll: (self createMeteorPiece mask: 0)].
        iRot := 0.
        self rotationsOf: aPieceMask do: [:rotated |
            iRot := iRot + 1.
            self placesFor: rotated do: [:shifted |
                (possible at: shifted lowBit) at: iRot put: (self
                    mask: ((self hasEastOrWestIsland: shifted) ifTrue: [0] ifFalse: [shifted])
                    islands: (self islandsFor: (shifted bitOr: shifted - 1)))]].
        possible]
]

{ #category : #printing }
BGMeteorBoard >> printSolution: aString on: aStream [
    | src i odd |
    src := aString readStream.
    i := 0. odd := true.
    [src atEnd]
        whileFalse:
            [aStream nextPut: src next; space.
            (i := i + 1 \\ ncol) = 0
                ifTrue:
                    [aStream cr.
                    (odd := odd not)  ifFalse: [aStream space]]]
]

{ #category : #generating }
BGMeteorBoard >> rotate: aPieceMask [
    | rotatedMask pivot rotatedPivot irow row |
    rotatedMask := 0.
    irow := 1.
    row := aPieceMask bitAnd: (southToNorthMasks at: irow).
    rotatedPivot := pivot := 1 bitShift: row highBit - 1.
    
    [rotatedMask := rotatedMask + rotatedPivot.
    [(row bitAnd: pivot - 1) = 0]
        whileFalse:
            [pivot := self shiftE: pivot.
            rotatedPivot := self shiftNE: rotatedPivot.
            (row bitAnd: pivot) = 0
                ifFalse:
                    [rotatedMask := rotatedMask + rotatedPivot]].
    (row := aPieceMask bitAnd: (southToNorthMasks at: (irow := irow + 1))) = 0]
        whileFalse:
            [(self canShiftNE: pivot)
                ifTrue:
                    [pivot := self shiftNE: pivot.
                    rotatedPivot := self shiftNW: rotatedPivot]
                ifFalse:
                    [pivot := self shiftNW: pivot.
                    rotatedPivot := self shiftW: rotatedPivot].
            [row >= (pivot bitShift: 1)]
                whileTrue:
                    [pivot := self shiftW: pivot.
                    (self canShiftSW: rotatedPivot)
                        ifFalse:
                            [rotatedPivot := rotatedPivot bitShift: twoRows.
                            rotatedMask := rotatedMask bitShift: twoRows.].
                    rotatedPivot := self shiftSW: rotatedPivot]].
    ^self shiftSEmost: rotatedMask
]

{ #category : #generating }
BGMeteorBoard >> rotationsOf: aPieceMask do: aBlock [
    | next |
    aBlock value: (next := aPieceMask); value: (self flip: next).
    5 timesRepeat:  [aBlock value: (next := self rotate: next); value: (self flip: next)]
]

{ #category : #solving }
BGMeteorBoard >> searchPuzzlesWithColorMask: colorMask boardMask: bMask rowOffset: rowOff pieces: pArray ifFound: solutionBlock [
    | nextFreeCell possibles colorBit iRow boardMask |
    colorMask = 0 ifTrue: [ ^solutionBlock value: (self boardStringWithPieces: pieces) ].
    loopCount := loopCount + 1.
    boardMask := bMask.
    iRow := rowOff.
    [(nextFreeCell := (boardMask + 1) lowBit) > twoRows]
        whileTrue:
            [ iRow := iRow + 2.
            boardMask := boardMask bitShift: 0 - twoRows ].
    possibles := (positionsPerPiece at: iRow // 2 + 1) at: nextFreeCell.
    colorBit := 1.
    1 to: pieces size do: [:pieceNumber |
        (colorMask bitAnd: colorBit) = 0
            ifFalse:
                [ | positions |
                positions := possibles at: pieceNumber.
                1 to: positions size do: [:i |
                    | aPiece |
                    ((aPiece := positions at: i) fitOnBoard: boardMask)
                        ifTrue:
                            [pieces at: pieceNumber put: (aPiece forRow: iRow).
                            self
                                searchPuzzlesWithColorMask: colorMask - colorBit
                                boardMask: boardMask + aPiece mask
                                rowOffset: iRow
                                pieces: pArray
                                ifFound: solutionBlock]]].
        colorBit := colorBit * 2].
    ^nil
]

{ #category : #generating }
BGMeteorBoard >> shiftE: aPieceMask [
    ^aPieceMask bitShift: -1
]

{ #category : #generating }
BGMeteorBoard >> shiftNE: aPieceMask [
    | evens odds |
    odds := oddRowsMask bitAnd: aPieceMask.
    evens := evenRowsMask bitAnd: aPieceMask.
    ^(odds bitShift: -1) + evens bitShift: ncol
]

{ #category : #generating }
BGMeteorBoard >> shiftNW: aPieceMask [
    | evens odds |
    odds := oddRowsMask bitAnd: aPieceMask.
    evens := evenRowsMask bitAnd: aPieceMask.
    ^(evens bitShift: 1) + odds bitShift: ncol
]

{ #category : #generating }
BGMeteorBoard >> shiftSE: aPieceMask [
    | evens odds |
    odds := oddRowsMask bitAnd: aPieceMask.
    evens := evenRowsMask bitAnd: aPieceMask.
    ^(odds bitShift: -1) + evens bitShift: 0 - ncol
]

{ #category : #generating }
BGMeteorBoard >> shiftSEmost: aPieceMask [
    | mostSEMask eastColumn lowBit |
    aPieceMask odd ifTrue: [^aPieceMask].
    lowBit := aPieceMask lowBit.
    mostSEMask := aPieceMask bitShift: 0 -  (lowBit - 1 // twoRows * twoRows).
    (mostSEMask bitAnd: southEdge) = 0
        ifTrue: [mostSEMask := (self canShiftSE: mostSEMask)
            ifTrue: [self shiftSE: mostSEMask]
            ifFalse: [self shiftSW: mostSEMask]].
    eastColumn := eastToWestMasks findFirst: [:e | (e bitAnd: mostSEMask) > 0].
    ^mostSEMask bitShift: 1 - eastColumn
]

{ #category : #generating }
BGMeteorBoard >> shiftSW: aPieceMask [
    | evens odds |
    odds := oddRowsMask bitAnd: aPieceMask.
    evens := evenRowsMask bitAnd: aPieceMask.
    ^(evens bitShift: 1) + odds bitShift: 0 - ncol
]

{ #category : #generating }
BGMeteorBoard >> shiftW: aPieceMask [
    ^aPieceMask bitShift: 1
]

{ #category : #solving }
BGMeteorBoard >> solvedPuzzleDo: solutionBlock [
    loopCount := 0.
    self
        searchPuzzlesWithColorMask: (1 bitShift: pieces size) - 1
        boardMask: 0
        rowOffset: 0
        pieces: pieces copy
        ifFound: [:solution |
            solutionBlock value: solution; value: solution reverse].
    ^loopCount
]
