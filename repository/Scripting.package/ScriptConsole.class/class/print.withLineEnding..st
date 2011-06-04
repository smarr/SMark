as yet unclassified
print: somethingAsString withLineEnding: lineEnd
	"Will output the somethingAsString to stdout using one of the available mechansims and to the transcript if requested"
	| output |
	output := somethingAsString asString.
	
	PrintTarget ifNotNil: [
		IsRVM ifTrue: [ PrintTarget print: output. ]
			   ifFalse: [ PrintTarget nextPutAll: (output, lineEnd) ].
	].

	(OutputToTranscript or: [PrintTarget isNil])
		ifTrue: [
			Transcript show: output, lineEnd.
		].