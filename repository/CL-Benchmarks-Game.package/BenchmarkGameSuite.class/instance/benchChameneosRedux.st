benchmarking
benchChameneosRedux
	| result report |

	report := TextStream with: String new.
	result := BGMall runBenchMark: self problemSize asInteger on: report.
	
	"Result should be 2*problemSize"
	self flag: 'TODO: adapt once verification is supported'.
	result = (2 * self problemSize asInteger) ifFalse: [
		ScriptConsole print: self class name, ' benchmark failed. Input: ',
								 runner processes asString, ' Output: ', result asString  ].