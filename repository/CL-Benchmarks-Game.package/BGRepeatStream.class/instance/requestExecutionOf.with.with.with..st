omni reflection
requestExecutionOf: t1 with: t2 with: t3 with: t4 
	<omniDoNotTransform>
	^ omniDomain
		requestExecutionOf: t1
		on: self
		with: t2
		with: t3
		with: t4