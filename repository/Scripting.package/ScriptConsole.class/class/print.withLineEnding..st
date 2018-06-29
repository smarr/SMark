printing
print: somethingAsString withLineEnding: lineEnd
	"Will output the somethingAsString to stdout using one of the available mechansims and to the transcript if requested"
	| output |
	output := somethingAsString asString.
	Position := Position + output size.
	output size > 0 ifTrue: [
		LastPrintedChar := output last].
	
	PrintTarget ifNotNil: [
		IsRVM
			ifTrue: [ PrintTarget print: output. ]
			ifFalse: [
				PrintTarget
					nextPutAll: output;
					nextPutAll: lineEnd ].
	].

	(OutputToTranscript or: [PrintTarget isNil])
		ifTrue: [
			Transcript show: output, lineEnd.
		].