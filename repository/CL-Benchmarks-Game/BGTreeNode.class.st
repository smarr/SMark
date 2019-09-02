Class {
	#name : #BGTreeNode,
	#superclass : #Object,
	#instVars : [
		'left',
		'right',
		'item'
	],
	#category : 'CL-Benchmarks-Game-BinaryTree'
}

{ #category : #accessing }
BGTreeNode >> itemCheck [
   ^left isNil 
      ifTrue: [item] ifFalse: [item + (left itemCheck - right itemCheck)]
]

{ #category : #'initialize-release' }
BGTreeNode >> left: leftChild right: rightChild item: anItem [
   left := leftChild.
   right := rightChild.
   item := anItem
]
