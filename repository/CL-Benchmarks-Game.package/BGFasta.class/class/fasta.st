benchmarking
fasta
	" self fasta"
  | out |
  out := TextStream with: String new.
  self fasta: self defaultProblemSize to: out.
  ^out contents