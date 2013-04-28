benchmarking
mandelbrot2: n
   | output |
   (output := MultiByteBinaryOrTextStream with: String new)
      nextPutAll: 'P4'; lf; print: n; space; print: n; lf";
      binary".

   self mandelbrot2: n to: output.
   ^ output