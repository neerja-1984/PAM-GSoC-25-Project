"
""Has the instance variable pattern and replacement""
""Follows the order LHS -> RHS""
""where LHS = pattern""
""where RHS = replacement"" 
"
Class {
	#name : 'RulePOJO',
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
RulePOJO >> pattern [
    "Return the pattern string this rule matches against"
    ^ pattern
]

{ #category : 'accessing' }
RulePOJO >> pattern: aString [
    "Set the pattern string"
    pattern := aString
]

{ #category : 'accessing' }
RulePOJO >> replacement [
    "Return the replacement string"
    ^ replacement
]

{ #category : 'accessing' }
RulePOJO >> replacement: aString [
    "Set the replacement string"
    replacement := aString
]
