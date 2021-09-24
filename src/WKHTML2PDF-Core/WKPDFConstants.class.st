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
	#category : #'WKHTML2PDF-Core-Engine-Utilities'
}

{ #category : #'private - initialization' }
WKPDFConstants class >> initTypes [

	wkhtmltopdf_global_settings := #WKPDFGlobalSettings.
	wkhtmltopdf_object_settings := #WKPDFObjectSettings.
	wkhtmltopdf_converter := #WKPDFConverter.
	wkhtmltopdf_str_callback := #FFICallback.
	wkhtmltopdf_void_callback := #FFICallback.
	wkhtmltopdf_int_callback := #FFICallback 
]

{ #category : #'class initialization' }
WKPDFConstants class >> initialize [ 

	self initTypes
]
