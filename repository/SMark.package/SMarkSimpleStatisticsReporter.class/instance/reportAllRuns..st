reporting
reportAllRuns: aListOfResults
	| data convidenceVariance significantDigits quantum total stdev totalSignificantDigits|

	stream << 'total: '.

	data := self totalResultsFor: aListOfResults.
	convidenceVariance := self confidenceVariance: data.  
	
	"only print significant "
	significantDigits := self significantDigits: convidenceVariance.
	quantum := (1/10 asFloat) raisedTo: significantDigits.
	
	"round to significantDigits"
	stdev := convidenceVariance roundTo: quantum.
	
	total := (data average roundTo: quantum) printString.
	totalSignificantDigits := total size - (total indexOf: $.).
	stream << total.
	"check if the last digit is 0 => padding"
	(totalSignificantDigits < significantDigits) ifTrue: [
	 	(significantDigits - totalSignificantDigits) 
			timesRepeat: [ stream << '0']].
	stream << ' +/-' << stdev.