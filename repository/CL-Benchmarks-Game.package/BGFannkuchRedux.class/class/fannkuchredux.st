benchmark scripts
fannkuchredux
   | n f |
   n := 4.
   f := self new fannkuchRedux: n to: (TextStream with: String new).
   ScriptConsole println: 'Pfannkuchen(', n printString, ') = ', f asString.
   ^''