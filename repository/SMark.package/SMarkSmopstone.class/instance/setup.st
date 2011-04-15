benchmarking
setUp
	"modified by nishis"

	"Numbers in testParams represent the approximate number of seconds it
	takes to run the tests for a one-smopstone machine.

	Numbers in testBlocks are parameters tuned for each test. Do not
	change them. The times for several tests depend on them non-linearly."

	| primes strings set |
	
	output := TextStream with: String new.

	testParams := OrderedCollection new.
 
	IsSupportRecursiveBlock 
		ifTrue: 
			[testParams
				add: #(3.157 'generating fractonaccis');
				add: #(1.123 'generating primes');
				add: #(1.091 'generating and parsing streams');
				add: #(3.091 'generating strings');
				add: #(1.167 'forming sets');
				add: #(5.139 'sorting strings');
				add: #(5.601 'sorcerer''s apprentice')] 
		ifFalse: 
			[testParams
				add: #(3.157 'generating fractonaccis');
				add: #(1.123 'generating primes*');
				add: #(1.091 'generating and parsing streams');
				add: #(3.091 'generating strings');
				add: #(1.167 'forming sets');
				add: #(5.139 'sorting strings');
				add: #(5.601 'sorcerer''s apprentice*')].

	testBlocks := OrderedCollection new.

	testBlocks
		add: [self fractonacci: 13/2];
		add: [primes := self primesUpTo: 9000];	"7351 - 1"
		add: [self streamTestsOn: primes];
		add: [strings := self stringsUpTo: 8000];
		add: [set := self setFrom: strings];
		add: [self sort: set];
		add: [self sorcerersApprentice]