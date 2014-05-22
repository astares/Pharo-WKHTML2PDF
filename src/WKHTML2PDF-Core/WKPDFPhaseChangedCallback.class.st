Class {
	#name : #WKPDFPhaseChangedCallback,
	#superclass : #NBFFICallback,
	#pools : [
		'WKPDFConstants'
	],
	#category : #'WKHTML2PDF-Core-External-Callbacks'
}

{ #category : #'as yet unclassified' }
WKPDFPhaseChangedCallback class >> callType [

	^ #cdecl
]

{ #category : #'as yet unclassified' }
WKPDFPhaseChangedCallback class >> fnSpec [

	^ #(void ( wkhtmltopdf_converter* c))
]
