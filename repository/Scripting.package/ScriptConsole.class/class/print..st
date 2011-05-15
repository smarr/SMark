as yet unclassified
print: aString
	"Will output the string to stdout using one of the available mechansims and to the transcript if requested"
	PrintAStringBlock ifNotNil: [
		PrintAStringBlock value: aString.
	].

	(OutputToTranscript or: [PrintAStringBlock isNil])
		ifTrue: [
			Transcript show: aString.  
		].