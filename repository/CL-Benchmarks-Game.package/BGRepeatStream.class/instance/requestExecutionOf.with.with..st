omni reflection
requestExecutionOf: aSel with: p1 with: p2
	<omniDoNotTransform>
	^ omniDomain
		requestExecution: p1
		with: p2
		of: aSel
		on: self