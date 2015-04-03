initialization
initialize: size
	perm := Array new: size.
	1 to: size do: [:i | perm at: i put: i ].
	timesRotated := Array new: size withAll: 0.
	atEnd := false