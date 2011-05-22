tests
testKeyArrayContent
	| o keyArray |
	o := NPBIS newOfSizeClass: #S with: 0 serial: true.
	o initKeys: NPBIS amult.
	
	keyArray := o keyArray.
	
	self assert: (keyArray at: 65536) equals: 962.
	self assert:	(keyArray at: 65535) equals: 677.
	self assert: (keyArray at: 30001) equals: 557.
	self assert: (keyArray at: 1) equals: 1585.
	self assert: (keyArray at: 2) equals: 825.
	self assert: (keyArray at: 12) equals: 1140.
