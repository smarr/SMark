Class {
	#name : #JSParseException,
	#superclass : #Object,
	#instVars : [
		'msg',
		'offset',
		'line',
		'column'
	],
	#category : 'SOM-Benchmarks-Json'
}

{ #category : #converting }
JSParseException >> asString [ ^ msg, ':', line, ':', column
]

{ #category : #accessing }
JSParseException >> column [ ^ column
]

{ #category : #initialization }
JSParseException >> initializeWith: message at: anOffset line: aLine column: aColumn [
    msg    := message.
    offset := anOffset.
    line   := aLine.
    column := aColumn.
]

{ #category : #accessing }
JSParseException >> line [ ^ line
]

{ #category : #accessing }
JSParseException >> message [ ^ msg
]

{ #category : #accessing }
JSParseException >> offset [ ^ offset
]
