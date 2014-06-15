"
global settings
"
Class {
	#name : #HTML2PDFGlobalSettings,
	#superclass : #HTML2PDFSettings,
	#category : #'WKHTML2PDF-Core-Basic-Settings'
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
	
	self addOption: 'copies' value: number asString
]

{ #category : #options }
HTML2PDFGlobalSettings >> noCollate [
	"Do not collate when printing multiple copies"
	
	self addSingleOption: 'no-collate'
]
