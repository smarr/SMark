Class {
	#name : #SomFieldLoop,
	#superclass : #SomBenchmark,
	#instVars : [
		'counter'
	],
	#category : 'SOM-Benchmarks-LanguageFeatures'
}

{ #category : #benchmarking }
SomFieldLoop >> benchmark [
        | iter |
        counter := 0.
        iter := 20000.

        [ iter > 0 ] whileTrue: [
          iter := iter - 1.
          counter := counter + 1.
          counter := counter + 1.
          counter := counter + 1.
          counter := counter + 1.
          counter := counter + 1.
          
          counter := counter + 1.
          counter := counter + 1.
          counter := counter + 1.
          counter := counter + 1.
          counter := counter + 1.
          
          counter := counter + 1.
          counter := counter + 1.
          counter := counter + 1.
          counter := counter + 1.
          counter := counter + 1.
          
          counter := counter + 1.
          counter := counter + 1.
          counter := counter + 1.
          counter := counter + 1.
          counter := counter + 1.
          
          counter := counter + 1.
          counter := counter + 1.
          counter := counter + 1.
          counter := counter + 1.
          counter := counter + 1.
          
          counter := counter + 1.
          counter := counter + 1.
          counter := counter + 1.
          counter := counter + 1.
          counter := counter + 1.
        ].
        
        ^ counter
]

{ #category : #benchmarking }
SomFieldLoop >> verifyResult: result [
      ^ 600000 = result
]
