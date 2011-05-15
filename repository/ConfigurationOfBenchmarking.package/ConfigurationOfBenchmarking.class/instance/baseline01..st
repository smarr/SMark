baselines
baseline01: spec
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://www.squeaksource.com/SMark'.
		spec package: 'SMark'.
		spec package: 'Scripting'.
		spec package: 'NPB'.
		spec package: 'CL-Benchmarks-Game'.
	].

	spec for: #pharo do: [
		spec project: 'OSProcess'
			with:
				[ spec
					className: 'ConfigurationOfOSProcess';
					file: 'ConfigurationOfOSProcess';
					repository: 'http://www.squeaksource.com/MetacelloRepository' ]
		]