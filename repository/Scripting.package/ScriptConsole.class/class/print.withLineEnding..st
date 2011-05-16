as yet unclassified
print: somethingAsString withLineEnding: lineEnd
	"Will output the somethingAsString to stdout using one of the available mechansims and to the transcript if requested"
	| output |
	output := somethingAsString asString.
	
	PrintAStringBlock ifNotNil: [
		PrintAStringBlock value: output value: lineEnd.
	].

	(OutputToTranscript or: [PrintAStringBlock isNil])
		ifTrue: [
			Transcript show: output, lineEnd.
		].