versions
version100: spec
	<version: '1.0.0' imports: #('1.0.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: ''.
		spec author: 'StefanMarr'.
		spec timestamp: '7/05/2013 11:30'.
		
		spec
		      project: 'SMark' with: [ spec version: '1.0.0' ];
			package: 'NPB' with: 'NPB-StefanMarr.10';
			package: 'CL-Benchmarks-Game' with: 'CL-Benchmarks-Game-StefanMarr.49'.
	].