Class {
	#name : #WKPDFErrorCallback,
	#superclass : #NBFFICallback,
	#pools : [
		'WKPDFConstants'
	],
	#category : #'WKHTML2PDF-Core-External-Callbacks'
}

{ #category : #'as yet unclassified' }
WKPDFErrorCallback class >> callType [

	^ #cdecl
]

{ #category : #'as yet unclassified' }
WKPDFErrorCallback class >> fnSpec [

	^ #(void ( wkhtmltopdf_converter* c, char* msg))
]
