Class {
	#name : #NBBody,
	#superclass : #Object,
	#instVars : [
		'x',
		'y',
		'z',
		'vx',
		'vy',
		'vz',
		'mass'
	],
	#classVars : [
		'solarMass'
	],
	#category : 'SMark-SOM-NBody'
}

{ #category : #'as yet unclassified' }
NBBody class >> DaysPerYear [
	^ 365.24
]

{ #category : #'as yet unclassified' }
NBBody class >> Pi [
	^ 3.141592653589793
]

{ #category : #'as yet unclassified' }
NBBody class >> SolarMass [
	^ solarMass
]

{ #category : #'as yet unclassified' }
NBBody class >> initialize [
	"self initialize"
	solarMass := 4 * self Pi * self Pi.
	
]

{ #category : #'as yet unclassified' }
NBBody class >> jupiter [
		| b |
       b := super new.
       b x:    4.8414314424647209.
       b y:   -1.16032004402742839.
       b z:   -0.103622044471123109.
       b vx:   0.00166007664274403694   * self DaysPerYear.
       b vy:   0.00769901118419740425   * self DaysPerYear.
       b vz:  -0.0000690460016972063023 * self DaysPerYear.
       b mass: 0.000954791938424326609  * self SolarMass.
       ^ b
]

{ #category : #'as yet unclassified' }
NBBody class >> neptune [
		| b |
       b := super new.
       b x:   15.3796971148509165.
       b y:  -25.9193146099879641.
       b z:    0.179258772950371181.
       b vx:   0.00268067772490389322   * self DaysPerYear.
       b vy:   0.00162824170038242295   * self DaysPerYear.
       b vz:  -0.000095159225451971587  * self DaysPerYear.
       b mass: 0.0000515138902046611451 * self SolarMass.
       ^ b
]

{ #category : #'as yet unclassified' }
NBBody class >> new [
	| b |
        b := super new.
        b x: 0.0.  b vx: 0.0.
        b y: 0.0.  b vy: 0.0.
        b z: 0.0.  b vz: 0.0.
        b mass: 0.0.
        ^ b
]

{ #category : #'as yet unclassified' }
NBBody class >> saturn [ 
		| b |
       b := super new.
       b x:    8.34336671824457987.
       b y:    4.12479856412430479.
       b z:   -0.403523417114321381.
       b vx:  -0.00276742510726862411   * self DaysPerYear.
       b vy:   0.00499852801234917238   * self DaysPerYear.
       b vz:   0.0000230417297573763929 * self DaysPerYear.
       b mass: 0.000285885980666130812  * self SolarMass.
       ^ b
]

{ #category : #'as yet unclassified' }
NBBody class >> sun [ 
		| b |
       b := self new.
       b mass: self SolarMass.
       ^ b
]

{ #category : #'as yet unclassified' }
NBBody class >> uranus [
		| b |
       b := super new.
       b x:   12.894369562139131.
       b y:  -15.1111514016986312.
       b z:   -0.223307578892655734.
       b vx:   0.00296460137564761618   * self DaysPerYear.
       b vy:   0.0023784717395948095    * self DaysPerYear.
       b vz:  -0.0000296589568540237556 * self DaysPerYear.
       b mass: 0.0000436624404335156298 * self SolarMass.
       ^ b
]

{ #category : #'as yet unclassified' }
NBBody >> mass [ ^ mass
]

{ #category : #'as yet unclassified' }
NBBody >> mass: val [
	mass := val
]

{ #category : #'as yet unclassified' }
NBBody >> offsetMomentumX: px y: py z: pz [
       vx := 0.0 - (px / NBBody SolarMass).
       vy := 0.0 - (py / NBBody SolarMass).
       vz := 0.0 - (pz / NBBody SolarMass).
]

{ #category : #'as yet unclassified' }
NBBody >> vx [ ^ vx
]

{ #category : #'as yet unclassified' }
NBBody >> vx: val [
	vx := val
]

{ #category : #'as yet unclassified' }
NBBody >> vy [ ^ vy
]

{ #category : #'as yet unclassified' }
NBBody >> vy: val [
	vy := val
]

{ #category : #'as yet unclassified' }
NBBody >> vz [ ^ vz
]

{ #category : #'as yet unclassified' }
NBBody >> vz: val [
	vz := val
]

{ #category : #'as yet unclassified' }
NBBody >> x [ ^ x
]

{ #category : #'as yet unclassified' }
NBBody >> x: val [
	x := val
]

{ #category : #'as yet unclassified' }
NBBody >> y [ ^ y
]

{ #category : #'as yet unclassified' }
NBBody >> y: val [
	y := val
]

{ #category : #'as yet unclassified' }
NBBody >> z [ ^ z
]

{ #category : #'as yet unclassified' }
NBBody >> z: val [
	z := val
]
