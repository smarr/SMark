benchmarking
benchFannkuchRedux
   | f problemSize |
	problemSize := self problemSize
		ifNotNilDo: [:ps | ps ]
		ifNil: [ BGFannkuchRedux defaultProblemSize ].
   f := BGFannkuchRedux fannkuchRedux: problemSize to: (TextStream with: ByteString new).
   
	" the output should only be done by some reporter"
	"ScriptConsole print: 'Pfannkuchen(', problemSize asString , ') = ', f asString."
   ^f