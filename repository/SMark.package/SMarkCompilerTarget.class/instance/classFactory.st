accessing
classFactory
	^ classFactory ifNil: [ classFactory := ClassFactoryForTestCase new ]