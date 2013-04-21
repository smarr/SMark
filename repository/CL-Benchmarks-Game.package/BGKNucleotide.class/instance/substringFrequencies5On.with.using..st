as yet unclassified
substringFrequencies5On: aSeq with: aLength using: aDictionary

   | buffer |
   buffer := String new: aLength.
   1 to: aSeq size - aLength + 1 do:
      [:i |
         | answer |
         buffer replaceFrom: 1 to: aLength with: aSeq startingAt: i.
         answer := self
			    in: aDictionary
            at: buffer
            putValueOf: [:sum | sum + 1]
            ifAbsentPutValueOf: 1.
         answer = 1 ifTrue: [buffer := String new: aLength].
      ].
   ^aDictionary