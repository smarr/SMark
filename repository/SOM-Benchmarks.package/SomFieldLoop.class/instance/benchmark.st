benchmarking
benchmark
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