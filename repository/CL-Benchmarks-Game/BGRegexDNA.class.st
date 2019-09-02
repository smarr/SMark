Class {
	#name : #BGRegexDNA,
	#superclass : #Object,
	#instVars : [
		'dictFactory',
		'arrFact'
	],
	#category : 'CL-Benchmarks-Game'
}

{ #category : #defaults }
BGRegexDNA class >> defaultProblemSize [
	^ 10000
]

{ #category : #'test data' }
BGRegexDNA class >> output [
	^ 'agggtaaa|tttaccct 0
[cgt]gggtaaa|tttaccc[acg] 3
a[act]ggtaaa|tttacc[agt]t 9
ag[act]gtaaa|tttac[agt]ct 8
agg[act]taaa|ttta[agt]cct 10
aggg[acg]aaa|ttt[cgt]ccct 3
agggt[cgt]aa|tt[acg]accct 4
agggta[cgt]a|t[acg]taccct 3
agggtaa[cgt]|[acg]ttaccct 5

101745
100000
133640
'
]

{ #category : #benchmarking }
BGRegexDNA class >> regexdna [
	^ self regexdna: self defaultProblemSize
]

{ #category : #benchmarking }
BGRegexDNA class >> regexdna: n [
	| output input |
	input  := BGFastaCache forFasta: n.
	output := TextStream with: ByteString new.
   self new regexDNA: input to: output.
   ^ output
]

{ #category : #'initialize-release' }
BGRegexDNA >> initialize [
	dictFactory := Dictionary.
	arrFact     := Array.
]

{ #category : #helper }
BGRegexDNA >> matchPatterns [
   | arr |
   arr := arrFact new: 9.
   arr at: 1 put: 'agggtaaa|tttaccct'.
   arr at: 2 put: '[cgt]gggtaaa|tttaccc[acg]'.
   arr at: 3 put: 'a[act]ggtaaa|tttacc[agt]t'.
   arr at: 4 put: 'ag[act]gtaaa|tttac[agt]ct'.
   arr at: 5 put: 'agg[act]taaa|ttta[agt]cct'.
   arr at: 6 put: 'aggg[acg]aaa|ttt[cgt]ccct'.
   arr at: 7 put: 'agggt[cgt]aa|tt[acg]accct'.
   arr at: 8 put: 'agggta[cgt]a|t[acg]taccct'.
   arr at: 9 put: 'agggtaa[cgt]|[acg]ttaccct'.
   ^ arr
]

{ #category : #helper }
BGRegexDNA >> occurrencesOfRegex: regex in: aString [
	| cnt |
	cnt := 0.
	aString regex: regex matchesCollect: [:match | cnt := cnt + 1].
	^ cnt
]

{ #category : #benchmarking }
BGRegexDNA >> regexDNA: sequence to: output [
   | s size1 size2 translation |
   size1 := sequence size.

   "* remove FASTA sequence descriptions and new-lines *"
   s := sequence copyWithRegex: '>\w*\s\w*\s\w*\s\w*\s|\s' matchesReplacedWith: ''.
   size2 := s size.

   "* regex match *"
   self matchPatterns do: [:each| 
      output 
         nextPutAll: each; space; 
         print: (self occurrencesOfRegex: each in: s); cr
      ]. 

   "* regex substitution *"
   translation := dictFactory new.
   self substitutionPatterns do: [:each| 
      translation at: each first put: each last].

   s := s copyWithRegex: '[', 
         ((arrFact withAll: translation keys) fold: [:a :b| a, b]), ']'
      matchesTranslatedUsing: [:l| translation at: l].

   output
      cr;
      print: size1; cr; 
      print: size2; cr; 
      print: s size; cr
]

{ #category : #helper }
BGRegexDNA >> substitutionPatterns [
    | arr |
    arr := arrFact new: 11.
    arr at:  1 put: (arrFact with: 'B' with: '(c|g|t)').
    arr at:  2 put: (arrFact with: 'D' with: '(a|g|t)').
    arr at:  3 put: (arrFact with: 'H' with: '(a|c|t)').
    arr at:  4 put: (arrFact with: 'K' with: '(g|t)').
    arr at:  5 put: (arrFact with: 'M' with: '(a|c)').
    arr at:  6 put: (arrFact with: 'N' with: '(a|c|g|t)').
    arr at:  7 put: (arrFact with: 'R' with: '(a|g)').
    arr at:  8 put: (arrFact with: 'S' with: '(c|g)').
    arr at:  9 put: (arrFact with: 'V' with: '(a|c|g)').
    arr at: 10 put: (arrFact with: 'W' with: '(a|t)').
    arr at: 11 put: (arrFact with: 'Y' with: '(c|t)').
    ^ arr
]
