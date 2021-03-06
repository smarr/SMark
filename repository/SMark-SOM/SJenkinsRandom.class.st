Class {
	#name : #SJenkinsRandom,
	#superclass : #Object,
	#classVars : [
		'seed'
	],
	#category : 'SMark-SOM'
}

{ #category : #'as yet unclassified' }
SJenkinsRandom >> random [
	"Robert Jenkins' 32 bit integer hash function."
	 seed := ((seed       + 2127912214 "0x7ed55d16")       + (seed as32BitUnsignedValue  << 12) as32BitSignedValue) as32BitSignedValue.
    seed := ((seed bitXor: 3345072700 "0xc761c23c") bitXor: (seed as32BitUnsignedValue >>> 19)) as32BitSignedValue.
    seed := ((seed       +  374761393 "0x165667B1")       + (seed as32BitUnsignedValue  <<  5) as32BitSignedValue) as32BitSignedValue.
    seed := ((seed       + 3550635116 "0xd3a2646c") bitXor: (seed as32BitUnsignedValue  <<  9) as32BitSignedValue) as32BitSignedValue.
    seed := ((seed       + 4251993797 "0xfd7046c5")       + (seed as32BitUnsignedValue  <<  3) as32BitSignedValue) as32BitSignedValue.
    seed := ((seed bitXor: 3042594569 "0xb55a4f09") bitXor: (seed as32BitUnsignedValue >>> 16)) as32BitSignedValue.
    ^ seed
]

{ #category : #'as yet unclassified' }
SJenkinsRandom >> seed: val [
	seed := ThirtyTwoBitRegister basicNew load: val
]
