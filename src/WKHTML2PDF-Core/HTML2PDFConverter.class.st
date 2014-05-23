"
This class represents a HTML to PDF converter
using the WKHTML TO PDF Suite
"
Class {
	#name : #HTML2PDFConverter,
	#superclass : #Object,
	#category : #'WKHTML2PDF-Core-Basic'
}

{ #category : #conversion }
HTML2PDFConverter class >> convert: url toFile: fileName [

	^WKPDFLibrary convert: url toFile: fileName
]
