omni reflection
requestExecutionOf: t1 with: t2 
	<omniDoNotTransform>
	^ omniDomain
		requestExecutionOf: t1
		on: self
		with: t2