accessing
random
	"Robert Jenkins' 32 bit integer hash function."
	 seed := ((seed       + 16r7ed55d16)       + (seed << 12)).
    seed := ((seed bitXor: 16rc761c23c) bitXor: ((seed bitAnd: 16rffffffff) >> 19)).
    seed := ((seed       + 16r165667B1)       + (seed <<  5)).
    seed := ((seed       + 16rd3a2646c) bitXor: (seed <<  9)).
    seed := ((seed       + 16rfd7046c5)       + (seed <<  3)).
    seed := self as32BitSigned: ((seed bitXor: 16rb55a4f09) bitXor: ((seed bitAnd: 16rffffffff) >> 16)).
    ^ seed