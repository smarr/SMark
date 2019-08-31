accessing
classFactory
	| tmp2 |
	tmp2 := classFactory.
	^ tmp2
		ifNil: [ classFactory := ClassFactoryForTestCase new ]
		ifNotNil: [ tmp2 ]