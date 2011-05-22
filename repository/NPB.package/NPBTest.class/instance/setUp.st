running
setUp
	"Necessary for Squeak 4.2 compatibility, since method anotations are not supported in the base image."
	(self respondsTo:  #timeout:) ifTrue: [
		self timeout: 300.
	].