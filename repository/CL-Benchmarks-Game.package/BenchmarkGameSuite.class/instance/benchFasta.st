benchmarking
benchFasta
  | out |
  out := TextStream with: String new.
  BGFasta fasta: self problemSize asInteger to: out.