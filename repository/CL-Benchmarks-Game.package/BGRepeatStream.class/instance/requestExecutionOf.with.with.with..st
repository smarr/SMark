omni reflection
requestExecutionOf: aSel with: p1 with: p2 with: p3 
	<omniDoNotTransform>
	^ omniDomain
		requestExecution: p1
		with: p2
		with: p3
		of: aSel
		on: self