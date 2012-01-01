benchmark scripts
nbody: times
	"self nbody: 1000"
 	^ self nbody: times with: BGNBodySystem new