"
I represent a wkhtmltopdf_str_callback from pdf.h
"
Class {
	#name : #WKPDFStringCallback,
	#superclass : #WKPDFCallback,
	#pools : [
		'WKPDFConstants'
	],
	#category : #'WKHTML2PDF-Core-Component-Callbacks'
}

{ #category : #accessing }
WKPDFStringCallback class >> fnSpec [
	 
	^ #(void (WKPDFConverter* converter, String str))


]
