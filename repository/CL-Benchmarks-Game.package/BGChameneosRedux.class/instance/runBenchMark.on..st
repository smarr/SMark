public
runBenchMark: number on: anOutputStream 
   "self runBenchMark: 60000 on: Transcript."

   | firstTestColours secondTestColours blue red yellow creatures |
   blue   := colorFactory blue.
   red    := colorFactory red.
   yellow := colorFactory yellow.
   firstTestColours := arrayFactory 
            with: blue
            with: red
            with: yellow.
   secondTestColours := (collectionFactory new)
            add: blue;
            add: red;
            add: yellow;
            add: red;
            add: yellow;
            add: blue;
            add: red;
            add: yellow;
            add: red;
            add: blue;
            yourself.
   (colorFactory generateReportOfColoursOn: anOutputStream) cr.
   (self generateReportForColours: firstTestColours printOn: anOutputStream) 
      cr.
   creatures := self openMallWith: firstTestColours forNumberOfMeets: number.
   (self generateReportFor: creatures printOn: anOutputStream)
      cr;
      cr.
   (self generateReportForColours: secondTestColours printOn: anOutputStream) 
      cr.
   creatures := self openMallWith: secondTestColours forNumberOfMeets: number.
   (self generateReportFor: creatures printOn: anOutputStream)
      cr;
      cr.
	^ lastSum