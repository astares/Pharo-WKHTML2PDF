Class {
	#name : #HTML2PDFGlobalSettingsTest,
	#superclass : #TestCase,
	#instVars : [
		'globalSettings'
	],
	#category : #'WKHTML2PDF-Core-Tests-Basic-Settings'
}

{ #category : #running }
HTML2PDFGlobalSettingsTest >> setUp [

	super setUp.
	globalSettings := HTML2PDFGlobalSettings new.
]

{ #category : #'tests - options' }
HTML2PDFGlobalSettingsTest >> testCollate [

	globalSettings collate.
	
	self assert: (globalSettings hasOption: 'collate')
]

{ #category : #'tests - options' }
HTML2PDFGlobalSettingsTest >> testCookieJAR [

	globalSettings cookieJAR: 'simple.jar'.
	
	self assert: (globalSettings hasOption: 'cookie-jar');
		 assert: (globalSettings valueForOption: 'cookie-jar') = 'simple.jar'
]

{ #category : #'tests - options' }
HTML2PDFGlobalSettingsTest >> testCopies [

	globalSettings copies: 3.
	
	self 
		assert: (globalSettings hasOption: 'copies');
		assert: (globalSettings valueForOption: 'copies') = 3
]

{ #category : #'tests - options' }
HTML2PDFGlobalSettingsTest >> testDPI [

	globalSettings dpi: 3.
	
	self 
		assert: (globalSettings hasOption: 'dpi');
		assert: (globalSettings valueForOption: 'dpi') = 3
]

{ #category : #'tests - options' }
HTML2PDFGlobalSettingsTest >> testGrayscale [

	globalSettings grayscale.
	
	self assert: (globalSettings hasOption: 'grayscale')
]

{ #category : #'tests - options' }
HTML2PDFGlobalSettingsTest >> testLowQuality [

	globalSettings lowQuality.
	
	self assert: (globalSettings hasOption: 'lowquality')
]

{ #category : #'tests - options' }
HTML2PDFGlobalSettingsTest >> testNoCollate [

	globalSettings noCollate.
	
	self assert: (globalSettings hasOption: 'no-collate')
]
