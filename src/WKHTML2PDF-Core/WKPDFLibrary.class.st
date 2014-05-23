"
Represents the WKPDF shared library
"
Class {
	#name : #WKPDFLibrary,
	#superclass : #Object,
	#pools : [
		'WKPDFConstants'
	],
	#category : #'WKHTML2PDF-Core-Component'
}

{ #category : #'private - api' }
WKPDFLibrary class >> addObject: converter to: settings [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(void wkhtmltopdf_add_object(wkhtmltopdf_converter* converter, wkhtmltopdf_object_settings* settings, 0)) module: 'wkhtmltox.dll' options: #( - optCoerceNilToNull )
]

{ #category : #'private - api' }
WKPDFLibrary class >> convert: converter [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(int wkhtmltopdf_convert(wkhtmltopdf_converter* converter)) module: 'wkhtmltox.dll' 
]

{ #category : #conversion }
WKPDFLibrary class >> convert: url toFile: fileName [

	| globalSettings objectSettings converter  conversionResult errorCode |

	self init: 0.
	globalSettings := self createGlobalSettings.
	self setGlobalSetting: 'out' to: fileName in: globalSettings.
	objectSettings := self createObjectSettings.
	self setObjectSetting: 'page' to: url in: objectSettings.
	converter := self createConverter: globalSettings.
	self addObject: converter to: objectSettings.
	conversionResult := self convert: converter.
	conversionResult = 1 ifFalse: [ errorCode := self getHTTPErrorCode: converter ].
	self destroyConverter: converter.
	self deinit.
	
	^conversionResult = 1 
		ifTrue: [ true ]
		ifFalse: [ errorCode ]


]

{ #category : #'private - api' }
WKPDFLibrary class >> createConverter: settings [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(wkhtmltopdf_converter* wkhtmltopdf_create_converter(wkhtmltopdf_global_settings* settings)) module: 'wkhtmltox.dll' 
]

{ #category : #'private - api - settings' }
WKPDFLibrary class >> createGlobalSettings [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(wkhtmltopdf_global_settings* wkhtmltopdf_create_global_settings()) module: 'wkhtmltox.dll' 
]

{ #category : #'private - api - settings' }
WKPDFLibrary class >> createObjectSettings [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(wkhtmltopdf_object_settings* wkhtmltopdf_create_object_settings()) module: 'wkhtmltox.dll' 
]

{ #category : #'private - api - initialization' }
WKPDFLibrary class >> deinit [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(int wkhtmltopdf_deinit()) module: 'wkhtmltox.dll' 
]

{ #category : #'private - api' }
WKPDFLibrary class >> destroyConverter: converter [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(void wkhtmltopdf_destroy_converter(wkhtmltopdf_converter* converter)) module: 'wkhtmltox.dll' 
]

{ #category : #examples }
WKPDFLibrary class >> example [

	self convert: 'http://www.pharo.org' toFile:  'c:\temp\test5.pdf'
]

{ #category : #examples }
WKPDFLibrary class >> exampleWithCallbacks [

	| globalSettings objectSettings converter cb phaseCallback |
	self init: 0.
	globalSettings := self createGlobalSettings.
	self setGlobalSetting: 'out' to: 'c:\temp\pharo.pdf' in: globalSettings.
	objectSettings := self createObjectSettings.
	self setObjectSetting: 'page' to: 'http://www.pharo.org' in: objectSettings.
	converter := self createConverter: globalSettings.
	
	cb := WKPDFStringCallback on: [ :con :m | Transcript show: m readString; flush ].
		self setErrorCallback: cb onConverter: converter.
		self setWarningCallback: cb onConverter: converter.
	
	phaseCallback := WKPDFVoidCallback on: [ :con | 
							|description|
							description := self getPhaseDescription: con  forPhase: (self getCurrentPhase: con).			
							Transcript show: description; cr; flush ].
						
	self setPhaseChangedCallback: phaseCallback onConverter: converter.
	self addObject: converter to: objectSettings.
	self convert: converter.
	self destroyConverter: converter.
	self deinit
]

{ #category : #'private - api - accessing' }
WKPDFLibrary class >> getCurrentPhase: converter [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(int wkhtmltopdf_current_phase(wkhtmltopdf_converter* converter)) module: 'wkhtmltox.dll' 
]

{ #category : #'private - api - accessing' }
WKPDFLibrary class >> getHTTPErrorCode: converter [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(int wkhtmltopdf_http_error_code(wkhtmltopdf_converter* converter)) module: 'wkhtmltox.dll' 
]

{ #category : #'private - api - accessing' }
WKPDFLibrary class >> getPhaseDescription: converter forPhase: phase [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(String wkhtmltopdf_phase_description(wkhtmltopdf_converter* converter, int phase)) module: 'wkhtmltox.dll' 
]

{ #category : #'private - api - initialization' }
WKPDFLibrary class >> init: use_graphics [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(int wkhtmltopdf_init(int use_graphics)) module: 'wkhtmltox.dll' 
]

{ #category : #'private - api - callbacks' }
WKPDFLibrary class >> setErrorCallback: cb onConverter: converter [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(void* wkhtmltopdf_set_error_callback(wkhtmltopdf_converter* converter, wkhtmltopdf_str_callback cb)) module: 'wkhtmltox.dll' 
]

{ #category : #'private - api - settings' }
WKPDFLibrary class >> setGlobalSetting: aName to: value in: settings [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(int wkhtmltopdf_set_global_setting(wkhtmltopdf_global_settings* settings, String aName, String value)) module: 'wkhtmltox.dll' 	
]

{ #category : #'private - api - settings' }
WKPDFLibrary class >> setObjectSetting: aName to: value in: settings [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>

	 ^NBFFICallout stdcall: #(int wkhtmltopdf_set_object_setting(wkhtmltopdf_object_settings* settings, String aName, String value)) module: 'wkhtmltox.dll' 	
]

{ #category : #'private - api - callbacks' }
WKPDFLibrary class >> setPhaseChangedCallback: cb onConverter: converter [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(void* wkhtmltopdf_set_phase_changed_callback(wkhtmltopdf_converter* converter, wkhtmltopdf_void_callback cb)) module: 'wkhtmltox.dll' 
]

{ #category : #'private - api - callbacks' }
WKPDFLibrary class >> setWarningCallback: cb onConverter: converter [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(void* wkhtmltopdf_set_warning_callback(wkhtmltopdf_converter* converter, wkhtmltopdf_str_callback cb)) module: 'wkhtmltox.dll' 
]
