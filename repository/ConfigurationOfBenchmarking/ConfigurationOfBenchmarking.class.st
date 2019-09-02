Class {
	#name : #ConfigurationOfBenchmarking,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : 'ConfigurationOfBenchmarking'
}

{ #category : #'development support' }
ConfigurationOfBenchmarking class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfBenchmarking class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #private }
ConfigurationOfBenchmarking class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfBenchmarking class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfBenchmarking class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfBenchmarking class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfBenchmarking class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfBenchmarking class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfBenchmarking class >> project [

	^self new project
]

{ #category : #transporter }
ConfigurationOfBenchmarking class >> saveWithTransporter [
	"Will save the package in file-out format using the Transporter infrastructure"
	self transporters
		ifNotNilDo: [:transporters | 
			transporters do: [:t | t saveNoPopup ]].
]

{ #category : #transporter }
ConfigurationOfBenchmarking class >> subPackages [
	"Specifies the names of all logical subpackages of the Benchmarking package."
	"TODO: have a versioning for this, to better comply with the Metacello approach."
	^ {	'SMark'.
		'Scripting'.
		'NPB'.
		'CL-Benchmarks-Game'.
	}
]

{ #category : #transporter }
ConfigurationOfBenchmarking class >> transporters [
	"Returns the transporters that define how to file out the different packages for versioning with Git."
	Smalltalk globals at: #Transporter ifPresent: [ :tpCls |
		^ self subPackages collect: [:pkg | tpCls forPackage: (PackageInfo named: pkg) ]
	].
	
	" Else "
	^ nil.
]

{ #category : #transporter }
ConfigurationOfBenchmarking class >> transportersForFileOutMenu [
	^ self transporters
]

{ #category : #'development support' }
ConfigurationOfBenchmarking class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfBenchmarking >> baseline01: spec [
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/StefanMarr/SMark/main'.
		self class subPackages do: [:pkg | spec package:  pkg ].
	].
]

{ #category : #baselines }
ConfigurationOfBenchmarking >> baseline02: spec [
	<version: '0.2-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/StefanMarr/SMark/main'.
		
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
]

{ #category : #baselines }
ConfigurationOfBenchmarking >> baseline100: spec [
	<version: '1.0.0-baseline'>

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
]

{ #category : #baselines }
ConfigurationOfBenchmarking >> baseline110: spec [
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
]

{ #category : #'symbolic versions' }
ConfigurationOfBenchmarking >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '1.1.0'.

]

{ #category : #accessing }
ConfigurationOfBenchmarking >> project [

	^ project ifNil: [ | constructor |
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		constructor := (Smalltalk at: #MetacelloVersionConstructor) on: self.
		project := constructor project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfBenchmarking >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '1.0.0'.

]

{ #category : #versions }
ConfigurationOfBenchmarking >> version01: spec [
	<version: '0.1' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: ''.
		spec author: 'StefanMarr'.
		spec timestamp: '5/14/2011 12:19'.
	].
]

{ #category : #versions }
ConfigurationOfBenchmarking >> version02: spec [
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
]

{ #category : #versions }
ConfigurationOfBenchmarking >> version03: spec [
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
]

{ #category : #versions }
ConfigurationOfBenchmarking >> version100: spec [
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
]

{ #category : #versions }
ConfigurationOfBenchmarking >> version110: spec [
	<version: '1.1.0' imports: #('1.0.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: ''.
		spec author: 'StefanMarr'.
		spec timestamp: '7/05/2013 12:30'.
	].
]
