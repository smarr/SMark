system startup entry
install
	"Will register ScriptStarter on the StartUpList to activate it on VM startup."
	Smalltalk addToStartUpList: ScriptStarter.
	
	"Disable the loading of documents on startup"
	(Smalltalk globals at: #Preferences ifAbsent: [nil])
		ifNotNilDo: [:pref |
			(pref respondsTo: #disable:)
				ifTrue: [	pref disable: #readDocumentAtStartup. ]
			]
		ifNil: [
			(Smalltalk globals at: #AbstractLauncer ifAbsent: [nil])
				ifNotNilDo: [:launcher |
					launcher readDocumentAtStartup: false
				]
			].