Class {
	#name : #ConfigurationOfSMark,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : 'ConfigurationOfSMark'
}

{ #category : #'development support' }
ConfigurationOfSMark class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfSMark class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #catalog }
ConfigurationOfSMark class >> catalogChangeLog [
	"Returns a paragraph describing the most important changes in the configuration class."
	^ '- 1.0.1 - 3/28/2014 - minor change: SMarkSuite subclasses can specify which variables need to be preserved.
- 1.0.0 - 7/05/2013 - first stable version

[[[
	ConfigurationOfSMark project version: ''1.0.1'' ) load					
]]]'
]

{ #category : #catalog }
ConfigurationOfSMark class >> catalogContactInfo [
	"Returns a paragraph describing contact information such as email, mailing lists and website."
	^ 'Stefan Marr <smalltalk@stefan-marr.de>'
]

{ #category : #catalog }
ConfigurationOfSMark class >> catalogDescription [
	"Returns a paragraph describing the project"
	^ '!SMark - Write Benchmarks like Tests

SMark is the attempt to build a common benchmarking framework for Smalltalk.

It inspired by unit testing in SUnit and following this idea, a benchmark is implemented by adding ==#benchMyBenchmark== to a subclass of ==SMarkSuite==. This enables performance regression tracking in the same way as unit-testing allows to track functional regressions.

The code is originally based on ==PBenchmark==, the benchmark framework used for the PinocchioVM and ==RoarBenchmark==, a framework used for performance regression testing of the *RoarVM>https://github.com/smarr/RoarVM*.

Other sources of inspiration are for instance the *Caliper>http://code.google.com/p/caliper/* microbenchmarking framework for Java.

The name choice of SMark is deliberately confusable with smark (as defined by the urban dictionary: Noun. A person who is being scamed but is in on the prank. Someone who knows they are being tricked. Its origin is from the term "mark" and is the shortened form of the phrase "smart mark".) freely following the old wisdom: "Lies, Damn Lies, and --Statistics-- Benchmarks"'
]

{ #category : #catalog }
ConfigurationOfSMark class >> catalogKeyClassesAndExample [
	"Returns a paragraph or more describing the key classes of your project. You can use Pillar/Pier syntax to layout out the text i.e., ==Code== and - for bullet."
	^ 'SMark uses ==SMarkSuite== as the base class for benchmark suites. To see examples, have a look at its subclasses.

==SMarkHarness== stears the actual execution and reporting. The class comments gives a few more details on the basic usage.'
]

{ #category : #catalog }
ConfigurationOfSMark class >> catalogKeywords [
	"Returns an array of symbols"
	^ #(benchmarking performance measurement reporting) 
]

{ #category : #private }
ConfigurationOfSMark class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfSMark class >> ensureMetacelloBaseConfiguration [

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
ConfigurationOfSMark class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfSMark class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfSMark class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfSMark class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfSMark class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfSMark class >> validate [
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
ConfigurationOfSMark >> baseline100: spec [
	<version: '1.0.0-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/StefanMarr/SMark/main'.
		
		spec package: 'Scripting'.
		spec package: 'SMark' with: [ spec requires: #(Scripting) ].
	].
]

{ #category : #baselines }
ConfigurationOfSMark >> baseline110: spec [
	<version: '1.1.0-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/StefanMarr/SMark/main'.
		
		spec package: 'Scripting'.
		spec package: 'SMark' with: [ spec requires: #(Scripting) ].
	].
]

{ #category : #accessing }
ConfigurationOfSMark >> customProjectAttributes [
	 "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes"

	^ #().
]

{ #category : #baselines }
ConfigurationOfSMark >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '1.1.0-baseline'.

]

{ #category : #accessing }
ConfigurationOfSMark >> project [

	^ project ifNil: [
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		project := MetacelloMCProject new projectAttributes: self customProjectAttributes. 
		(Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #baselines }
ConfigurationOfSMark >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '1.0.3'
]

{ #category : #baselines }
ConfigurationOfSMark >> version100: spec [
	<version: '1.0.0' imports: #('1.0.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: ''.
		spec author: 'StefanMarr'.
		spec timestamp: '7/05/2013 11:30'.
		
		spec
			package: 'Scripting'          with: 'Scripting-StefanMarr.23';
			package: 'SMark'              with: 'SMark-StefanMarr.51'].
]

{ #category : #baselines }
ConfigurationOfSMark >> version101: spec [
	<version: '1.0.1' imports: #('1.0.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: ''.
		spec author: 'StefanMarr'.
		spec timestamp: '3/28/2014 14:04'.
		
		spec
			package: 'Scripting'          with: 'Scripting-StefanMarr.23';
			package: 'SMark'              with: 'SMark-MartinDias.52'].
]

{ #category : #baselines }
ConfigurationOfSMark >> version102: spec [
	<version: '1.0.2' imports: #('1.0.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: ''.
		spec author: 'MaxLeske'.
		spec timestamp: '29/06/2018 18:51'.
		
		spec
			package: 'Scripting'          with: 'Scripting-MaxLeske.24';
			package: 'SMark'              with: 'SMark-MartinDias.52'].
]

{ #category : #baselines }
ConfigurationOfSMark >> version103: spec [
	<version: '1.0.3' imports: #('1.0.0-baseline' )>		
	spec for: #'common' do: [
		spec
			blessing: #'stable';
			author: 'MaxLeske';
			timestamp: '31/08/2019 19:00'.
		
		spec
			package: 'Scripting'          with: 'Scripting-MaxLeske.24';
			package: 'SMark'              with: 'SMark-MartinDias.52' ].

	spec for: #('pharo7.x' 'pharo8.x') do: [
		spec
			blessing: #'stable';
			author: 'MaxLeske';
			timestamp: '31/08/2019 19:00'.
			
		spec
			package: 'Scripting'          with: 'Scripting-MaxLeske.25';
			package: 'SMark'              with: 'SMark-MaxLeske.56']
]
