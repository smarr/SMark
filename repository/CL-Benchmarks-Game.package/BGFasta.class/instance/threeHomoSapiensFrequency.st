benchmarking
threeHomoSapiensFrequency
	self
      writeFasta: 'THREE Homo sapiens frequency'
      from:
         (( randomStreamFact
            to: n*5
            on: (arrayFactory
                   with: (arrayFactory with: $a with: 0.3029549426680d0)
                   with: (arrayFactory with: $c with: 0.1979883004921d0)
                   with: (arrayFactory with: $g with: 0.1975473066391d0)
                   with: (arrayFactory with: $t with: 0.3015094502008d0))
          ) random: r;
            yourself).