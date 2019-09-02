Class {
	#name : #BenchmarkGameSuite,
	#superclass : #SMarkSuite,
	#category : 'CL-Benchmarks-Game'
}

{ #category : #transporter }
BenchmarkGameSuite class >> transportersForFileOutMenu [
	^ { (Smalltalk at: #Transporter ifAbsent: [^#()])
			forPackage: (PackageInfo named: 'CL-Benchmarks-Game') }
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchBinaryTrees [
	| bench problemSize |
	bench := BGBinaryTrees new.
	problemSize := self problemSize ifNotNil: [:ps | ps ]
							  ifNil: [ BGBinaryTrees defaultProblemSize ].
	^ bench binarytrees: problemSize to: (TextStream with: ByteString new).
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchChameleons [
	| result problemSize |
	problemSize := self problemSize ifNotNil: [:ps | ps ]
								  ifNil: [ BGChameleons defaultProblemSize ].
	result := BGChameleons chameneos: problemSize.
	
	"Result should be 2*numberOfProcesses (as far as I understand the benchmark)"
	self flag: 'TODO adapt once verification is supported'.
	result = (2 * problemSize) ifFalse: [
		Error signal: (BGChameleons name, ' benchmark failed. Input: ', 
								 problemSize asString, ' Output: ', result asString).
	].
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchChameneosRedux [
	| result report problemSize |
	problemSize := self problemSize ifNotNil: [:ps | ps ]
								  ifNil: [ BGChameneosRedux defaultProblemSize ].
	report := TextStream with: ByteString new.
	result := BGChameneosRedux new runBenchMark: problemSize on: report.
	
	"Result should be 2*problemSize"
	self flag: 'TODO: adapt once verification is supported'.
	result = (2 * problemSize) ifFalse: [
		Error signal: self class name, ' benchmark failed. Input: ',
								 runner processes asString, ' Output: ', result asString  ].
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchFannkuchRedux [
   | f problemSize |
	problemSize := self problemSize
		ifNotNilDo: [:ps | ps ]
		ifNil: [ BGFannkuchRedux defaultProblemSize ].
   f := BGFannkuchRedux fannkuchRedux: problemSize to: (TextStream with: ByteString new).
   
	" the output should only be done by some reporter"
	"ScriptConsole print: 'Pfannkuchen(', problemSize asString , ') = ', f asString."
   ^f
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchFasta [
	| out problemSize |
	out := TextStream with: ByteString new.
	problemSize := self problemSize
		ifNotNilDo: [:ps | ps ]
		ifNil:      [ BGFasta defaultProblemSize ].  
	BGFasta fasta: problemSize to: out.
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchKNucleotide [
	| bench input result problemSize output |
	problemSize := self problemSize ifNotNil: [:ps | ps ]
							            ifNil:    [ BGKNucleotide defaultProblemSize ].
	
	bench := BGKNucleotide new.
	input := ReadStream on: (BGFastaCache forFasta: problemSize).
	result := TextStream with: ByteString new.
	output := bench knucleotide5From: input to: result.
	
	^ output
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchMandelbrot [
	| result bench problemSize |
	bench := BGMandelbrot new.
	problemSize := self problemSize ifNotNil: [:ps | ps ]
							                 ifNil:    [ BGMandelbrot defaultProblemSize ].
	result := bench mandelbrot2: problemSize.
	result reset.
	^ result contents
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchMeteor [
	| problemSize |
	problemSize := self problemSize ifNotNil: [:ps | ps ]
								  ifNil: [ BGMeteor defaultProblemSize ].
	^ BGMeteor meteor: problemSize.
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchNBody [
	| problemSize |
	problemSize := self problemSize ifNotNil: [:ps | ps ]
								  ifNil: [ BGNBody defaultProblemSize ].
	BGNBody nbody: problemSize.
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchPiDigits [
	| problemSize |
	problemSize := self problemSize ifNotNil: [:ps | ps ]
								  ifNil: [ BGPiDigits defaultProblemSize ].
	^ BGPiDigits piDigits: problemSize.
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchRegexDNA [
	| problemSize |
	problemSize := self problemSize ifNotNil: [:ps | ps ]
								  ifNil: [ BGRegexDNA defaultProblemSize ].
	
	BGRegexDNA regexdna: problemSize
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchReverseComplement [
	| problemSize |
	problemSize := self problemSize ifNotNil: [:ps | ps ]
								  ifNil: [ BGReverseComplement defaultProblemSize ].
	
	BGReverseComplement revcomp: problemSize
]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchSpectralNorm [
	| bench problemSize |
	bench := BGSpectralNorm new.
	problemSize := self problemSize ifNotNil: [:ps | ps ]
							                 ifNil:    [ BGSpectralNorm defaultProblemSize ].
	^ bench spectralnorm: problemSize.

]

{ #category : #benchmarking }
BenchmarkGameSuite >> benchThreadRing [
	| problemSize |
	problemSize := self problemSize ifNotNil: [:ps | ps ]
								  ifNil: [ BGThreadRing defaultProblemSize ].
	^ BGThreadRing threadring: problemSize.
]

{ #category : #license }
BenchmarkGameSuite >> license [
	^
'Revised BSD license

This is a specific instance of the Open Source Initiative (OSI) BSD license
template http://www.opensource.org/licenses/bsd-license.php


Copyright 2008-2010 Isaac Gouy
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

   Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

   Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

   Neither the name of "The Computer Language Benchmarks Game" nor the name of
   "The Computer Language Shootout Benchmarks" nor the name "nanobench" nor
   the name "bencher" nor the names of its contributors may be used to endorse
   or promote products derived from this software without specific prior
   written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.'
]
