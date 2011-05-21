transporter
transporter
	"Returns the transporter that defines how to file out this package for versioning with Git."
	Smalltalk globals at: #Transporter ifPresent: [ :tpCls |
		^ tpCls forPackage: (
			(Smalltalk globals at: #CompositePackageInfo) new
					name: 'Benchmarking';
					packages: (self subPackages collect: [:pkg | PackageInfo named: pkg ])).
	
	].
	
	" Else "
	^ nil.