"
# WKHTML2PDF for Pharo

## Project info

The ""WKHTML2PDF for Pharo"" is a project to provide the possibility to use the [WKHTML2PDF project](http://wkhtmltopdf.org/) from [Pharo](http://www.pharo.org). It allows you to convert HTML into PDF documents.

With this tool you can provide easy portable printing for your Pharo based applications.

### Project location
The project is located on STHub at
[http://smalltalkhub.com/#!/~TorstenBergmann/WKHTML2PDF/](http://smalltalkhub.com/#!/~TorstenBergmann/WKHTML2PDF/)

### License
WKHTML2PDF is licensed under MIT License.

## Installation

### Install WKHTML2PDF
Please check out [http://wkhtmltopdf.org](http://wkhtmltopdf.org)/ to install the necessary software on your machine. Note that the library/executable should be accessible to Pharo. Often it is enough by providing the binary files next to the Pharo VM executable.

### Install in Pharo
You can access the project from the Pharo configuration browser. Just select *""Tools""* -> *""Configuration Browser""* from the world menu, enter ""WKHTML2PDF"" and install the stable version. 

Alternatively to install the packages manually into your Pharo image just evaluate:

    Gofer new
        url: 'http://smalltalkhub.com/mc/TorstenBergmann/WKHTML2PDF/main';
        package: 'ConfigurationOfNBSQLite3';
        load.
    ((Smalltalk at: #ConfigurationOfNBSQLite3) project stableVersion) load.

If you need access to the SQLite3 database engine you need at a minimum the ""NBSQLite3-Core"" package which is loaded by the ConfigurationOfNBSQLite3 class. 

This package includes all necessary  API to access the sqlite engine. 

## Use in your own application

### Selecting the engine
Initially you have to select the engine that you want to use. Either you want to use the WKHTML2PDF library or the executable.

	HTML2PDFConverter useExecutable. 

or 

	HTML2PDFConverter useLibrary. 

The executable is the default.

### Converting
Now you can convert an HTML file or an URL into a PDF document:

	HTML2PDFConverter 
			convert: 'http://www.pharo.org'
		    toFile: 'pharo.pdf'
	
will convert the Pharo homepage to a pdf document.
		
# Packages

- *WKHTML2PDF-Core* - the core package required to use the project
- *WKHTML2PDF-Tests-Core* - includes SUnit tests for the core project

# Testing
The package comes with tests in the package ***WKHTML2PDF-Tests-Core***. Just use the SUnit TestRunner to run them.

 
   
"
Class {
	#name : #ConfigurationOfWKHTML2PDF,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : #ConfigurationOfWKHTML2PDF
}

{ #category : #'development support' }
ConfigurationOfWKHTML2PDF class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfWKHTML2PDF class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #private }
ConfigurationOfWKHTML2PDF class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfWKHTML2PDF class >> ensureMetacelloBaseConfiguration [

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
ConfigurationOfWKHTML2PDF class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfWKHTML2PDF class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfWKHTML2PDF class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfWKHTML2PDF class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfWKHTML2PDF class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfWKHTML2PDF class >> validate [
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
ConfigurationOfWKHTML2PDF >> baseline01: spec [
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/TorstenBergmann/WKHTML2PDF/main/'.
		spec project: 'OSProcess' with: [
				spec
					className: #ConfigurationOfOSProcess;
					versionString: #'stable';
					repository: 'http://www.squeaksource.com/OSProcess' ].
		spec 
			package: 'WKHTML2PDF-Core';
			package: 'WKHTML2PDF-Tests-Core' with: [
				spec requires: #('WKHTML2PDF-Core' ). ].
		spec 
			group: 'default' with: #('Core' 'Tests' );
			group: 'Core' with: #('WKHTML2PDF-Core' );
			group: 'Tests' with: #('WKHTML2PDF-Tests-Core' ). ].

]

{ #category : #baselines }
ConfigurationOfWKHTML2PDF >> baseline02: spec [
	<version: '0.2-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/TorstenBergmann/WKHTML2PDF/main/'.
		spec project: 'OSProcess' with: [
				spec
					className: #ConfigurationOfOSProcess;
					versionString: '4.5.12';
					repository: 'http://www.squeaksource.com/OSProcess' ].
		spec 
			package: 'WKHTML2PDF-Core';
			package: 'WKHTML2PDF-Tests-Core' with: [
				spec requires: #('WKHTML2PDF-Core' ). ].
		spec 
			group: 'default' with: #('Core' 'Tests' );
			group: 'Core' with: #('WKHTML2PDF-Core' );
			group: 'Tests' with: #('WKHTML2PDF-Tests-Core' ). ].

]

{ #category : #accessing }
ConfigurationOfWKHTML2PDF >> customProjectAttributes [
	 "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes"

	^ #().
]

{ #category : #'symbolic versions' }
ConfigurationOfWKHTML2PDF >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '0.2-baseline'.

]

{ #category : #accessing }
ConfigurationOfWKHTML2PDF >> project [

	^ project ifNil: [ 
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		project := MetacelloMCProject new projectAttributes: self customProjectAttributes. 
		(Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfWKHTML2PDF >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '1.0'.

]

{ #category : #versions }
ConfigurationOfWKHTML2PDF >> version10: spec [
	<version: '1.0' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.0'.
		spec author: 'TorstenBergmann'.
		spec timestamp: '12/19/2014 10:07'.
		spec project: 'OSProcess' with: '4.5.12'.
		spec 
			package: 'WKHTML2PDF-Core' with: 'WKHTML2PDF-Core-TorstenBergmann.14';
			package: 'WKHTML2PDF-Tests-Core' with: 'WKHTML2PDF-Tests-Core-TorstenBergmann.1'. ].

]
