SMarkLoops implements a set of microbenchmarks measuring a number of basic aspects such as message send, instance field access, and array access cost.

Example use:
  (SMarkLoops new runOnly: #benchFloatLoop) run: 10 