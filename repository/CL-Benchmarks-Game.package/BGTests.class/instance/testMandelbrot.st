tests
testMandelbrot
	| result |
	
	result := BGMandelbrot new mandelbrot2: 200.
	result reset. "set possition to beginning"
	
	self assert: result contents equals: BGMandelbrot output.