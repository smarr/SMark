"
Simple example for how to use ScriptStarter.

HelloWorld prints all arguments given to #run:.
"
Class {
	#name : #HelloWorld,
	#superclass : #Object,
	#category : 'Scripting-Examples'
}

{ #category : #'script entry' }
HelloWorld class >> run: arguments [ 
	ScriptConsole print: 'Hello World!'.
	arguments
		do: [:elem | ScriptConsole print: elem].
	SmalltalkImage current snapshot: false andQuit: true
]
