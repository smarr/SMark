accessing
randomFirst
	"Robert Jenkins' 32 bit integer hash function."
	 seed := self as32BitSigned: ((seed       + 16r7ed55d16)       + (self as32BitSigned: ((seed bitAnd: 16rffffffff) << 12))).
    seed := self as32BitSigned: ((seed bitXor: 16rc761c23c) bitXor: ((seed bitAnd: 16rffffffff) >> 19)).
    seed := self as32BitSigned: ((seed       + 16r165667B1)       + (self as32BitSigned: ((seed bitAnd: 16rffffffff) <<  5))).
    seed := self as32BitSigned: ((seed       + 16rd3a2646c) bitXor: (self as32BitSigned: ((seed bitAnd: 16rffffffff) <<  9))).
    seed := self as32BitSigned: ((seed       + 16rfd7046c5)       + (self as32BitSigned: ((seed bitAnd: 16rffffffff) <<  3))).
    seed := self as32BitSigned: ((seed bitXor: 16rb55a4f09) bitXor: ((seed bitAnd: 16rffffffff) >> 16)).
    ^ seed