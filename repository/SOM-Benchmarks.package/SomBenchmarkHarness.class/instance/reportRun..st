as yet unclassified
reportRun: bench
        ScriptConsole << (bench name, ': iterations=',
						        bench numIterations asString,
						        ' average: ',
						        (bench total / bench numIterations) asString,
						        'us total: ',
						        bench total asString, 'us'); cr