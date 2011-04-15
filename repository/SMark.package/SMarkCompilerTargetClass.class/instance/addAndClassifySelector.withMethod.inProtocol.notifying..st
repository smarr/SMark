as yet unclassified
addAndClassifySelector: selector withMethod: compiledMethod inProtocol: aCategory notifying: requestor
	| priorMethodOrNil oldProtocol newProtocol |
	priorMethodOrNil := self compiledMethodAt: selector ifAbsent: [nil].
	self addSelectorSilently: selector withMethod: compiledMethod.
	oldProtocol := self organization categoryOfElement: selector.
	SystemChangeNotifier uniqueInstance 
		doSilently: [self organization classify: selector under: aCategory].
	newProtocol := self organization categoryOfElement: selector.