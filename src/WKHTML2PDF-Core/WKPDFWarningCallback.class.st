Class {
	#name : #WKPDFWarningCallback,
	#superclass : #NBFFICallback,
	#pools : [
		'WKPDFConstants'
	],
	#category : #'WKHTML2PDF-Core-External-Callbacks'
}

{ #category : #'as yet unclassified' }
WKPDFWarningCallback class >> callType [

	^ #cdecl
]

{ #category : #'as yet unclassified' }
WKPDFWarningCallback class >> fnSpec [

	^ #(void ( wkhtmltopdf_converter* c, char* msg))
]
