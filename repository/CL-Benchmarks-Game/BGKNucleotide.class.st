Class {
	#name : #BGKNucleotide,
	#superclass : #Object,
	#instVars : [
		'dictFactory',
		'sortCollectionFactory',
		'assocFact'
	],
	#category : 'CL-Benchmarks-Game'
}

{ #category : #defaults }
BGKNucleotide class >> defaultProblemSize [
	^ 1000
]

{ #category : #'test data' }
BGKNucleotide class >> output [
	^ 'T 31.520
A 29.600
C 19.480
G 19.400

AT 9.922
TT 9.602
TA 9.402
AA 8.402
GA 6.321
TC 6.301
TG 6.201
GT 6.041
CT 5.961
AG 5.841
CA 5.461
AC 5.441
CC 4.041
CG 4.021
GC 3.701
GG 3.341

54	GGT
24	GGTA
4	GGTATT
0	GGTATTTTAATT
0	GGTATTTTAATTTATAGT
'
]

{ #category : #helpers }
BGKNucleotide >> in: dict at: key putValueOf: putBlock ifAbsentPutValueOf: absentBlock [
   "* Set the value at key to be the value of evaluating putBlock
    with the existing value. If key is not found, create a new
    entry for key and set is value to the evaluation of
    absentBlock. Answer the result of evaluating either block. *"

   | assoc anObject |
   key == nil ifTrue:
      [^dict
         subscriptBoundsErrorFor: #at:putValueOf:ifAbsentPutValueOf:
         index: key
         value: absentBlock value].
   assoc := dict associationAt: key ifAbsent: nil.
   assoc == nil
      ifTrue:  [dict at: key put: (anObject := absentBlock value)]
      ifFalse: [assoc value: (anObject := putBlock value: assoc value)].
   ^anObject
]

{ #category : #'initialize-release' }
BGKNucleotide >> initialize [
	sortCollectionFactory := SortedCollection.
	dictFactory := Dictionary.
	assocFact := Association.
]

{ #category : #benchmarking }
BGKNucleotide >> knucleotide5 [

   self knucleotide5From: self stdinSpecial to: self stdout.
]

{ #category : #benchmarking }
BGKNucleotide >> knucleotide5From: input to: output [
   "Same as av3, but create less strings while updating the frequencies"

   | sequence writeFrequencies writeCount |

   sequence := (self readFasta: 'THREE' from: input) value asUppercase.

   writeFrequencies :=
      [:k | | frequencies count |
      frequencies := sortCollectionFactory sortBlock: [:a :b|
      (a value = b value) ifTrue: [b key < a key] ifFalse: [b value < a value]].

   count := 0.0.
   (self substringFrequencies5On: sequence with: k using: (dictFactory new: 1024))
      associationsDo: [:each|
         frequencies add: each. count := count + each value].

   frequencies do: [:each | | percentage |
      percentage := (each value / count) * 100.0.

      output
         nextPutAll: each key; space;
         nextPutAll: (percentage printShowingDecimalPlaces: 3); cr]].

   writeCount := [:nucleotideFragment | | frequencies count |
      frequencies := self substringFrequencies5On: sequence with: nucleotideFragment size
         using: (dictFactory new: 1024).
      count := frequencies at: nucleotideFragment ifAbsent: [0].
      output print: count; tab; nextPutAll: nucleotideFragment; cr].

   writeFrequencies value: 1. output cr.
   writeFrequencies value: 2. output cr.

   writeCount value: 'GGT'.
   writeCount value: 'GGTA'.
   writeCount value: 'GGTATT'.
   writeCount value: 'GGTATTTTAATT'.
   writeCount value: 'GGTATTTTAATTTATAGT'
]

{ #category : #helpers }
BGKNucleotide >> readFasta: sequenceName from: input [
   | prefix newline buffer description line char |
   prefix := '>',sequenceName.
   newline := Character cr.

   "* find start of particular fasta sequence *"
   [(input atEnd) or: [
         (input peek = $>)
            ifTrue: [((line := input upTo: newline)
               indexOfSubCollection: prefix startingAt: 1) = 1]
            ifFalse: [input upTo: newline. false]]
      ] whileFalse.

   "* line-by-line read - it would be a lot faster to block read *"
   description := line.
   buffer := ReadWriteStream on: (ByteString new: 1028).
   [(input atEnd) or: [(char := input peek) = $>]] whileFalse: [
      (char = $;)
         ifTrue: [input upTo: newline]
         ifFalse: [buffer nextPutAll: (input upTo: newline)]
      ].
   ^ assocFact key: description value: buffer contents
]

{ #category : #helpers }
BGKNucleotide >> substringFrequencies5On: aSeq with: aLength using: aDictionary [

   | buffer |
   buffer := ByteString new: aLength.
   1 to: aSeq size - aLength + 1 do:
      [:i |
         | answer |
         buffer replaceFrom: 1 to: aLength with: aSeq startingAt: i.
         answer := self
			    in: aDictionary
            at: buffer
            putValueOf: [:sum | sum + 1]
            ifAbsentPutValueOf: 1.
         answer = 1 ifTrue: [buffer := ByteString new: aLength].
      ].
   ^aDictionary
]
