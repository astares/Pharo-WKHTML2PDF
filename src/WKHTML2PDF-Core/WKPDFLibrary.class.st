"
/* 
 * C example
 */

#include <stdio.h>
#include <stdlib.h>

#include <stdbool.h>

extern ""C"" {
#include <wkhtmltox\pdf.h>
}
 
int main(int argc, char** argv) {
         
        wkhtmltopdf_global_settings* gs;
	wkhtmltopdf_object_settings* os;
	wkhtmltopdf_converter* c;
        
        int a = wkhtmltopdf_init(false);
	printf(""%i"",a);
        
	gs = wkhtmltopdf_create_global_settings();
	wkhtmltopdf_set_global_setting(gs, ""out"", ""c:\\temp\\mia9.pdf"");
	
	os = wkhtmltopdf_create_object_settings();
	wkhtmltopdf_set_object_setting(os, ""page"", ""http://www.google.de"");
	
	c = wkhtmltopdf_create_converter(gs);
       
         wkhtmltopdf_add_object(c, os, NULL);
         
        
        if( !wkhtmltopdf_convert(c) )
		fprintf(stderr, ""Convertion failed!"");
		
	printf(""httpErrorCode: %d\n"", wkhtmltopdf_http_error_code(c));
	
	wkhtmltopdf_destroy_converter(c);
	
	wkhtmltopdf_deinit();
	
	 
	return 0;
}


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
	
	 ^NBFFICallout stdcall: #(void wkhtmltopdf_add_object(wkhtmltopdf_converter* converter, wkhtmltopdf_object_settings* settings, 0)) module: 'wkhtmltox.dll' options: #( - optCoerceNilToNull )
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

	|gs os c cb phaseCallback x |
	self init: 0.
	gs := self createGlobalSettings.
	x := self setGlobalSetting: 'out' to: 'c:\\temp\\mia8.pdf' in: gs.
 	Transcript show: x.
	os := self createObjectSettings.
	
      "The following call failed and returns 0 instead of 1"
	x := self setObjectSetting: 'page' to: 'http://www.google.de' in: os.
	Transcript show: x.
	c := self createConverter: gs.
	
	cb := WKPDFStringCallback on: [:con :m | Transcript show: m readString.].		
	self setErrorCallback: cb onConverter: c.
	self setWarningCallback: cb onConverter: c.
	
	 phaseCallback := WKPDFVoidCallback on: [:con |
		Transcript show: (self getCurrentPhase: con) asString.
	].
      self setPhaseChangedCallback: phaseCallback onConverter: c. 
	
	self addObject: c to: os.
	self convert: c.
	self destroyConverter: c.
	self deinit
	
 
]

{ #category : #'private - api calls' }
WKPDFLibrary class >> getCurrentPhase: converter [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(int* wkhtmltopdf_current_phase(wkhtmltopdf_converter* converter)) module: 'wkhtmltox.dll' 
]

{ #category : #'private - api calls' }
WKPDFLibrary class >> init: use_graphics [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(int wkhtmltopdf_init(int use_graphics)) module: 'wkhtmltox.dll' 
]

{ #category : #'private - api calls' }
WKPDFLibrary class >> setErrorCallback: cb onConverter: converter [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(void* wkhtmltopdf_set_error_callback(wkhtmltopdf_converter* converter, wkhtmltopdf_str_callback cb)) module: 'wkhtmltox.dll' 
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

{ #category : #'private - api calls' }
WKPDFLibrary class >> setPhaseChangedCallback: cb onConverter: converter [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(void* wkhtmltopdf_set_phase_changed_callback(wkhtmltopdf_converter* converter, wkhtmltopdf_void_callback cb)) module: 'wkhtmltox.dll' 
]

{ #category : #'private - api calls' }
WKPDFLibrary class >> setWarningCallback: cb onConverter: converter [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	 ^NBFFICallout stdcall: #(void* wkhtmltopdf_set_warning_callback(wkhtmltopdf_converter* converter, wkhtmltopdf_str_callback cb)) module: 'wkhtmltox.dll' 
]
