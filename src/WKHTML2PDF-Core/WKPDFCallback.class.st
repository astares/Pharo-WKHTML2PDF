"
Abstract superclass for WKPDF callbacks
"
Class {
	#name : #WKPDFCallback,
	#superclass : #NBFFICallback,
	#pools : [
		'WKPDFConstants'
	],
	#category : #'WKHTML2PDF-Core-External-Callbacks'
}

{ #category : #accessing }
WKPDFCallback class >> callType [

	^ #cdecl
]