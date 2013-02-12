versions
version03: spec
	<version: '0.3' imports: #('0.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'Compatibility for Pharo 2.0'.
		spec author: 'StefanMarr'.
		spec timestamp: '2/13/2013 01:10'.
		
		spec
			package: 'Scripting'          with: 'Scripting-StefanMarr.23';
			package: 'SMark'              with: 'SMark-StefanMarr.45';
			package: 'NPB'                with: 'NPB-StefanMarr.9';
			package: 'CL-Benchmarks-Game' with: 'CL-Benchmarks-Game-StefanMarr.27'.
	].