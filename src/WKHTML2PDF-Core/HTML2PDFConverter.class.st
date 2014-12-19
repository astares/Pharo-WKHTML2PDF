"
This class represents a HTML to PDF converter
using the WKHTML TO PDF Suite
"
Class {
	#name : #HTML2PDFConverter,
	#superclass : #Object,
	#classVars : [
		'Engine'
	],
	#category : #'WKHTML2PDF-Core-Basic'
}

{ #category : #conversion }
HTML2PDFConverter class >> convert: url toFile: fileName [

	^self engine convert: url toFile: fileName
]

{ #category : #'private accessing' }
HTML2PDFConverter class >> engine [

	^Engine
]

{ #category : #examples }
HTML2PDFConverter class >> example [

	self convert: 'http://www.pharo.org'
	       toFile: 'pharo.pdf'
]

{ #category : #initialization }
HTML2PDFConverter class >> initialize [

	self useLibrary 
]

{ #category : #engines }
HTML2PDFConverter class >> useExecutable [

	Engine := WKPDFExecutable 
]

{ #category : #engines }
HTML2PDFConverter class >> useLibrary [

	Engine := WKPDFLibrary 
]
