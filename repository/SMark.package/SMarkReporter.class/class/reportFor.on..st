reporting
reportFor: aRunner on: aStream
	| reporter |
	reporter := self new
		runner: aRunner;
		outputStream: aStream;
		report; yourself.
	^ reporter.