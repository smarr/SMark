benchmarking
setup
 
	"Numbers in testParams represent the following:
 
	Column 1   number of internal repetitions for each test inside its block
	Column 2   thousands of iterations per second for a one-slopstone machine."
 
	output := TextStream with: String new.

	testParams := OrderedCollection new.
 
	testParams
		add: #(238 6600 'add integers');
		add: #( 34  240 'add floats');
		add: #( 60  882 'access strings');
		add: #( 20  352 'create objects');
		add: #( 10  107 'copy objects');
		add: #( 30  425 'perform selectors');
		add: #( 56  724 'evaluate blocks').
 
	testBlocks := OrderedCollection new.
 
	"In the integer addition test, I originally had 340 internal repetitions.
	This caused the Digitalk compiler to blow up. The ParcPlace compiler compiled
	it ok but interestingly addition performed at slightly more than 50% of the
	performance with an internal count of 238. Perhaps something magical happens
	at 256."

	testBlocks
		add: [1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+
			1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+
			1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+
			1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+
			1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+
			1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+
			1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1];
 
		add: [1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+
			1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0];
 
		add: ['a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1.
			'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1.
			'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1.
			'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1.
			'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1.
			'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1.
			'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1.
			'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1.
			'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1.
			'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1];
 
		add: [Object new. Object new. Object new. Object new. Object new.
			Object new. Object new. Object new. Object new. Object new.
			Object new. Object new. Object new. Object new. Object new.
			Object new. Object new. Object new. Object new. Object new];
 
		add: [Object new copy copy copy copy copy copy copy copy copy copy];
 
		add: [0 perform: #yourself. 0 perform: #yourself. 0 perform: #yourself.
			0 perform: #yourself. 0 perform: #yourself. 0 perform: #yourself.
			0 perform: #yourself. 0 perform: #yourself. 0 perform: #yourself.
			0 perform: #yourself. 0 perform: #yourself. 0 perform: #yourself.
			0 perform: #yourself. 0 perform: #yourself. 0 perform: #yourself.
			0 perform: #yourself. 0 perform: #yourself. 0 perform: #yourself.
			0 perform: #yourself. 0 perform: #yourself. 0 perform: #yourself.
			0 perform: #yourself. 0 perform: #yourself. 0 perform: #yourself.
			0 perform: #yourself. 0 perform: #yourself. 0 perform: #yourself.
			0 perform: #yourself. 0 perform: #yourself. 0 perform: #yourself];
 
		add: [[] value. [] value. [] value. [] value. [] value. [] value. [] value.
			[] value. [] value. [] value. [] value. [] value. [] value. [] value.
			[] value. [] value. [] value. [] value. [] value. [] value. [] value.
			[] value. [] value. [] value. [] value. [] value. [] value. [] value.
			[] value. [] value. [] value. [] value. [] value. [] value. [] value.
			[] value. [] value. [] value. [] value. [] value. [] value. [] value.
			[] value. [] value. [] value. [] value. [] value. [] value. [] value.
			[] value. [] value. [] value. [] value. [] value. [] value. [] value]