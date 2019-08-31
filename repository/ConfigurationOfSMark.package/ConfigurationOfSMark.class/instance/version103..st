baselines
version103: spec
	<version: '1.0.3' imports: #('1.0.0-baseline' )>
	spec
		blessing: #'stable';
		author: 'MaxLeske';
		timestamp: '31/08/2019 19:00'.
		
	spec for: #'common' do: [
		spec
			package: 'Scripting'          with: 'Scripting-MaxLeske.24';
			package: 'SMark'              with: 'SMark-MartinDias.52' ].

	spec for: #('pharo7.x' 'pharo8.x') do: [
		spec
			package: 'Scripting'          with: 'Scripting-MaxLeske.25';
			package: 'SMark'              with: 'SMark-MaxLeske.56']