parsing-private
read
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