instance creation
double: aDouble
	aDouble ifNil: [ self error: 'aDouble nil' ].
	^ JSJsonNumber new: (self cutOffPointZero: aDouble asString)