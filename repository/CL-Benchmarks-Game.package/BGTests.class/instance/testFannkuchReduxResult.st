tests
testFannkuchReduxResult
	 | f |
	f := BGFannkuchRedux fannkuchRedux: 7 to: (TextStream with: ByteString new).
	self assert: f equals: 16