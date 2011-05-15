as yet unclassified
runBench
  | out |
  out := TextStream with: String new.
  BGFasta fasta: problemSize asInteger to: out.