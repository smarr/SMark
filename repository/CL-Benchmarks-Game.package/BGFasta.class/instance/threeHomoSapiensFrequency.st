benchmarking
threeHomoSapiensFrequency
	self
      writeFasta: 'THREE Homo sapiens frequency'
      from:
         (( randomStreamFact
            to: n*5
            on: #(   #($a 0.3029549426680d0)
                  #($c 0.1979883004921d0)
                  #($g 0.1975473066391d0)
                  #($t 0.3015094502008d0)))
            random: r;
            yourself).