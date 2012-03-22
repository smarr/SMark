omni reflection
requestExecutionOf: aSel with: p1 with: p2 with: p3 with: p4 with: p5 with: p6 with: p7 with: p8 with: p9 with: p10
	<omniDoNotTransform>
	^ omniDomain
		requestExecution: p1
		with: p2
		with: p3
		with: p4
		with: p5
		with: p6
		with: p7
		with: p8 with: p9 with: p10
		of: aSel
		on: self