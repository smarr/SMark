Class {
	#name : #BGTests,
	#superclass : #TestCase,
	#category : 'CL-Benchmarks-Game-Tests'
}

{ #category : #tests }
BGTests >> testBinaryTrees [
	| bench output expected |
	bench := BGBinaryTrees new.
	output := (TextStream with: ByteString new).

	self assert: -1 equals: (bench binarytrees: 10 to: output).
	
	expected := 'stretch tree of depth 11	 check: -1
2048	 trees of depth 4	 check: -2048
512	 trees of depth 6	 check: -512
128	 trees of depth 8	 check: -128
32	 trees of depth 10	 check: -32
long lived tree of depth 10	 check: -1
'.
	self assert: expected equals: output contents.
]

{ #category : #tests }
BGTests >> testBinaryTreesResult [
	| bench output |
	bench := BGBinaryTrees new.
				
	output := (TextStream with: ByteString new).
	self assert: -1 equals: (bench binarytrees: 9 to: output).
	
	output := (TextStream with: ByteString new).
	self assert: -1 equals: (bench binarytrees: 8 to: output).
	
	output := (TextStream with: ByteString new).
	self assert: -1 equals: (bench binarytrees: 7 to: output).
	
	
]

{ #category : #tests }
BGTests >> testChameleons [
	self assert: (BGChameleons chameneos:     100) equals: 200. 
	self assert: (BGChameleons chameneos:   10000) equals: 20000.
	self assert: (BGChameleons chameneos: 1000000) equals: 2000000.
]

{ #category : #tests }
BGTests >> testChameneosRedux [
	| report result |
	
	report := TextStream with: ByteString new.
	result := BGChameneosRedux new runBenchMark: 600 on: report.
	self assert: result equals: 1200.
	
	report := TextStream with: ByteString new.
	result := BGChameneosRedux new runBenchMark: 555 on: report.
	self assert: result equals: (555 * 2).
	
	report := TextStream with: ByteString new.
	result := BGChameneosRedux new runBenchMark: 121 on: report.
	self assert: result equals: (121 * 2).
	
]

{ #category : #tests }
BGTests >> testFannkuchReduxResult [
	 | f |
	f := BGFannkuchRedux fannkuchRedux: 7 to: (TextStream with: ByteString new).
	self assert: f equals: 16
]

{ #category : #tests }
BGTests >> testFasta [
	| result |
	self flag: 'TODO: add proper verification'.
	self shouldnt: [result := BGFasta fasta] raise: Error.
	self assert: (result size > 0).
	self assert: (result isKindOf: String).
	
]

{ #category : #tests }
BGTests >> testKNucleotide [
	| input result |
	BGFastaCache primeForFasta: BGKNucleotide defaultProblemSize.
	input  := ReadStream on: (BGFastaCache forFasta: BGKNucleotide defaultProblemSize).
	result := TextStream with: ByteString new.
	BGKNucleotide new knucleotide5From: input to: result.
	
	self assert: result contents equals: BGKNucleotide output.
]

{ #category : #tests }
BGTests >> testMandelbrot [
	| result |
	
	result := BGMandelbrot new mandelbrot2: 200.
	result reset. "set possition to beginning"
	
	self assert: result contents equals: BGMandelbrot output.
]

{ #category : #tests }
BGTests >> testMeteor [
	| result |
	result := BGMeteor meteor.
	self assert: result contents equals: BGMeteor output
]

{ #category : #tests }
BGTests >> testNBody [
	| result |
	result := BGNBody nbody: 1000.
	
	self assert: (((result at: 2) asString) beginsWith: '-0.169087605')
]

{ #category : #tests }
BGTests >> testPiDigits [
    | piDigits27 |
    piDigits27 := #(3 1 4 1 5 9 2 6 5 3
                  5 8 9 7 9 3 2 3 8 4
                  6 2 6 4 3 3 8).

    self assert: piDigits27 equals: (BGPiDigits piDigits: 27)
]

{ #category : #tests }
BGTests >> testRegexDNA [
	| output input |
	input := BGFastaCache primeForFasta: BGRegexDNA defaultProblemSize.
	
	output := TextStream with: ByteString new.
	
	BGRegexDNA new regexDNA: input to: output.
	self assert: output contents equals: BGRegexDNA output
]

{ #category : #tests }
BGTests >> testReverseComplement [
	BGFastaCache primeForFasta: BGReverseComplement defaultProblemSize.
	self assert: BGReverseComplement revcomp equals: BGReverseComplement output 
]

{ #category : #tests }
BGTests >> testSpectralNorm [
	| result |
	result := BGSpectralNorm new spectralnorm: 100.
	self assert: (result printShowingDecimalPlaces: 9) equals: '1.274219991'
]

{ #category : #tests }
BGTests >> testThreadRing [
	| result |
	result := BGThreadRing threadring: 1000.
	self assert: result equals: 498
]
