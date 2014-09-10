"
Settings for WKPDF
"
Class {
	#name : #HTML2PDFSettings,
	#superclass : #Object,
	#instVars : [
		'options'
	],
	#category : #'WKHTML2PDF-Core-Basic-Settings'
}

{ #category : #initialization }
HTML2PDFSettings >> addOption: option value: aValue [

	self options at: option put: aValue
]

{ #category : #initialization }
HTML2PDFSettings >> addSingleOption: option [

	self options at: option put: nil
]

{ #category : #accessing }
HTML2PDFSettings >> hasOption: aString [ 
	^self options includesKey: aString
]

{ #category : #initialization }
HTML2PDFSettings >> initialize [
	super initialize.
	options := Dictionary new.
]

{ #category : #'private accessing' }
HTML2PDFSettings >> options [

	^options
]

{ #category : #accessing }
HTML2PDFSettings >> valueForOption: aString [ 
	^self options at: aString ifAbsent: nil
]
