baselines
baseline01: spec
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://www.squeaksource.com/SMark'.
		self class subPackages do: [:pkg | spec package:  pkg ].
	].