"
The WKPDF executable
"
Class {
	#name : #WKPDFExecutable,
	#superclass : #Object,
	#category : #'WKHTML2PDF-Core-Engines-Executable'
}

{ #category : #converting }
WKPDFExecutable class >> convert: url toFile: fileName [
	"
	self convert: 'http://www.pharo.org'
	       toFile: 'pharo.pdf'
	"
	self runWKHTMLWithOptions: url, ' ', fileName
]

{ #category : #converting }
WKPDFExecutable class >> runWKHTMLWithOptions: options [

	Smalltalk os isWin32 
		ifTrue: [ ^ OSProcess command: 'wkhtmltopdf.exe ', options ].
	Smalltalk os isUnix 
		ifTrue: [ ^  OSProcess command: 'wkhtmltopdf ', options ]
]
