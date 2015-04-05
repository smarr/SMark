instance creation
readFrom: str 
	^ (JSJsonParser with: str) parse