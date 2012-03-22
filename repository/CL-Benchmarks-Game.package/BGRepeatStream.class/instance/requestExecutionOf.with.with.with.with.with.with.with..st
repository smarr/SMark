omni reflection
requestExecutionOf: aSel with: p1 with: p2 with: p3 with: p4 with: p5 with: p6 with: p7
	<omniDoNotTransform>
	^ omniDomain
		requestExecution: p1
		with: p2
		with: p3
		with: p4
		with: p5
		with: p6
		with: p7
		of: aSel
		on: self