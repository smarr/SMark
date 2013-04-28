helpers
in: dict at: key putValueOf: putBlock ifAbsentPutValueOf: absentBlock
   "* Set the value at key to be the value of evaluating putBlock
    with the existing value. If key is not found, create a new
    entry for key and set is value to the evaluation of
    absentBlock. Answer the result of evaluating either block. *"

   | assoc anObject |
   key == nil ifTrue:
      [^dict
         subscriptBoundsErrorFor: #at:putValueOf:ifAbsentPutValueOf:
         index: key
         value: absentBlock value].
   assoc := dict associationAt: key ifAbsent: nil.
   assoc == nil
      ifTrue:  [dict at: key put: (anObject := absentBlock value)]
      ifFalse: [assoc value: (anObject := putBlock value: assoc value)].
   ^anObject