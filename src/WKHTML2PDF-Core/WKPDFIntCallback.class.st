"
I represent a wkhtmltopdf_int_callback from pdf.h
"
Class {
	#name : #WKPDFIntCallback,
	#superclass : #WKPDFCallback,
	#pools : [
		'WKPDFConstants'
	],
	#category : #'WKHTML2PDF-Core-External-Callbacks'
}

{ #category : #accessing }
WKPDFIntCallback class >> fnSpec [

	^ #(void (WKPDFConverter* converter, int val))

]
