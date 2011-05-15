benchmarking
benchFannkuchRedux
   | f |
   f := BGFannkuchRedux fannkuchRedux: self problemSize asInteger to: (TextStream with: String new).
   ScriptConsole print: 'Pfannkuchen(', self problemSize asString , ') = ', f asString.
   ^f