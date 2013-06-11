baselines
baseline01: spec
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/StefanMarr/SMark/main'.
		self class subPackages do: [:pkg | spec package:  pkg ].
	].