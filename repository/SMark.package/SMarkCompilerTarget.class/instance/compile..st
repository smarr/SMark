compiling
compile: arg1
	target := self classFactory newSubclassOf: self class using: #().
	target compile: arg1