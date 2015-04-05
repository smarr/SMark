planning
chooseMethod: mark
	"Decide if I can be satisfied and which way I should flow based on the relative strength of the variables I relate, and record that decision."

	(v1 mark == mark) ifTrue:		"forward or nothing"
		[((v2 mark ~= mark) and: [strength stronger: v2 walkStrength]) 
			ifTrue: [ ^ direction := #forward ]
			ifFalse: [ ^ direction := nil ] ].

	(v2 mark == mark) ifTrue:		"backward or nothing"
		[((v1 mark ~= mark) and: [strength stronger: v1 walkStrength])
			ifTrue: [ ^ direction := #backward ]
			ifFalse: [ ^ direction := nil ] ].

	"if we get here, neither variable is marked, so we have choice"
	(v1 walkStrength weaker: v2 walkStrength)
		ifTrue:
			[(strength stronger: v1 walkStrength)
				ifTrue: [ ^ direction := #backward ]
				ifFalse: [ ^ direction := nil ]]
		ifFalse:
			[(strength stronger: v2 walkStrength)
				ifTrue: [ ^ direction := #forward ]
				ifFalse: [ ^ direction := nil ]]. 