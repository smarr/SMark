benchmarking
buildTreeDepth: depth
        count := count + 1.
        ^(depth = 1) 
            ifTrue:  [ Array new: (SomRandom next rem: 10 + 1) ]
            ifFalse: [
	             | arr |
	             arr := Array new: 4.
	             1 to: 4 do: [:i | arr at: i put: (self buildTreeDepth: depth - 1).
		          arr ] ]
