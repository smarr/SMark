benchmark scripts
fannkuchredux
   | n f |
   n := 4.
   f := self new fannkuchRedux: n to: (TextStream with: ByteString new).
   ScriptConsole println: 'Pfannkuchen(', n printString, ') = ', f asString.
   ^''