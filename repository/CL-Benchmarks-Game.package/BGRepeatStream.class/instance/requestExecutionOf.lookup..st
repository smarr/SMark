omni reflection
requestExecutionOf: t1 lookup: t2 
	<omniDoNotTransform>
	^ omniDomain
		requestExecutionOf: t1
		lookup: t2
		on: self