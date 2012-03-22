omni reflection
requestExecutionOf: aSel with: p1 with: p2 with: p3 with: p4 with: p5
	<omniDoNotTransform>
	^ omniDomain
		requestExecution: p1
		with: p2
		with: p3
		with: p4
		with: p5
		of: aSel
		on: self