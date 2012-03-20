omni reflection
requestExecutionOf: t1 with: t2 with: t3 
	<omniDoNotTransform>
	^ omniDomain
		requestExecution: t1
		with: self
		of: t2
		on: t3