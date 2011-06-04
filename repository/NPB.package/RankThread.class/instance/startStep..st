running
startStep: aStep
	self critical: [
		self state: aStep.
		self notify.
	].