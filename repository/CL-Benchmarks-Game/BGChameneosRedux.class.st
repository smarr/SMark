Class {
	#name : #BGChameneosRedux,
	#superclass : #Object,
	#instVars : [
		'lastSum',
		'colorFactory',
		'mallFactory',
		'arrayFactory',
		'collectionFactory',
		'creatureFactory'
	],
	#category : 'CL-Benchmarks-Game'
}

{ #category : #'benchmarking-scripts' }
BGChameneosRedux class >> chameneosredux2 [
	"ChameneosRedux chameneosredux2" 
	| report |
	report := TextStream with: ByteString new.
	self new runBenchMark: 600 on: report.
	^report contents
]

{ #category : #defaults }
BGChameneosRedux class >> defaultProblemSize [
	^ 6000
]

{ #category : #'instance creation' }
BGChameneosRedux >> createAllowing: maxRendezvous [ 
   ^ mallFactory basicNew initialize maxRendezvous: maxRendezvous
]

{ #category : #'instance creation' }
BGChameneosRedux >> createCreaturesWith: aCollectionOfColours [ 
   | aName |
   aName := 0.
   ^aCollectionOfColours collect: 
         [:aColour | 
         aName := aName + 1.
         creatureFactory withName: aName colour: aColour]
]

{ #category : #reporting }
BGChameneosRedux >> generateReportFor: creatures printOn: stream [ 
   | sum |
   sum := creatures inject: 0 into: [:accum :each | accum + each creaturesMet].
   creatures do: 
         [:aCreature | 
         aCreature creaturesMet printOn: stream.
         stream
            space;
            nextPutAll: (mallFactory units at: aCreature selfMet + 1);
            cr].
   stream space.
   sum printString 
      do: [:el | stream nextPutAll: (mallFactory units at: el digitValue + 1)]
      separatedBy: [stream space].
	lastSum := sum.
   ^ stream
]

{ #category : #reporting }
BGChameneosRedux >> generateReportForColours: colours printOn: stream [ 
   stream space.
   colours do: [:colour | colour printOn: stream] separatedBy: [stream space].
   ^ stream
]

{ #category : #'initialize-release' }
BGChameneosRedux >> initialize [
	super initialize.
	colorFactory := BGChameneosColour.
	mallFactory  := BGMall.
	creatureFactory := BGCreature.
	
	arrayFactory := Array.
	collectionFactory := OrderedCollection.
]

{ #category : #setup }
BGChameneosRedux >> openMall: aMall forCreatures: creatures usingGuard: sema [ 
   | processes |
   processes := creatures 
            collect: [:aCreature | 
               [aCreature visitMall: aMall.
               sema signal] newProcess].
   processes do: 
         [:proc | 
         proc priority: Processor userBackgroundPriority.
         proc resume]
]

{ #category : #setup }
BGChameneosRedux >> openMallWith: aCollectionOfColours forNumberOfMeets: aNumber [ 
   | mall creatures guard |
   mall := self createAllowing: aNumber.
   mall run.
   creatures := self createCreaturesWith: aCollectionOfColours.
   guard := Semaphore new.
   self 
      openMall: mall
      forCreatures: creatures
      usingGuard: guard.
   self 
      waitForClosingOfMall: mall
      withCreatures: creatures
      usingGuard: guard.
   ^creatures
]

{ #category : #public }
BGChameneosRedux >> runBenchMark: number on: anOutputStream [ 
   "self runBenchMark: 60000 on: Transcript."

   | firstTestColours secondTestColours blue red yellow creatures |
   blue   := colorFactory blue.
   red    := colorFactory red.
   yellow := colorFactory yellow.
   firstTestColours := arrayFactory 
            with: blue
            with: red
            with: yellow.
   secondTestColours := (collectionFactory new: 10)
            add: blue;
            add: red;
            add: yellow;
            add: red;
            add: yellow;
            add: blue;
            add: red;
            add: yellow;
            add: red;
            add: blue;
            yourself.

   (colorFactory generateReportOfColoursOn: anOutputStream) cr.
   (self generateReportForColours: firstTestColours printOn: anOutputStream) 
      cr.
   creatures := self openMallWith: firstTestColours forNumberOfMeets: number.
   (self generateReportFor: creatures printOn: anOutputStream)
      cr;
      cr.
   (self generateReportForColours: secondTestColours printOn: anOutputStream) 
      cr.
   creatures := self openMallWith: secondTestColours forNumberOfMeets: number.
   (self generateReportFor: creatures printOn: anOutputStream)
      cr;
      cr.
	^ lastSum
]

{ #category : #setup }
BGChameneosRedux >> waitForClosingOfMall: aMall withCreatures: creatures usingGuard: guard [ 
   creatures size timesRepeat: [guard wait].
   aMall close
]
