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

	self options at: 'collate' put: aValue
]

{ #category : #initialization }
HTML2PDFSettings >> addSingleOption: option [

	self options at: 'collate' put: nil
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
