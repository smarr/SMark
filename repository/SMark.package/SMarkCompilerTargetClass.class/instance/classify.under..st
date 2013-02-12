compatibility Pharo 1.4 vs. 2.0
classify: selector under: aCategory
	"Use image specific approach Pharo 1.4 vs. Pharo 2.0"
	| classify |
	classify := [self organization classify: selector under: aCategory].

	"Pharo 1.4"
	(Smalltalk at: #SystemChangeNotifier ifPresent: [:cls |
		^ cls uniqueInstance doSilently: classify ]).
	
	"Pharo 2.0"
	^ SystemAnnouncer uniqueInstance suspendAllWhile: classify.