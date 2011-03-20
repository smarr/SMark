PBenchmarkReporter has not been documented yet. The class comment should describe the purpose of the class, its collaborations and its variables.

Instance Variables:
	runner	<PBenchmarkRunner>
	stream	<NSDecoderDeflateStream | SocketStream | ThreadSafeTranscript | WriteStream>
		
Example:

	f := TextStream on: String new.
	PBenchmarkSimpleStatisticsReporter reportFor: (PTestBenchmarkRunnerSuiteForAutosizing run: 10) on: f.
	f contents