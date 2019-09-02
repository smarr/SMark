Class {
	#name : #BGMandelbrot,
	#superclass : #Object,
	#category : 'CL-Benchmarks-Game'
}

{ #category : #defaults }
BGMandelbrot class >> defaultProblemSize [
	^ 200
]

{ #category : #'test data' }
BGMandelbrot class >> output [
	^ 'UDQKMjAwIDIwMAoAAAAAAAAAAAAAAAAAAAAAAAACAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAF8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAfAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAv4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP/4AAAAAAAAAAAAAAAAAAAAAAAAAAAAABf/+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP//0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAD///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAf//4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAf//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAD///gAAAAAAAAAAAAAAAAAAAAAAAAAAAAF///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAA///+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAD///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAC///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAA///5AAAAAAAAAAAAAAAAAAAAAAAAAAAAAD///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAf//gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD//4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAf/8AAAAAAAAAAAAAAAAAAAAAAAABAAEAAH/+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAwAf+ARggAAAAAAAAAAAAAAAAAAAAAAACQY////WAAAAAAAAAAAAAAAAAAAAAAAAAAGjP////sAgAAAAAAAAAAAAAAAAAAAAAAgF6//////p4AAAAAAAAAAAAAAAAAAAAAUIB///////+fAAAAAAAAAAAAAAAAAAAAALGAP///////3gAQAAAAAAAAAAAAAAAAAAC/w2////////wAAAAAAAAAAAAAAAAAAAAAH8H/////////AAAAAAAAAAAAAAAAAAAAAD/l/////////2AYkAAAAAAAAAAAAAAAAAE/7//////////gfuAAAAAAAAAAAAAAAAAB/9//////////6H/AAAAAAAAAAAAAAAAAAP////////////j/gAAAAAAAAAAAAAAAAAB////////////9/4AAAAAAAAAAAAAAAAAAH////////////v+AAAAAAAAAAAAAAAAAAAP/////////////wAAAAAAAAAAAAAAAAAAP/////////////+AAAAAAAAAAAAAAAAAAf/////////////8AAAAAAAAAAAAAAAAAAz/////////////+gAAAAAAAAAAAAAAAAAP/////////////8AAAAAAAAAAAAAAAACAB//////////////wAAAAAAAAAAAAAAAAEcv/////////////6AAAAAAAAAAAAAAAAB/f//////////////YAAAAAAAAAAAAAAAAn///////////////8AAAAAAAAAAAAAAAAI////////////////QAAAAAAAAAAAAAAAAv///////////////3AAAAAAAAAAAAAAAAD////////////////gAAAAAAAAAAAAAAAAf///////////////oAAAAAAAAAAAAAAAAH///////////////8AAAAAAAAAAAAAAABF////////////////hAAAAAAAAAAAAAAAB////////////////9AAAAAAAAAAAAAAAKf////////////////cAAAAAAAAAAAAAAH//////////////////gAAAAAAAAAAAAAAf/////////////////+AAAAAAAAAAAAAAH/////////////////+AAAAAAAAAAAAAAAf/////////////////AAAAAAAAAAAAAABX////////////////+gAAAAAAAAAEAAAAD/////////////////wAAAAAAAgACBgAA+/////////////////4AAAAAAAAAB4AAAD//////////////////AAAAAAAHoA8AAAAf/////////////////8AAAAAAA/GHMyAAD/////////////////+AAAAAAAfi//cAAA//////////////////gAAAAAAX9///AAB//////////////////4AAAAAAA////5AAP//////////////////gAAAAAAP////wAD//////////////////4AAAAAAC////+QD///////////////////wAAAAAA/////4AP/////////////////8AAAAAABf/////AH//////////////////gAAAAAAP/////4D//////////////////8AAAAADX//////g//////////////////8AAAAAAP//////wH//////////////////gAAAAAH///////j//////////////////4AAAAAAf//////w///////////////////gAAAAAP//////+P/////////////////+gAAAAAP///////j//////////////////wAAAAAD///////8//////////////////8AAAAAAf///////P//////////////////AAAAAAP///////z/////////////////+wAAAAAD///////+//////////////////gAAAAZB////////v/////////////////8AAAAH+f/////////////////////////8AAAAB/j/////////////////////////+gAAAA////////////////////////////gAAAAP///////////////////////////wAAAAH///////////////////////////wAAAAH///////////////////////////wAAA/////////////////////////////wAAAAAf///////////////////////////AAAAAB///////////////////////////8AAAAAP///////////////////////////wAAAAD///////////////////////////+AAAAAf4//////////////////////////oAAAAH+f/////////////////////////8AAAABkH///////+//////////////////wAAAAAA////////v/////////////////4AAAAAAP///////z/////////////////+wAAAAAB///////8//////////////////8AAAAAA////////P//////////////////AAAAAAP///////j//////////////////wAAAAAA///////4//////////////////6AAAAAAH//////8P//////////////////4AAAAAH///////j//////////////////4AAAAAA///////Af/////////////////+AAAAAA1//////4P//////////////////AAAAAAAP/////4D//////////////////8AAAAAAF/////8Af/////////////////+AAAAAAAP////+AD//////////////////AAAAAAAC////+QD///////////////////wAAAAAA/////AAP//////////////////gAAAAAAP///+QAD//////////////////4AAAAAAX9///AAB//////////////////4AAAAAAB+L/9wAAD/////////////////+AAAAAAAPxhzMgAA//////////////////gAAAAAAHoA8AAAAf/////////////////8AAAAAAAAAHgAAAP/////////////////8AAAAAAAIAAgYAAPv////////////////+AAAAAAAAAAEAAAAD/////////////////wAAAAAAAAAAAAAAFf////////////////6AAAAAAAAAAAAAAAH/////////////////wAAAAAAAAAAAAAAH/////////////////+AAAAAAAAAAAAAAB//////////////////4AAAAAAAAAAAAAB//////////////////4AAAAAAAAAAAAAAKf////////////////cAAAAAAAAAAAAAAAH////////////////0AAAAAAAAAAAAAAARf///////////////4QAAAAAAAAAAAAAAAH///////////////8AAAAAAAAAAAAAAAAB///////////////+gAAAAAAAAAAAAAAAA////////////////4AAAAAAAAAAAAAAAAv///////////////3AAAAAAAAAAAAAAAAj///////////////9AAAAAAAAAAAAAAAAJ////////////////AAAAAAAAAAAAAAAAB/f//////////////YAAAAAAAAAAAAAAAARy//////////////oAAAAAAAAAAAAAAAAgAf/////////////8AAAAAAAAAAAAAAAAAAP/////////////8AAAAAAAAAAAAAAAAAADP/////////////6AAAAAAAAAAAAAAAAAAH//////////////AAAAAAAAAAAAAAAAAAAP/////////////+AAAAAAAAAAAAAAAAAAA//////////////AAAAAAAAAAAAAAAAAAB////////////7/gAAAAAAAAAAAAAAAAAB////////////9/4AAAAAAAAAAAAAAAAAA////////////+P+AAAAAAAAAAAAAAAAAAf/f/////////+h/wAAAAAAAAAAAAAAAAAE/7//////////gfuAAAAAAAAAAAAAAAAAAP+X/////////YBiQAAAAAAAAAAAAAAAAAB/B/////////wAAAAAAAAAAAAAAAAAAAAC/w2////////wAAAAAAAAAAAAAAAAAAAAAsYA////////eABAAAAAAAAAAAAAAAAAAAFCAf///////nwAAAAAAAAAAAAAAAAAAAAAAgF6//////p4AAAAAAAAAAAAAAAAAAAAAAAAaM////+wCAAAAAAAAAAAAAAAAAAAAAAAAkGP///1gAAAAAAAAAAAAAAAAAAAAAAAAAAAwAf+ARggAAAAAAAAAAAAAAAAAAAAAEAAQAAf/4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAH//AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD//4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAB//+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA///8AAAAAAAAAAAAAAAAAAAAAAAAAAAAA///5AAAAAAAAAAAAAAAAAAAAAAAAAAAAAL///AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA///8AAAAAAAAAAAAAAAAAAAAAAAAAAAAA///+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAX///AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA///4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAf//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAB///gAAAAAAAAAAAAAAAAAAAAAAAAAAAAA///8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAP//0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAF//4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAv4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAfAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAF8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAegAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==' base64Decoded
]

{ #category : #benchmarking }
BGMandelbrot >> mandelbrot2: n [
   | output outputArray |
   (output := MultiByteBinaryOrTextStream with: ByteString new)
      nextPutAll: 'P4'; lf; print: n; space; print: n; lf";
      binary".

	outputArray := Array new: n * n / 8.

   self mandelbrot2: n to: outputArray.

	output nextPutAll: outputArray.

   ^ output
]

{ #category : #benchmarking }
BGMandelbrot >> mandelbrot2: extent to: output [
   | limit2 m bits zr zi cr ci i tr stepr stepi  outputI |
   limit2 := 4.0d0.
   m := 50.

	outputI := 1.

   stepr := 2.0d0 / extent.
   stepi := 2.0d0 / extent.

   0 to: extent - 1 do: [ :y |
       bits := 0.
       ci := stepi * y asFloat - 1.0d0.
       0 to: extent - 1 do: [ :x |
           cr := stepr * x asFloat - 1.5d0.
           zr := cr. zi := ci.

           bits := bits bitShift: 1.
           i := 1.  
           [
               tr := (zr*zr) - (zi*zi) + cr.
               zi := 2.0d0 * zr * zi + ci.
               zr := tr.
               (zr*zr) + (zi*zi) < limit2 and: [ (i := i + 1) < m ]
           ] whileTrue.

           i = m ifTrue: [ bits := bits + 1 ].
           (x bitAnd: 7) == 7 ifTrue: [
               output at: outputI put: bits.
               outputI := outputI + 1.
               bits := 0.
           ]
       ]. 
       (extent bitAnd: 7) == 0 ifFalse: [
           bits := bits bitShift: 8 - (extent bitAnd: 7).
           output at: outputI put: bits.
           outputI := outputI + 1.
       ]
   ]


]
