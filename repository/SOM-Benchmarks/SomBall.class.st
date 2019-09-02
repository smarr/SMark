Class {
	#name : #SomBall,
	#superclass : #Object,
	#instVars : [
		'x',
		'y',
		'xVel',
		'yVel'
	],
	#category : 'SOM-Benchmarks'
}

{ #category : #benchmark }
SomBall >> bounce [
        | xLimit yLimit bounced |
        xLimit  := yLimit := 500.
        bounced := false.
        
        x := x + xVel.
        y := y + yVel.
        (x > xLimit)
            ifTrue: [ x := xLimit. xVel := 0 - xVel abs. bounced := true ].
        (x < 0)
            ifTrue: [ x := 0.      xVel := xVel abs.     bounced := true ].
        (y > yLimit)
            ifTrue: [ y := yLimit. yVel := 0 - yVel abs. bounced := true ].
        (y < 0)
            ifTrue: [ y := 0.      yVel := yVel abs.     bounced := true ].
        ^bounced
]

{ #category : #initialization }
SomBall >> initialize [
        x := SomRandom next % 500.
        y := SomRandom next % 500.
        xVel := (SomRandom next % 300) - 150.
        yVel := (SomRandom next % 300) - 150.
]
