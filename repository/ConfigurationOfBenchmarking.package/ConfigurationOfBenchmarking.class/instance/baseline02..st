baselines
baseline02: spec
	<version: '0.2-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://www.squeaksource.com/SMark'.
		
		spec package: 'Scripting'.
		spec package: 'SMark' with: [
			spec requires: #(Scripting) ].
		
		spec package: 'NPB' with: [
			spec requires: #(SMark) ].
		spec package: 'CL-Benchmarks-Game' with: [
			spec requires: #(SMark) ].
		
		spec
			group: 'default'    with: #(Complete);
			group: 'Core'       with: #(SMark);
			group: 'Benchmarks' with: #(NPB 'CL-Benchmarks-Game');
			group: 'Complete'   with: #(Core Benchmarks)
	].