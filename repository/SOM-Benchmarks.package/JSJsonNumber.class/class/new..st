as yet unclassified
new: string
    string ifNil: [ self error: 'string is null' ].
    ^ self new initializeWith: string
