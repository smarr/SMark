baselines
baseline110: spec
	<version: '1.1.0-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/StefanMarr/SMark/main'.
		
		spec project: 'SMark' with: [
				spec className: 'ConfigurationOfSMark';
					  file: 'ConfigurationOfSMark';
					  version: #stable;
					  repository: 'http://smalltalkhub.com/mc/StefanMarr/SMark/main' ].
		
		spec package: 'NPB' with: [
			spec requires: #(SMark) ].
		spec package: 'CL-Benchmarks-Game' with: [
			spec requires: #(SMark) ].
	].