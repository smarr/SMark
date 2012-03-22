omni reflection
requestExecutionOf: aSel with: p1
	<omniDoNotTransform>
	^ omniDomain
		requestExecution: p1
		of: aSel
		on: self