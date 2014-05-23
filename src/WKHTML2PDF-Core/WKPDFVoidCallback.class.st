"
I represent a wkhtmltopdf_void_callback from pdf.h
"
Class {
	#name : #WKPDFVoidCallback,
	#superclass : #WKPDFCallback,
	#pools : [
		'WKPDFConstants'
	],
	#category : #'WKHTML2PDF-Core-Component-Callbacks'
}

{ #category : #accessing }
WKPDFVoidCallback class >> fnSpec [
 
	^ #(void (WKPDFConverter* converter))


]
