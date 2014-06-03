"
The WKPDF executable
"
Class {
	#name : #WKPDFExecutable,
	#superclass : #Object,
	#category : #'WKHTML2PDF-Core-Executable'
}

{ #category : #converting }
WKPDFExecutable class >> convert: url toFile: fileName [
	"
	self convert: 'http://geekz.co.uk/lovesraymond/archive/eler-highlights-2008'
	       toFile: 'eler3.pdf'
	"
	self runWKHTMLWithOptions: url, ' ', fileName
]

{ #category : #converting }
WKPDFExecutable class >> runWKHTMLWithOptions: options [

	Smalltalk os isWin32 
		ifTrue: [ ^ WinProcess createHeadlessProcess:  'wkhtmltopdf.exe ', options ].
	Smalltalk os isUnix 
		ifTrue: [ ^  OSProcess execute: 'wkhtmltopdf ', options ]
]
