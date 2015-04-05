hash
hashcode
	| result |
    result := 1.
    result := 31 * result + names hash.
    result := 31 * result + values hash.
    ^ result
