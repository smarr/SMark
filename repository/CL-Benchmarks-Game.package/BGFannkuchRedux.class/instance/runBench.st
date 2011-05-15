as yet unclassified
runBench
   | f |
   f := BGFannkuchRedux fannkuchRedux: self problemSize asInteger to: (TextStream with: String new).
   RVMOperations print: 'Pfannkuchen(', self problemSize asString , ') = ', f asString.
   ^f