"
This pool includes constants from pdf.h
"
Class {
	#name : #WKPDFConstants,
	#superclass : #SharedPool,
	#classVars : [
		'wkhtmltopdf_converter',
		'wkhtmltopdf_global_settings',
		'wkhtmltopdf_int_callback',
		'wkhtmltopdf_object_settings',
		'wkhtmltopdf_str_callback',
		'wkhtmltopdf_void_callback'
	],
	#category : #'WKHTML2PDF-Core-Component-Structs'
}

{ #category : #'private - initialization' }
WKPDFConstants class >> initTypes [

	wkhtmltopdf_global_settings := #WKPDFGlobalSettings.
	wkhtmltopdf_object_settings := #WKPDFObjectSettings.
	wkhtmltopdf_converter := #WKPDFConverter.
	wkhtmltopdf_str_callback := #WKPDFStringCallback.
	wkhtmltopdf_void_callback := #WKPDFVoidCallback.
	wkhtmltopdf_int_callback := #WKPDFIntCallback
]

{ #category : #initialization }
WKPDFConstants class >> initialize [ 
	"Initializes the receiver class
	
		self initialize
	"
	
	self initTypes
]
