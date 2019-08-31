accessing method dictionary
addAndClassifySelector: arg1 withMethod: arg2 inProtocol: arg3
	self == SMarkCompilerTarget
		ifFalse: [ ^ super
				addAndClassifySelector: arg1
				withMethod: arg2
				inProtocol: arg3 ].
	self addSelectorSilently: arg1 withMethod: arg3