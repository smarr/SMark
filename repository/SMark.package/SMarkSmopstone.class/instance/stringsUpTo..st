stone benchmarks
stringsUpTo: n 
	"Return a collection of strings representing the integers from 1 
	to n with their digits reversed. 
	 
	This method tests the efficiency of creating small streams, performing 
	string operations, and building collections. It includes a gross kludge 
	to coerce portability between ST80 and ST/V. They vary slightly in the 
	selector used to reverse collections. Subsequent to freezing this code, 
	someone pointed out that it could have been written more simply 
	without   using perform:. It could also have been simplified using 
	select:. It 
	was too late to change. The techniques are left as an exercise for the 
	reader."

	| selector |
	(arrFact with: #reverse with: #reversed)
		do: [:symbol | (String canUnderstand: symbol)
			ifTrue: [selector := symbol]].
	^ (intervalFact from: 1 to: n)
		collect: [:m | m printString perform: selector]