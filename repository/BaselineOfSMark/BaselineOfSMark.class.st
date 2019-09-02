Class {
	#name : #BaselineOfSMark,
	#superclass : #BaselineOf,
	#category : #BaselineOfSMark
}

{ #category : #baselines }
BaselineOfSMark >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec package: 'Scripting'.
		spec package: 'SMark' with: [
			spec requires: #(Scripting) ] ]
]
