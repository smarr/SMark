benchmarking
fasta
	" self fasta"
  | out |
  out := TextStream with: ByteString new.
  self fasta: self defaultProblemSize to: out.
  ^out contents