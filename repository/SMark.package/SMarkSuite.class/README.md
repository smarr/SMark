A Benchmark Suite is a set of benchmarks and it knows what exactly needs to be executed.
However, it does not really know how to execute it.
It knows all the magic, that is, how to set up and tear down the environment for the benchmarks, but does not have the knowledge of how many iterations need to be done and how to evaluate any results that might be produced.

Usage:

Choose a suite (i.e. one of my subclasses) and use the class-side #run or run: messages.

To get an example print the result of the following expression:
	
	SMarkCompiler run: 10
	
	SMarkLoops runOnly: #benchArrayAccess
