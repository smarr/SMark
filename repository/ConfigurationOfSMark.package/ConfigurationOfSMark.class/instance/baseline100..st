baselines
baseline100: spec
	<version: '1.0.0-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/StefanMarr/SMark/main'.
		
		spec package: 'Scripting'.
		spec package: 'SMark' with: [ spec requires: #(Scripting) ].
	].