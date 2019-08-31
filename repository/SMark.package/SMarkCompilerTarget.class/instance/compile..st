compiling
compile: aString
	target := self classFactory
		newSubclassOf: self class
		using: #().
	target compile: aString