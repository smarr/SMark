helper
matchPatterns
   | arr |
   arr := arrFact new: 9.
   arr at: 1 put: 'agggtaaa|tttaccct'.
   arr at: 2 put: '[cgt]gggtaaa|tttaccc[acg]'.
   arr at: 3 put: 'a[act]ggtaaa|tttacc[agt]t'.
   arr at: 4 put: 'ag[act]gtaaa|tttac[agt]ct'.
   arr at: 5 put: 'agg[act]taaa|ttta[agt]cct'.
   arr at: 6 put: 'aggg[acg]aaa|ttt[cgt]ccct'.
   arr at: 7 put: 'agggt[cgt]aa|tt[acg]accct'.
   arr at: 8 put: 'agggta[cgt]a|t[acg]taccct'.
   arr at: 9 put: 'agggtaa[cgt]|[acg]ttaccct'.
   ^ arr