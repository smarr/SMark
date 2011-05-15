as yet unclassified
testChameleonsResults
	self assert: (BGChameleons chameneos:         100) equals: 200. 
	self assert: (BGChameleons chameneos:     10000) equals: 20000.
	self assert: (BGChameleons chameneos: 1000000) equals: 2000000.