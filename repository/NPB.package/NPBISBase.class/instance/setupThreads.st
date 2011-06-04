initialization
setupThreads
	"Initialize the threads/processes for the benchmark"
	
	| start end remainder offset rStart rEnd rRemainder rOffset rThread |
	
	start := 0. end := 0. remainder := totalKeys \\ numThreads. offset := 0.
	rStart := 0. rEnd := 0. rRemainder := maxKey \\ numThreads. rOffset := 0.
	
	rankThreads := Array new: numThreads.
	
	1 to: numThreads do: [ :i |
		| zeroIdx |
		zeroIdx := i - 1.
		start := (zeroIdx * ((totalKeys / numThreads) asInteger)) + offset.
		end :=  ((zeroIdx * ((totalKeys / numThreads) asInteger))) + ((totalKeys / numThreads) asInteger) - 1 + offset.
		(remainder > 0) ifTrue: [
			remainder := remainder - 1.
			offset := offset + 1.
			end := end + 1].
		
		rStart := (zeroIdx * ((maxKey / numThreads) asInteger)) + rOffset.
		rEnd := ((zeroIdx * ((maxKey / numThreads) asInteger))) + ((maxKey / numThreads) asInteger) -1 + rOffset.
		
		(rRemainder > 0) ifTrue: [
			rRemainder := rRemainder - 1.
			rOffset := rOffset + 1.
			rEnd := rEnd + 1].
		
		rThread := RankThread newFor: self with: i start: (start + 1) end: (end + 1) rStart: (rStart + 1) rEnd: (rEnd + 1).
		rankThreads at: i put: rThread.
		rThread rankThreads: rankThreads.
		rThread start.
	].