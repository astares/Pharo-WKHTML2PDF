"
Represents the WKPDF shared library
"
Class {
	#name : #WKPDFLibrary,
	#superclass : #FFILibrary,
	#pools : [
		'WKPDFConstants'
	],
	#category : #'WKHTML2PDF-Core-Engine-Library'
}

{ #category : #converting }
WKPDFLibrary class >> convert: url toFile: fileName [

	^self uniqueInstance convert: url toFile: fileName
]

{ #category : #converting }
WKPDFLibrary class >> convert: url toFile: fileName callback: aBlock [

	^self uniqueInstance convert: url toFile: fileName callback: aBlock
]

{ #category : #examples }
WKPDFLibrary class >> example [

	self convert: 'http://www.pharo.org' toFile:  'c:\temp\test7.pdf'
]

{ #category : #examples }
WKPDFLibrary class >> exampleWithCallbacks [

	self convert: 'http://www.pharo.org' toFile: 'pharo_with_callback.pdf' callback: [ :con :m | Transcript show: m readString; flush ]
	
]

{ #category : #adding }
WKPDFLibrary >> addObject: converter to: settings [
	
	 ^self ffiCall: #(void wkhtmltopdf_add_object(wkhtmltopdf_converter converter, wkhtmltopdf_object_settings settings, 0)) options: #( - optCoerceNilToNull )
]

{ #category : #actions }
WKPDFLibrary >> convert: converter [

	 ^self ffiCall: #(int wkhtmltopdf_convert(wkhtmltopdf_converter converter))  
]

{ #category : #converting }
WKPDFLibrary >> convert: url toFile: fileName [

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

{ #category : #converting }
WKPDFLibrary >> convert: url toFile: fileName callback: aTwoArgumentBlock [

	| globalSettings objectSettings converter cb phaseCallback |
	self init: 0.
	globalSettings := self createGlobalSettings.
	self setGlobalSetting: 'out' to: fileName in: globalSettings.
	objectSettings := self createObjectSettings.
	self setObjectSetting: 'page' to: url in: objectSettings.
	converter := self createConverter: globalSettings.
	
	cb := FFICallback  
				signature: #(void (WKPDFConverter converter, String str))
				block: aTwoArgumentBlock.
		self setErrorCallback: cb onConverter: converter.
		self setWarningCallback: cb onConverter: converter.
	
	phaseCallback := FFICallback 
							 signature: #(void (WKPDFConverter converter))
							 block:  [ :con | 
								|description cvt|
								cvt := WKPDFConverter fromHandle:con.
								description := self getPhaseDescription: cvt forPhase: (self getCurrentPhase: cvt).			
								Transcript show: description; cr; flush ].
						
	self setPhaseChangedCallback: phaseCallback onConverter: converter.
	self addObject: converter to: objectSettings.
	self convert: converter.
	self destroyConverter: converter.
	self deinit
]

{ #category : #'private - api' }
WKPDFLibrary >> createConverter: settings [
	 
	 ^self ffiCall: #(wkhtmltopdf_converter* wkhtmltopdf_create_converter(wkhtmltopdf_global_settings settings)) 
]

{ #category : #'private - api - settings' }
WKPDFLibrary >> createGlobalSettings [

	 ^ self ffiCall: #(wkhtmltopdf_global_settings* wkhtmltopdf_create_global_settings())
]

{ #category : #'private - api - settings' }
WKPDFLibrary >> createObjectSettings [

	 ^self ffiCall: #(wkhtmltopdf_object_settings* wkhtmltopdf_create_object_settings())
]

{ #category : #'private - api - initialization' }
WKPDFLibrary >> deinit [
	 
	 ^self ffiCall: #(int wkhtmltopdf_deinit()) 
]

{ #category : #'private - api' }
WKPDFLibrary >> destroyConverter: converter [
	 
	 ^self ffiCall: #(void wkhtmltopdf_destroy_converter(wkhtmltopdf_converter converter))  
]

{ #category : #'private - api - accessing' }
WKPDFLibrary >> getCurrentPhase: converter [
	 
	 ^self ffiCall: #(int wkhtmltopdf_current_phase(wkhtmltopdf_converter converter))
]

{ #category : #'private - api - accessing' }
WKPDFLibrary >> getHTTPErrorCode: converter [

	^self ffiCall: #(int wkhtmltopdf_http_error_code(wkhtmltopdf_converter* converter))  
]

{ #category : #'private - api - accessing' }
WKPDFLibrary >> getPhaseDescription: converter forPhase: phase [

	 ^self ffiCall: #(String wkhtmltopdf_phase_description(wkhtmltopdf_converter converter, int phase))
]

{ #category : #'private - api - initialization' }
WKPDFLibrary >> init: useGraphics [

	 ^self ffiCall: #(int wkhtmltopdf_init(int useGraphics))
]

{ #category : #'private - api - callbacks' }
WKPDFLibrary >> setErrorCallback: cb onConverter: converter [

	 ^self ffiCall: #(void* wkhtmltopdf_set_error_callback(wkhtmltopdf_converter converter, wkhtmltopdf_str_callback cb))  
]

{ #category : #'private - api - settings' }
WKPDFLibrary >> setGlobalSetting: aName to: value in: settings [

	 ^self ffiCall: #(int wkhtmltopdf_set_global_setting(wkhtmltopdf_global_settings settings, String aName, String value))  
]

{ #category : #'private - api - settings' }
WKPDFLibrary >> setObjectSetting: aName to: value in: settings [

	 ^self ffiCall: #(int wkhtmltopdf_set_object_setting(wkhtmltopdf_object_settings settings, String aName, String value))  
]

{ #category : #initialization }
WKPDFLibrary >> setPhaseChangedCallback: cb onConverter: converter [

	 ^self ffiCall: #(void* wkhtmltopdf_set_phase_changed_callback(wkhtmltopdf_converter converter, wkhtmltopdf_void_callback cb))  
]

{ #category : #'private - api - callbacks' }
WKPDFLibrary >> setWarningCallback: cb onConverter: converter [
	 
	 ^self ffiCall: #(void* wkhtmltopdf_set_warning_callback(wkhtmltopdf_converter converter, wkhtmltopdf_str_callback cb))  
]

{ #category : #'accessing - platform' }
WKPDFLibrary >> win32LibraryName [

	^ FFIWindowsLibraryFinder findAnyLibrary: #('wkhtmltox.dll')

]
