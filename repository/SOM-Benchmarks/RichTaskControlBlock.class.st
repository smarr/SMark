"
A task control block manages a task and the queue of work packages associated with it.
"
Class {
	#name : #RichTaskControlBlock,
	#superclass : #RichTaskState,
	#instVars : [
		'link',
		'identity',
		'priority',
		'input',
		'function',
		'handle'
	],
	#category : 'SOM-Benchmarks-Richards'
}

{ #category : #'instance creation' }
RichTaskControlBlock class >> link: link create: identity priority: priority initialWorkQueue: initialWorkQueue initialState: initialState function: aBlock privateData: privateData [ 
    ^ self new
		link: link
		identity: identity
		priority: priority
		initialWorkQueue: initialWorkQueue
		initialState: initialState
		function: aBlock
		privateData: privateData
]

{ #category : #scheduling }
RichTaskControlBlock >> addInput: packet checkPriority: oldTask [
    RichObject NoWork == input
	ifTrue: 
	    [input := packet.
	    self packetPending: true.
	    priority > oldTask priority ifTrue: [ ^ self ]]
	ifFalse: 
	    [ input := self append: packet head: input ].
    ^ oldTask
]

{ #category : #accessing }
RichTaskControlBlock >> identity [
	^ identity
]

{ #category : #accessing }
RichTaskControlBlock >> link [
	^ link
]

{ #category : #initialize }
RichTaskControlBlock >> link: aLink identity: anIdentity priority: aPriority initialWorkQueue: anInitialWorkQueue initialState: anInitialState function: aBlock privateData: aPrivateData [ 
    link := aLink.
    identity := anIdentity.
    priority := aPriority.
    input := anInitialWorkQueue.
    self packetPending: anInitialState isPacketPending.
    self taskWaiting: anInitialState isTaskWaiting.
    self taskHolding: anInitialState isTaskHolding.
    function := aBlock.
    handle := aPrivateData
]

{ #category : #accessing }
RichTaskControlBlock >> priority [
	^ priority
]

{ #category : #scheduling }
RichTaskControlBlock >> runTask [
    | message |
    self isWaitingWithPacket
	ifTrue: 
	    [message := input.
	    input := message link.
	    RichObject NoWork == input 
		ifTrue: [self running]
		ifFalse: [self packetPending]]
	ifFalse: [message := RichObject NoWork].
    ^ function value: message value: handle
]
