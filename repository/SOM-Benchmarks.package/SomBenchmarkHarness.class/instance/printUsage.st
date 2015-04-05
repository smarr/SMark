as yet unclassified
printUsage
  ScriptConsole << 'TODO [benchmarks] [num-iterations [warm-up [inner-iter]]]'; cr.
  ScriptConsole cr.
  ScriptConsole << '  benchmarks     - list of benchmark class names (e.g.: Queens Fibonacci Dispatch)'; cr.
  ScriptConsole << '  num-iterations - number of times each benchmark is executed, default: 1'; cr.
  ScriptConsole << '  warm-up        - number of times each benchmark is executed before measuring, default: 0'; cr.
  ScriptConsole << '  inner-iter     - number of times each benchmark is executed in an inner loop, which is measured in total, default: 1'; cr.