Class {
	#name : #HeadlessSave,
	#superclass : #Object,
	#category : 'Scripting'
}

{ #category : #'script entry' }
HeadlessSave class >> run: arguments [ 
	| proc |
	proc := [
		| basicName newName |
		ScriptConsole println: 'Do wait, let system run non-busy, and then save and quit'.
		(Delay forSeconds: 10) wait.
		ScriptConsole println: 'Do headless save now.'.
		basicName := SmalltalkImage current imageName withoutLast: '.image' size.
		newName := basicName, '-headless.image'.
		SmalltalkImage current saveAs: newName.
		SmalltalkImage current snapshot: false andQuit: true.
		] newProcess.
	
	proc priority: Processor userBackgroundPriority.
	proc resume.

]
