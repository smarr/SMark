as yet unclassified
onCog: cogSpecificBlock else: general
	^ (SmalltalkImage current vmVersion includesSubString: 'Cog VM')
		ifTrue:  [cogSpecificBlock value]
		ifFalse: [general value]