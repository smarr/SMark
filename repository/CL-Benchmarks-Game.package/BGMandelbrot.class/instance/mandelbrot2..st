benchmarking
mandelbrot2: n
   | output outputArray |
   (output := MultiByteBinaryOrTextStream with: ByteString new)
      nextPutAll: 'P4'; lf; print: n; space; print: n; lf";
      binary".

	outputArray := Array new: n * n / 8.

   self mandelbrot2: n to: outputArray.

	output nextPutAll: outputArray.

   ^ output