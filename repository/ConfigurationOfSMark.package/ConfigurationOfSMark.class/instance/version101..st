baselines
version101: spec
	<version: '1.0.1' imports: #('1.0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: ''.
		spec author: 'StefanMarr'.
		spec timestamp: '3/28/2014 14:04'.
		
		spec
			package: 'Scripting'          with: 'Scripting-StefanMarr.23';
			package: 'SMark'              with: 'SMark-MartinDias.52'].