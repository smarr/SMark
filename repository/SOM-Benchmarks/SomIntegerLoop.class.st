Class {
	#name : #SomIntegerLoop,
	#superclass : #SomBenchmark,
	#category : 'SOM-Benchmarks-LanguageFeatures'
}

{ #category : #benchmarking }
SomIntegerLoop >> benchmark [
        | bounds a |
        bounds := 20000.
        bounds negated to: bounds by: 1 do: [:value | a := value-value].
        ^ a
]

{ #category : #benchmarking }
SomIntegerLoop >> verifyResult: result [
      ^ 0 = result
]
