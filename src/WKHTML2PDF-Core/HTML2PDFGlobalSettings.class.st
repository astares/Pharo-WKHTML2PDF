"
global settings
"
Class {
	#name : #HTML2PDFGlobalSettings,
	#superclass : #HTML2PDFSettings,
	#category : #'WKHTML2PDF-Core-Base-Settings'
}

{ #category : #options }
HTML2PDFGlobalSettings >> collate [
	"Collate when printing multiple copies (default)"
	
	self addSingleOption: 'collate'
]

{ #category : #options }
HTML2PDFGlobalSettings >> cookieJAR: aPath [
	"Read and write cookies from and to the supplied cookie jar file"
	
	self addOption: 'cookie-jar' value: aPath
]

{ #category : #options }
HTML2PDFGlobalSettings >> copies: number [
	"Number of copies to print into the pdf file (default 1)"
	
	self addOption: 'copies' value: number
]

{ #category : #options }
HTML2PDFGlobalSettings >> dpi: anInteger [ 
	"Change the dpi explicitly (this has no effect on X11 based systems)"
	
	self addOption: 'dpi' value: anInteger
]

{ #category : #options }
HTML2PDFGlobalSettings >> grayscale [
	self addSingleOption: 'grayscale'
]

{ #category : #options }
HTML2PDFGlobalSettings >> lowQuality [                      
	"Generates lower quality pdf/ps. Useful to shrink the result document space"
	
	self addSingleOption: 'lowquality'
]

{ #category : #options }
HTML2PDFGlobalSettings >> noCollate [
	"Do not collate when printing multiple copies"
	
	self addSingleOption: 'no-collate'
]
