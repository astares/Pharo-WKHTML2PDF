"
Baseline for [https://github.com/astares/Pharo-WKHTML2PDF](https://github.com/astares/Pharo-WKHTML2PDF)
"
Class {
	#name : #BaselineOfWKHTML2PDF,
	#superclass : #BaselineOf,
	#category : #BaselineOfWKHTML2PDF
}

{ #category : #baselines }
BaselineOfWKHTML2PDF >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		"Packages"
		spec 
			package: 'WKHTML2PDF-Core';
			package: 'WKHTML2PDF-Core-Tests' with: [ spec requires: #('WKHTML2PDF-Core' ) ].
			
		"Groups"	
		spec 
			group: 'Core' with: #('WKHTML2PDF-Core' );
			group: 'Tests' with: #('WKHTML2PDF-Core-Tests' );
			group: 'all' with: #('Core' 'Tests' );
			group: 'default' with: #('all' ) ] 
]
