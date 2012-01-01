benchmarking
binarytrees: n to: output
   | minDepth maxDepth stretchDepth check longLivedTree iterations |
   minDepth := 4.
   maxDepth := minDepth + 2 max: n.
   stretchDepth := maxDepth + 1.

   check := (btFactory bottomUpTree: 0 depth: stretchDepth) itemCheck.
   output
      nextPutAll: 'stretch tree of depth '; print: stretchDepth; tab;
      nextPutAll: ' check: '; print: check; cr.

   longLivedTree := btFactory bottomUpTree: 0 depth: maxDepth
.
	self buildTreesFrom: minDepth to: maxDepth reportTo: output.   

	check := longLivedTree itemCheck.

   output
      nextPutAll: 'long lived tree of depth '; print: maxDepth; tab;
      nextPutAll: ' check: '; print: check; cr.
	
	^ check.