accessing method dictionary
addAndClassifySelector: aSelector withMethod: aCompiledMethod inProtocol: aCategory
	self == SMarkCompilerTarget ifTrue: [
		^ super
				addAndClassifySelector: aSelector
				withMethod: aCompiledMethod
				inProtocol: aCategory ].
	self
		addSelectorSilently: aSelector
		withMethod: aCompiledMethod