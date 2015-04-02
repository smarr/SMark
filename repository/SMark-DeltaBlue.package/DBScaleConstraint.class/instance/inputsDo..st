planning
inputsDo: aBlock
	"Evaluate the given block on my current input variable."

	(direction == #forward)
		ifTrue: [ aBlock value: v1.
					 aBlock value: scale.
					 aBlock value: offset]
		ifFalse: [ aBlock value: v2.
					  aBlock 	value: scale. 
					  aBlock 	value: offset].