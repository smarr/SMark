catalog
catalogDescription
	"Returns a paragraph describing the project"
	^ '!SMark - Write Benchmarks like Tests

SMark is the attempt to build a common benchmarking framework for Smalltalk.

It inspired by unit testing in SUnit and following this idea, a benchmark is implemented by adding ==#benchMyBenchmark== to a subclass of ==SMarkSuite==. This enables performance regression tracking in the same way as unit-testing allows to track functional regressions.

The code is originally based on ==PBenchmark==, the benchmark framework used for the PinocchioVM and ==RoarBenchmark==, a framework used for performance regression testing of the *RoarVM>https://github.com/smarr/RoarVM*.

Other sources of inspiration are for instance the *Caliper>http://code.google.com/p/caliper/* microbenchmarking framework for Java.

The name choice of SMark is deliberately confusable with smark (as defined by the urban dictionary: Noun. A person who is being scamed but is in on the prank. Someone who knows they are being tricked. Its origin is from the term "mark" and is the shortened form of the phrase "smart mark".) freely following the old wisdom: "Lies, Damn Lies, and --Statistics-- Benchmarks"'