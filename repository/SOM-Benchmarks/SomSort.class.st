Class {
	#name : #SomSort,
	#superclass : #SomBenchmark,
	#instVars : [
		'smallest',
		'largest'
	],
	#category : 'SOM-Benchmarks'
}

{ #category : #benchmarking }
SomSort >> benchmark [
        | array |
        array := self randomArray: self dataSize.
        ^ self sort: array
]

{ #category : #initializing }
SomSort >> dataSize [
	self subclassResponsibility
]

{ #category : #initializing }
SomSort >> randomArray: size [
        | array |
        SomRandom initialize.
        array := Array new: size.
        1 to: size do: [:i | array at: i put: SomRandom next ].
        smallest := largest := array at: 1.
        array do: [ :elm |
            (elm > largest)  ifTrue: [ largest  := elm ].
            (elm < smallest) ifTrue: [ smallest := elm ]. ].
        ^array
]

{ #category : #sorting }
SomSort >> sort: array [
	self subclassResponsibility
]

{ #category : #benchmarking }
SomSort >> verifyResult: array [
        ((array at: 1) ~= smallest)
            | ((array at: array size) ~= largest)
                ifTrue: [
						self error: 'Array is not sorted. smallest: ', smallest asString,
									   ' largest: ', largest asString, ' [1]: ', (array at: 1) asString,
									   ' [l]: ', (array at: array length) asString ].
        3 to: (array size) do: [ :i |
            (array at: i - 1) > (array at: i) 
                ifTrue: [
						self error: 'Array is not sorted. [', i asString, ' - 1]: ',
										(array at: i - 1) asString,
										' [', i asString, ']: ', (array at: i) asString]. ].
        ^ true
]
