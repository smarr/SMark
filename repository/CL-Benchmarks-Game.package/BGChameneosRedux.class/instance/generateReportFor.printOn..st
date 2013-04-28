reporting
generateReportFor: creatures printOn: stream 
   | sum |
   sum := creatures inject: 0 into: [:accum :each | accum + each creaturesMet].
   creatures do: 
         [:aCreature | 
         aCreature creaturesMet printOn: stream.
         stream
            space;
            nextPutAll: (mallFactory units at: aCreature selfMet + 1);
            cr].
   stream space.
   sum printString 
      do: [:el | stream nextPutAll: (mallFactory units at: el digitValue + 1)]
      separatedBy: [stream space].
	lastSum := sum.
   ^ stream