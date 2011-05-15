public
runBenchMark: number on: anOutputStream 
   "self runBenchMark: 60000 on: Transcript."

   | firstTestColours secondTestColours blue red yellow creatures |
   blue := BGChameneosColour blue.
   red := BGChameneosColour red.
   yellow := BGChameneosColour yellow.
   firstTestColours := Array 
            with: blue
            with: red
            with: yellow.
   secondTestColours := (OrderedCollection new)
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
   (BGChameneosColour generateReportOfColoursOn: anOutputStream) cr.
   (self generateReportForColours: firstTestColours printOn: anOutputStream) 
      cr.
   creatures := BGMall openMallWith: firstTestColours forNumberOfMeets: number.
   (self generateReportFor: creatures printOn: anOutputStream)
      cr;
      cr.
   (self generateReportForColours: secondTestColours printOn: anOutputStream) 
      cr.
   creatures := BGMall openMallWith: secondTestColours forNumberOfMeets: number.
   (self generateReportFor: creatures printOn: anOutputStream)
      cr;
      cr.
	^ lastSum