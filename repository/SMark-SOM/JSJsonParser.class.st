Class {
	#name : #JSJsonParser,
	#superclass : #Object,
	#instVars : [
		'input',
		'index',
		'line',
		'column',
		'current',
		'captureBuffer',
		'captureStart',
		'exceptionBlock'
	],
	#category : 'SMark-SOM-Json'
}

{ #category : #'instance creation' }
JSJsonParser class >> with: aJsonString [
    ^ self basicNew initializeWith: aJsonString
]

{ #category : #'parsing-private' }
JSJsonParser >> endCapture [
    | captured |
    '' = captureBuffer
      ifTrue:  [ captured := input copyFrom: captureStart to: index - 1 ]
      ifFalse: [
        self pauseCapture.
        captured := captureBuffer.
        captureBuffer := '' ].
    captureStart := -1.
    
    ^ captured
]

{ #category : #'error handling' }
JSJsonParser >> error: message [
    'error:' print.
    message print.
    ':' print.
    line print.
    column println.
    exceptionBlock value: (JSParseException with: message at: index
                                          line: line    column: column )
  
]

{ #category : #'error handling' }
JSJsonParser >> expected: expected [
    self isEndOfText ifTrue: [
      self error: 'Unexpected end of input, expected ', expected asString
    ].
    self error: 'Expected ', expected
]

{ #category : #initialization }
JSJsonParser >> initializeWith: string [
    input := string.
    index := 0.
    line  := 1.
    column := 0.
    current := nil.
    captureBuffer := ''.
]

{ #category : #testing }
JSJsonParser >> isDigit [
    current = '0' ifTrue: [^ true].
    current = '1' ifTrue: [^ true].
    current = '2' ifTrue: [^ true].
    current = '3' ifTrue: [^ true].
    current = '4' ifTrue: [^ true].
    current = '5' ifTrue: [^ true].
    current = '6' ifTrue: [^ true].
    current = '7' ifTrue: [^ true].
    current = '8' ifTrue: [^ true].
    current = '9' ifTrue: [^ true].
    ^ false
]

{ #category : #testing }
JSJsonParser >> isEndOfText [
    ^ current isNil
]

{ #category : #testing }
JSJsonParser >> isWhiteSpace [
    current = ' '  ifTrue: [^ true].
    current = '\t' ifTrue: [^ true].
    current = '\n' ifTrue: [^ true].
    current = '\r' ifTrue: [^ true].
    ^ false
]

{ #category : #parsing }
JSJsonParser >> parse [
    | result |
    exceptionBlock := [:ex | ^ ex ].
    self read.
    self skipWhiteSpace.
    result := self readValue.
    self skipWhiteSpace.
    self isEndOfText ifFalse: [ self error: 'Unexpected character'].
    ^ result
]

{ #category : #'parsing-private' }
JSJsonParser >> pauseCapture [
    captureBuffer := captureBuffer concatenate: (
      input substringFrom: captureStart to: index - 1).
    captureStart := -1
]

{ #category : #'parsing-private' }
JSJsonParser >> read [
	"TODO: this is probably broken"
    current = '\n' ifTrue: [
      line := line + 1.
      column := 0.
    ].
    
    index := index + 1.
    column := column + 1.

    input ifNil: [ self error:'input nil'].
    index <= input size
      ifTrue:  [ current := input copyFrom: index to: index ]
      ifFalse: [ current := nil ]
]

{ #category : #'parsing-private' }
JSJsonParser >> readArray [
    | array |
    self read.
    array := JSJsonArray new.
    
    "Array might be empty"
    self skipWhiteSpace.
    (self readChar: ']') ifTrue: [
      ^ array
    ].
    
    self readArrayElement: array.
    [self readChar: ','] whileTrue: [
      self readArrayElement: array.
    ].

    (self readChar: ']') ifFalse: [
      self expected: '"," or "]"'
    ].
    ^ array
]

{ #category : #'parsing-private' }
JSJsonParser >> readArrayElement: array [
    self skipWhiteSpace.
    array add: self readValue.
    self skipWhiteSpace.
]

{ #category : #'parsing-private' }
JSJsonParser >> readChar: ch [
    current = ch ifFalse: [ ^ false ].
    self read.
    ^ true
]

{ #category : #'parsing-private' }
JSJsonParser >> readDigit [
    self isDigit ifFalse: [ ^ false ].
    self read.
    ^ true
]

{ #category : #'parsing-private' }
JSJsonParser >> readEscape [
    self read.    
    captureBuffer := captureBuffer concatenate: self readEscapeChar.
    self read
]

{ #category : #'parsing-private' }
JSJsonParser >> readEscapeChar [
    current = '"'  ifTrue: [ ^ '"'  ].
    current = '/'  ifTrue: [ ^ '/'  ].
    current = '\\' ifTrue: [ ^ '\\' ].

    current = 'b'  ifTrue: [ ^ '\b'  ].
    current = 'f'  ifTrue: [ ^ '\f'  ].
    current = 'n'  ifTrue: [ ^ '\n'  ].
    current = 'r'  ifTrue: [ ^ '\r'  ].
    current = 't'  ifTrue: [ ^ '\t'  ].

    "TODO: SOM doesn't have a way to create unicode characters."
    self expected: 'valid escape sequence. note, some are not supported'

]

{ #category : #'parsing-private' }
JSJsonParser >> readExponent [
    ((self readChar: 'e') not and: [
      (self readChar: 'E') not]) ifTrue: [ ^ false ].
    
    
    (self readChar: '+') ifFalse: [ self readChar: '-' ].
    
    self readDigit ifFalse: [ self expected: 'digit' ].

    [self readDigit] whileTrue: [].

    ^ true
]

{ #category : #'parsing-private' }
JSJsonParser >> readFalse [
    self read.
    self readRequiredChar: 'a'.
    self readRequiredChar: 'l'.
    self readRequiredChar: 's'.
    self readRequiredChar: 'e'.
    ^ JSJsonLiteral FALSE
]

{ #category : #'parsing-private' }
JSJsonParser >> readFraction [
    (self readChar: '.') ifFalse: [ ^ false ].
    
    self readDigit ifFalse: [ self expected: 'digit' ].
    
    [self readDigit] whileTrue: [].

    ^ true
]

{ #category : #'parsing-private' }
JSJsonParser >> readName [
    current = '"' ifFalse: [ self expected: 'name' ].
    ^ self readStringInternal
]

{ #category : #'parsing-private' }
JSJsonParser >> readNull [
    self read.
    self readRequiredChar: 'u'.
    self readRequiredChar: 'l'.
    self readRequiredChar: 'l'.
    ^ JSJsonLiteral NULL
]

{ #category : #'parsing-private' }
JSJsonParser >> readNumber [
    | firstDigit |
    self startCapture.
    self readChar: '-'.
    firstDigit := current.
    
    self readDigit ifFalse: [ self expected: 'digit' ].
    firstDigit ~= '0' ifTrue: [ [self readDigit] whileTrue: []].
        
    self readFraction.
    self readExponent.
    ^ JSJsonNumber new: self endCapture
]

{ #category : #'parsing-private' }
JSJsonParser >> readObject [
    | object |
    self read.
    object := JSJsonObject new.
    self skipWhiteSpace.

    (self readChar: '}') ifTrue: [
      ^ object
    ].
    
    self readObjectKeyValuePair: object.
    [self readChar: ','] whileTrue: [
      self readObjectKeyValuePair: object.
    ].
    
    (self readChar: '}') ifFalse: [
      self expected: '"," or "}"'
    ].
    
    ^ object
]

{ #category : #'parsing-private' }
JSJsonParser >> readObjectKeyValuePair: object [
    | name |
    self skipWhiteSpace.
    name := self readName.
    self skipWhiteSpace.
  
    (self readChar: ':') ifFalse: [ self expected: ':' ].
  
    self skipWhiteSpace.
  
    object add: name with: self readValue.
  
    self skipWhiteSpace
]

{ #category : #'parsing-private' }
JSJsonParser >> readRequiredChar: ch [
    (self readChar: ch) ifFalse: [
      self expected: 'character: ' + ch
    ]
]

{ #category : #'parsing-private' }
JSJsonParser >> readString [
    ^ JSJsonString new: self readStringInternal
]

{ #category : #'parsing-private' }
JSJsonParser >> readStringInternal [
    | string |
    self read.
    self startCapture.
    
    [current = '"'] whileFalse: [
      current = '\\' ifTrue: [
        self pauseCapture.
        self readEscape.
        self startCapture.
      ] ifFalse: [
        "if (current < 0x20) { throw expected('valid string character'); }"
        "we currently don't have a way to get the ordinal value for a character"
        "} else {"
        self read.
      ]
    ].
    string := self endCapture.
    self read.
    ^ string
]

{ #category : #'parsing-private' }
JSJsonParser >> readTrue [
    self read.
    self readRequiredChar: 'r'.
    self readRequiredChar: 'u'.
    self readRequiredChar: 'e'.
    ^ JSJsonLiteral TRUE
]

{ #category : #'parsing-private' }
JSJsonParser >> readValue [
    current = 'n' ifTrue: [ ^ self readNull   ].
    current = 't' ifTrue: [ ^ self readTrue   ].
    current = 'f' ifTrue: [ ^ self readFalse  ].
    current = '"' ifTrue: [ ^ self readString ].
    current = '[' ifTrue: [ ^ self readArray  ].
    current = '{' ifTrue: [ ^ self readObject ].
    
    "Is this really the best way to write this?, or better #or:?,
     but with all the nesting, it's just ugly."
    current = '-' ifTrue: [ ^ self readNumber ].
    current = '0' ifTrue: [ ^ self readNumber ].
    current = '1' ifTrue: [ ^ self readNumber ].
    current = '2' ifTrue: [ ^ self readNumber ].
    current = '3' ifTrue: [ ^ self readNumber ].
    current = '4' ifTrue: [ ^ self readNumber ].
    current = '5' ifTrue: [ ^ self readNumber ].
    current = '6' ifTrue: [ ^ self readNumber ].
    current = '7' ifTrue: [ ^ self readNumber ].
    current = '8' ifTrue: [ ^ self readNumber ].
    current = '9' ifTrue: [ ^ self readNumber ].
    
    "else"
    self expected: 'value'
]

{ #category : #'parsing-private' }
JSJsonParser >> skipWhiteSpace [
    [ self isWhiteSpace ]
      whileTrue:
        [ self read ].
]

{ #category : #'parsing-private' }
JSJsonParser >> startCapture [
    captureStart := index
]
