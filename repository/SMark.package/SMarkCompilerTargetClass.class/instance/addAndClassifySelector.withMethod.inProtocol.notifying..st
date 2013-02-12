accessing method dictionary
addAndClassifySelector: selector withMethod: compiledMethod inProtocol: aCategory notifying: requestor
	| priorMethodOrNil oldProtocol newProtocol |
	priorMethodOrNil := self compiledMethodAt: selector ifAbsent: [nil].
	self addSelectorSilently: selector withMethod: compiledMethod.
	oldProtocol := self organization categoryOfElement: selector.

	self classify: selector under: aCategory.

	newProtocol := self organization categoryOfElement: selector.