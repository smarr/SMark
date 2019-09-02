Class {
	#name : #BGChameneosColour,
	#superclass : #Object,
	#instVars : [
		'color'
	],
	#classInstVars : [
		'Blue',
		'Red',
		'Yellow'
	],
	#category : 'CL-Benchmarks-Game-ChameneosRedux'
}

{ #category : #accessing }
BGChameneosColour class >> blue [
   ^ Blue
]

{ #category : #accessing }
BGChameneosColour class >> blue: anObject [
   Blue := anObject
]

{ #category : #'initialize-release' }
BGChameneosColour class >> createBlue [
   "comment stating purpose of message"

   ^ self new color: #blue
]

{ #category : #'initialize-release' }
BGChameneosColour class >> createRed [
   "comment stating purpose of message"

   ^ self new color: #red
]

{ #category : #'initialize-release' }
BGChameneosColour class >> createYellow [
   "comment stating purpose of message"

   ^ self new color: #yellow
]

{ #category : #printing }
BGChameneosColour class >> generateReportOfColoursOn: readOut [ 
   | colours |
   colours := Array 
            with: Blue
            with: Red
            with: Yellow.
   colours do: 
         [:aColour | 
         colours do: 
               [:anotherColour | 
               aColour printOn: readOut.
               readOut nextPutAll: ' + '.
               anotherColour printOn: readOut.
               readOut nextPutAll: ' -> '.
               (aColour complementaryColourFor: anotherColour) printOn: readOut.
               readOut cr]].
   ^readOut
]

{ #category : #'initialize-release' }
BGChameneosColour class >> initialize [
   "self initialize"

   Red := self createRed.
   Blue := self createBlue.
   Yellow := self createYellow
]

{ #category : #accessing }
BGChameneosColour class >> red [
   ^ Red
]

{ #category : #accessing }
BGChameneosColour class >> red: anObject [
   Red := anObject
]

{ #category : #accessing }
BGChameneosColour class >> yellow [
   ^ Yellow
]

{ #category : #accessing }
BGChameneosColour class >> yellow: anObject [
   Yellow := anObject
]

{ #category : #accessing }
BGChameneosColour >> color [
   ^color
]

{ #category : #accessing }
BGChameneosColour >> color: aColor [ 
   color := aColor
]

{ #category : #helper }
BGChameneosColour >> complementaryColourFor: aChameneosColour [ 
   "determine the complementary colour defined as..."

   self == aChameneosColour ifTrue: [^self].
   self isBlue 
      ifTrue: 
         [aChameneosColour isRed 
            ifTrue: [^self class yellow]
            ifFalse: [^self class red]].
   self isRed 
      ifTrue: 
         [aChameneosColour isBlue 
            ifTrue: [^self class yellow]
            ifFalse: [^self class blue]].
   aChameneosColour isBlue 
      ifTrue: [^self class red]
      ifFalse: [^self class blue]
]

{ #category : #testing }
BGChameneosColour >> hasSameColorAs: aChameneos [ 
   ^self color == aChameneos color
]

{ #category : #testing }
BGChameneosColour >> isBlue [
   ^self == self class blue
]

{ #category : #testing }
BGChameneosColour >> isRed [
   ^self == self class red
]

{ #category : #testing }
BGChameneosColour >> isYellow [
   ^self == self class yellow
]

{ #category : #printing }
BGChameneosColour >> printOn: aStream [ 
   aStream nextPutAll: self color
]
