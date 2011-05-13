benchmarking
newFor: anIS with: id start: s1 end: e1 rStart: s2 rEnd: e2
	"create new instance"

	| o |

"RVMOperations print: ('new RankThread: ', id asString, ' ', s1 asString, ' ', e1 asString, ' ', s2 asString, ' ', e2 asString)."

	o := self new.
	
	o initializeValues: anIS.
	
	o master: anIS.
	o id: id.
	o start: s1.
	o end: e1.
	o rStart: s2.
	o rEnd: e2.
	o localHist: (Array new: o maxKey).
	o state: 0.
	
	^o
"setPriority(Thread.MAX_PRIORITY);
setDaemon(true);"