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
WKPDFLibrary class >> addObject: converter to: settings [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(void wkhtmltopdf_add_object(wkhtmltopdf_converter* converter, wkhtmltopdf_object_settings* settings, 0)) module: 'wkhtmltox.dll' 
]

{ #category : #'private - api calls' }
WKPDFLibrary class >> convert: converter [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(int wkhtmltopdf_convert(wkhtmltopdf_converter* converter)) module: 'wkhtmltox.dll' 
]

{ #category : #'private - api calls' }
WKPDFLibrary class >> createConverter: settings [

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
WKPDFLibrary class >> deinit [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(int wkhtmltopdf_deinit()) module: 'wkhtmltox.dll' 
]

{ #category : #'private - api calls' }
WKPDFLibrary class >> destroyConverter: converter [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(void wkhtmltopdf_destroy_converter(wkhtmltopdf_converter* converter)) module: 'wkhtmltox.dll' 
]

{ #category : #examples }
WKPDFLibrary class >> example [

	|gs os c|
	self init: 0.
	gs := self createGlobalSettings.
	self setGlobalSetting: 'out' to: 'c:\\temp\\mia8.pdf' in: gs.
	os := self createObjectSettings.
	self setObjectSetting: 'page' to: 'http://www.google.de' in: os.
	c := self createConverter: gs.
	self addObject: c to: os.
	self convert: c.
	self destroyConverter: c.
	self deinit
]

{ #category : #'private - api calls' }
WKPDFLibrary class >> init: use_graphics [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(int wkhtmltopdf_init(int use_graphics)) module: 'wkhtmltox.dll' 
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
