baselines
version100: spec
	<version: '1.0.0' imports: #('1.0.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: ''.
		spec author: 'StefanMarr'.
		spec timestamp: '7/05/2013 11:30'.
		
		spec
			package: 'Scripting'          with: 'Scripting-StefanMarr.23';
			package: 'SMark'              with: 'SMark-StefanMarr.51'].