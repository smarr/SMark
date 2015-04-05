helper
cutOffPointZero: str
    (str endsWith: '.0') ifTrue: [ ^ str substringFrom: 1 to: str length - 2].
    ^ str