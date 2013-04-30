benchmarking
regexDNA: sequence to: output
   | s size1 size2 translation |
   size1 := sequence size.

   "* remove FASTA sequence descriptions and new-lines *"
   s := sequence copyWithRegex: '>\w*\s\w*\s\w*\s\w*\s|\s' matchesReplacedWith: ''.
   size2 := s size.

   "* regex match *"
   self matchPatterns do: [:each| 
      output 
         nextPutAll: each; space; 
         print: (self occurrencesOfRegex: each in: s); cr
      ]. 

   "* regex substitution *"
   translation := dictFactory new.
   self substitutionPatterns do: [:each| 
      translation at: each first put: each last].

   s := s copyWithRegex: '[', 
         ((arrayFactory withAll: translation keys) fold: [:a :b| a, b]), ']'
      matchesTranslatedUsing: [:l| translation at: l].

   output
      cr;
      print: size1; cr; 
      print: size2; cr; 
      print: s size; cr