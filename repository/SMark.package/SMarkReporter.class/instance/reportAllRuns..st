reporting
reportAllRuns: aListOfResults
	aListOfResults do: [:result |
		result criteria keysAndValuesDo: [:benchName :timer |
			stream << benchName << ': ' << (timer totalTime asString, 'ms'); cr.
			]  
		]