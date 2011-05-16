reporting
reportResult: anArrayOfResults for: aCriterion of: benchmark
	| convidenceVariance significantDigits quantum total stdev totalSignificantDigits outputLine |

	outputLine := benchmark, ' ', aCriterion, ': iterations=', 
	              anArrayOfResults size asString, ' runtime: '.
	
	anArrayOfResults size < 2 ifTrue: [
		total := anArrayOfResults average printString.
		outputLine := outputLine, total, 'ms'.
		stream << outputLine.
		^ self.
	].
	
	convidenceVariance := self confidenceVariance: anArrayOfResults.  
	
	"only print significant "
	significantDigits := self significantDigits: convidenceVariance.
	quantum := (1/10 asFloat) raisedTo: significantDigits.
	
	"round to significantDigits"
	stdev := convidenceVariance roundTo: quantum.
	
	total := (anArrayOfResults average roundTo: quantum) printString.
	totalSignificantDigits := total size - (total indexOf: $.).

	outputLine := outputLine, total.
	
	"check if the last digit is 0 => padding"
	(totalSignificantDigits < significantDigits) ifTrue: [
	 	(significantDigits - totalSignificantDigits) 
			timesRepeat: [ outputLine := outputLine, '0']].
	outputLine := outputLine, 'ms'.
	
	stream << outputLine.
	stream << ' +/-' << stdev.