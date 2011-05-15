benchmark scripts
fasta
	" self fasta"
  | out |
  out := TextStream with: String new.
  self fasta: 1000 to: out.
  ^out contents