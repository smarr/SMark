initialize-release
makeNext
	| temp remainder |
	"* Generate the next permutation. *"
	2 to: perm size do: [ :r |
		"* Rotate the first r items to the left. *"
		temp := perm at: 1.
		1 to: r - 1 do: [ :i | perm at: i put: (perm at: i + 1) ].
		perm at: r put: temp.

		timesRotated at: r put: (((timesRotated at: r) + 1) rem: r).
		remainder := timesRotated at: r.
		remainder = 0 ifFalse: [ ^self ].

		"* After r rotations, the first r items are in their original positions.
		 Go on rotating the first r+1 items. *"
	].

	"* We are past the final permutation. *"
	atEnd := true.