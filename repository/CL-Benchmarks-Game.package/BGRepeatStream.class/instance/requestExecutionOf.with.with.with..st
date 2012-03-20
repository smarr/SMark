omni reflection
requestExecutionOf: t1 with: t2 with: t3 with: t4 
	<omniDoNotTransform>
	^ omniDomain
		requestExecution: t1
		with: self
		with: t2
		of: t3
		on: t4