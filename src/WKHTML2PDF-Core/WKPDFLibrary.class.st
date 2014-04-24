"
Represents the Webkit HTML to PDF library
"
Class {
	#name : #WKPDFLibrary,
	#superclass : #Object,
	#pools : [
		'WKPDFConstants'
	],
	#category : #'WKHTML2PDF-Core-External'
}

{ #category : #'private - api calls' }
WKPDFLibrary class >> addObject: settings to: converter [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(void* wkhtmltopdf_add_object(wkhtmltopdf_converter* converter, wkhtmltopdf_object_settings* settings, 0)) module: 'wkhtmltox.dll' 
]

{ #category : #'private - api calls' }
WKPDFLibrary class >> convert: converter [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(int wkhtmltopdf_convert(wkhtmltopdf_converter* converter)) module: 'wkhtmltox.dll' 
]

{ #category : #'private - api calls' }
WKPDFLibrary class >> createConverterWithGlobalSettings: settings [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(wkhtmltopdf_converter* wkhtmltopdf_create_converter(wkhtmltopdf_global_settings* settings)) module: 'wkhtmltox.dll' 
]

{ #category : #'private - api calls' }
WKPDFLibrary class >> createGlobalSettings [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(wkhtmltopdf_global_settings* wkhtmltopdf_create_global_settings()) module: 'wkhtmltox.dll' 
]

{ #category : #'private - api calls' }
WKPDFLibrary class >> createObjectSettings [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(wkhtmltopdf_object_settings* wkhtmltopdf_create_object_settings()) module: 'wkhtmltox.dll' 
]

{ #category : #'private - api calls' }
WKPDFLibrary class >> init: mode [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(int wkhtmltopdf_init(int mode)) module: 'wkhtmltox.dll' 
]

{ #category : #'private - api calls' }
WKPDFLibrary class >> setGlobalSetting: aName to: value in: settings [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(int wkhtmltopdf_set_global_setting(wkhtmltopdf_global_settings* settings, char* aName, char* value)) module: 'wkhtmltox.dll' 	
]

{ #category : #'private - api calls' }
WKPDFLibrary class >> setObjectSetting: aName to: value in: settings [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(int wkhtmltopdf_set_object_setting(wkhtmltopdf_object_settings* settings, char* aName, char* value)) module: 'wkhtmltox.dll' 	
]
