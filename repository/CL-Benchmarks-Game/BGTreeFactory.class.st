Class {
	#name : #BGTreeFactory,
	#superclass : #Object,
	#instVars : [
		'nodeCls'
	],
	#category : 'CL-Benchmarks-Game-BinaryTree'
}

{ #category : #'instance creation' }
BGTreeFactory >> bottomUpTree: anItem depth: anInteger [
   ^(anInteger > 0) 
      ifTrue: [
         self 
            left: (self bottomUpTree: 2*anItem - 1 depth: anInteger - 1) 
            right: (self bottomUpTree: 2*anItem depth: anInteger - 1)  
            item: anItem
         ]
      ifFalse: [self left: nil right: nil item: anItem]
]

{ #category : #'initialize-release' }
BGTreeFactory >> initialize [
	nodeCls := BGTreeNode.
]

{ #category : #'instance creation' }
BGTreeFactory >> left: leftChild right: rightChild item: anItem [      
   ^(nodeCls new) left: leftChild right: rightChild item: anItem
]
