tests
testFannkuchReduxResult
	 | f |
	f := BGFannkuchRedux fannkuchRedux: 7 to: (TextStream with: String new).
	self assert: f equals: 16