Class {
	#name : 'Rules',
	#superclass : 'Object',
	#instVars : [
		'pattern',
		'replacement'
	],
	#category : 'PAM-Core-Rules',
	#package : 'PAM-Core',
	#tag : 'Rules'
}

{ #category : 'accessing' }
Rules >> pattern [
    "Return the pattern string this rule matches against"
    ^ pattern
]

{ #category : 'accessing' }
Rules >> pattern: aString [
    "Set the pattern string"
    pattern := aString
]

{ #category : 'accessing' }
Rules >> replacement [
    "Return the replacement string"
    ^ replacement
]

{ #category : 'accessing' }
Rules >> replacement: aString [
    "Set the replacement string"
    replacement := aString
]
