system startup entry
install
	"Will register ScriptStarter on the StartUpList to activate it on VM startup."
	| pref |
	Smalltalk addToStartUpList: ScriptStarter.
	
	"Disable the loading of documents on startup"
	pref := Smalltalk at: #Preferences ifAbsent: [nil].
	pref	ifNotNil: [
			(pref respondsTo: #disable:)
				ifTrue: [	pref disable: #readDocumentAtStartup. ]
			]
		ifNil: [
			(Smalltalk globals at: #AbstractLauncer ifAbsent: [nil])
				ifNotNilDo: [:launcher |
					launcher readDocumentAtStartup: false
				]
			].