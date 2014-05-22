Class {
	#name : #WKPDFProgressChangedCallback,
	#superclass : #NBFFICallback,
	#pools : [
		'WKPDFConstants'
	],
	#category : #'WKHTML2PDF-Core-External-Callbacks'
}

{ #category : #'as yet unclassified' }
WKPDFProgressChangedCallback class >> callType [

	^ #cdecl
]

{ #category : #'as yet unclassified' }
WKPDFProgressChangedCallback class >> fnSpec [

	^ #(void ( wkhtmltopdf_converter* c))
]
