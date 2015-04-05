benchmarking
verifyResult: array
        ((array at: 1) ~= smallest)
            | ((array at: array size) ~= largest)
                ifTrue: [
						self error: 'Array is not sorted. smallest: ', smallest asString,
									   ' largest: ', largest asString, ' [1]: ', (array at: 1) asString,
									   ' [l]: ', (array at: array length) asString ].
        3 to: (array size) do: [ :i |
            (array at: i - 1) > (array at: i) 
                ifTrue: [
						self error: 'Array is not sorted. [', i asString, ' - 1]: ',
										(array at: i - 1) asString,
										' [', i asString, ']: ', (array at: i) asString]. ].
        ^ true