"
ScriptStarter provides a startUp method and registers itself on the startUpList to enable scripting using command-line arguments.

The first argument on the command-line is used to identify a class on which #run: is invoked with the arguments as an array.

#run: can be used similar to classic main(String[] args) methods in other languages. 
"
Class {
	#name : #ScriptStarter,
	#superclass : #Object,
	#classVars : [
		'IsResuming',
		'QuitVM',
		'SafeBeforeQuit'
	],
	#category : 'Scripting'
}

{ #category : #helper }
ScriptStarter class >> executeRunFor: scriptClassName with: arguments [
	| scriptClass |
	scriptClass := Smalltalk classNamed: scriptClassName.
	scriptClass ifNotNil: [
		scriptClass run: arguments.
		QuitVM ifTrue: [
			Smalltalk snapshot: SafeBeforeQuit andQuit: true.
		].
	].
]

{ #category : #helper }
ScriptStarter class >> getSystemAttributes [
	| arguments arg i |
	arguments := OrderedCollection new.
	i := 2.
	[[arg := Smalltalk vm getSystemAttribute: i] value == nil]
		whileFalse: [arguments addLast: arg.
			i := i + 1].
	^ arguments
]

{ #category : #initialization }
ScriptStarter class >> initialize [
	"Automatically install ScriptStarter when the code is filed in."
	self install.
	
	QuitVM := true.
	SafeBeforeQuit := false.
	IsResuming := false.
]

{ #category : #'system startup entry' }
ScriptStarter class >> install [
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
				ifNotNil: [ :launcher |
					launcher readDocumentAtStartup: false
				]
			].
]

{ #category : #configuration }
ScriptStarter class >> quitVMAfterScriptExecution [
	^ QuitVM
]

{ #category : #configuration }
ScriptStarter class >> quitVMAfterScriptExecution: aBool [
	QuitVM := aBool
]

{ #category : #configuration }
ScriptStarter class >> saveImageBeforeQuit [
	^ SafeBeforeQuit
]

{ #category : #configuration }
ScriptStarter class >> saveImageBeforeQuit: aBool [
	SafeBeforeQuit := aBool
]

{ #category : #'system startup entry' }
ScriptStarter class >> startUp [
	"startUp is invoked during startup.
	 ScriptStarter has to be registered in the SystemDirectory's StartUpList
	 See ScriptStarter>>install"
	
	| arguments scriptClassName |
	"Ok, only, and really only during startup"
	IsResuming ifFalse: [ Transcript show: 'ScriptStarter did not execute a given script, since it assumes to be executed after a snapshot and not during startup.'.
		^ self. ].
	
	"First make sure that stdout output can be used if available."
	ScriptConsole detectAvailableMechanismForStdout.
	
	arguments := self getSystemAttributes.
	arguments size > 0
		ifTrue: [scriptClassName := arguments at: 1.
			self executeRunFor: scriptClassName with: arguments.]
]

{ #category : #'system startup entry' }
ScriptStarter class >> startUp: resuming [
	IsResuming := resuming.
	^ super startUp: resuming.
]

{ #category : #transporter }
ScriptStarter class >> transportersForFileOutMenu [
	^ { (Smalltalk at: #Transporter ifAbsent: [^#()])
			forPackage: (PackageInfo named: 'Scripting') }
]

{ #category : #'system startup entry' }
ScriptStarter class >> uninstall [
	"Will remove ScriptStarter from the StartUpList"
	Smalltalk removeFromStartUpList: ScriptStarter.
	
	self flag: 'TODO: restore original setting for readDocumentAtStartup, see >>install.'.
	Transcript show: 'You might need to restore the original setting for readDocumentAtStartup'.
]
