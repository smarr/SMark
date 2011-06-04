transporter
transporters
	"Returns the transporters that define how to file out the different packages for versioning with Git."
	Smalltalk globals at: #Transporter ifPresent: [ :tpCls |
		^ self subPackages collect: [:pkg | tpCls forPackage: (PackageInfo named: pkg) ]
	].
	
	" Else "
	^ nil.