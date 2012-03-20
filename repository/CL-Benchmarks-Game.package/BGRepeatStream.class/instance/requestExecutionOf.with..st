omni reflection
requestExecutionOf: t1 with: t2 
	<omniDoNotTransform>
	^ omniDomain
		requestExecution: t1
		of: self
		on: t2