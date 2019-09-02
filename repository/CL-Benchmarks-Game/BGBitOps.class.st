Class {
	#name : #BGBitOps,
	#superclass : #Object,
	#category : 'CL-Benchmarks-Game-Meteor'
}

{ #category : #helpers }
BGBitOps class >> bitCountOfByte: anInt [
    "Count the number of bits set to 1 in a byte."

    ^#[0 1 1 2 1 2 2 3 1 2 2 3 2 3 3 4
       1 2 2 3 2 3 3 4 2 3 3 4 3 4 4 5
       1 2 2 3 2 3 3 4 2 3 3 4 3 4 4 5
       2 3 3 4 3 4 4 5 3 4 4 5 4 5 5 6
       1 2 2 3 2 3 3 4 2 3 3 4 3 4 4 5
       2 3 3 4 3 4 4 5 3 4 4 5 4 5 5 6
       2 3 3 4 3 4 4 5 3 4 4 5 4 5 5 6
       3 4 4 5 4 5 5 6 4 5 5 6 5 6 6 7
       1 2 2 3 2 3 3 4 2 3 3 4 3 4 4 5
       2 3 3 4 3 4 4 5 3 4 4 5 4 5 5 6
       2 3 3 4 3 4 4 5 3 4 4 5 4 5 5 6
       3 4 4 5 4 5 5 6 4 5 5 6 5 6 6 7
       2 3 3 4 3 4 4 5 3 4 4 5 4 5 5 6
       3 4 4 5 4 5 5 6 4 5 5 6 5 6 6 7
       3 4 4 5 4 5 5 6 4 5 5 6 5 6 6 7
       4 5 5 6 5 6 6 7 5 6 6 7 6 7 7 8] at: anInt + 1

    "Evaluate this expression to form above byte array:
    ((0 to: 255)
        collect: [:i | 
            | bitCount n |
            n := i.
            bitCount := 0.
            [n = 0]
                whileFalse:
                    [bitCount := bitCount + 1.
                    n := n bitAnd: n - 1].
            bitCount]
        as: ByteArray)"
]

{ #category : #helpers }
BGBitOps class >> byteReversed: anInt [
    "Answer the receiver with bits reversed in a byte.
    The receiver must be between 0 and 255.
    The constant has been obtained by this snippet:
    (0 to: 255) collect: [:e |
        | r |
        r := ((e bitAnd: 2r11110000) bitShift: -4) + ((e bitAnd: 2r00001111) bitShift: 4).
        r := ((r bitAnd: 2r11001100) bitShift: -2) + ((r bitAnd: 2r00110011) bitShift: 2).
        ((r bitAnd: 2r10101010) bitShift: -1) + ((r bitAnd: 2r01010101) bitShift: 1).] as: ByteArray"
    
    ^#[  0 128  64 192  32 160  96 224  16 144  80 208  48 176 112 240
         8 136  72 200  40 168 104 232  24 152  88 216  56 184 120 248
         4 132  68 196  36 164 100 228  20 148  84 212  52 180 116 244
        12 140  76 204  44 172 108 236  28 156  92 220  60 188 124 252
         2 130  66 194  34 162  98 226  18 146  82 210  50 178 114 242
        10 138  74 202  42 170 106 234  26 154  90 218  58 186 122 250
         6 134  70 198  38 166 102 230  22 150  86 214  54 182 118 246
        14 142  78 206  46 174 110 238  30 158  94 222  62 190 126 254
         1 129  65 193  33 161  97 225  17 145  81 209  49 177 113 241
         9 137  73 201  41 169 105 233  25 153  89 217  57 185 121 249
         5 133  69 197  37 165 101 229  21 149  85 213  53 181 117 245
        13 141  77 205  45 173 109 237  29 157  93 221  61 189 125 253
         3 131  67 195  35 163  99 227  19 147  83 211  51 179 115 243
        11 139  75 203  43 171 107 235  27 155  91 219  59 187 123 251
         7 135  71 199  39 167 103 231  23 151  87 215  55 183 119 247
        15 143  79 207  47 175 111 239  31 159  95 223  63 191 127 255] at: 1 + anInt
]
