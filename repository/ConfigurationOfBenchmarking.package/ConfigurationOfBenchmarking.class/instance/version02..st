versions
version02: spec
	<version: '0.2' imports: #('0.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: ''.
		spec author: 'StefanMarr'.
		spec timestamp: '1/13/2013 14:24'.
		
		spec
			package: 'Scripting'          with: 'Scripting-StefanMarr.23';
			package: 'SMark'              with: 'SMark-StefanMarr.43';
			package: 'NPB'                with: 'NPB-StefanMarr.9';
			package: 'CL-Benchmarks-Game' with: 'CL-Benchmarks-Game-StefanMarr.27'.
	].