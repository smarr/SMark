Class {
	#name : #SomWhileLoop,
	#superclass : #SomBenchmark,
	#category : 'SOM-Benchmarks-LanguageFeatures'
}

{ #category : #benchmarking }
SomWhileLoop >> benchmark [
        | sum |
        sum := 0.
        [sum < 20000]
            whileTrue:
                [sum := sum + self singleRun].
        ^ sum
]

{ #category : #benchmarking }
SomWhileLoop >> singleRun [
        | sum |
        sum := 0.
        [sum < 1000]
            whileTrue:
                [sum := sum + 1].
        ^ sum
]

{ #category : #benchmarking }
SomWhileLoop >> verifyResult: result [
      ^ 20000 = result
]
