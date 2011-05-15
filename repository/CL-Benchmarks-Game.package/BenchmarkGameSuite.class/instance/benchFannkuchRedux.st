benchmarking
benchFannkuchRedux
   | f problemSize |
	problemSize := self problemSize ifNotNilDo: [:ps | ps asInteger ]
										  ifNil: [ BGFannkuchRedux defaultProblemSize ].
   f := BGFannkuchRedux fannkuchRedux: problemSize to: (TextStream with: String new).
   ScriptConsole print: 'Pfannkuchen(', problemSize asString , ') = ', f asString.
   ^f