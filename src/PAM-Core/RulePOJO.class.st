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
		'replacement',
		'prefix',
		'suffix'
	],
	#category : 'PAM-Core-Rules',
	#package : 'PAM-Core',
	#tag : 'Rules'
}

{ #category : 'initialization' }
RulePOJO >> initialize [
    super initialize.
    pattern := ''.
    replacement := ''.
    prefix := ''.
    suffix := ''
]

{ #category : 'accessing' }
RulePOJO >> parsePattern: aString [
    "Parse a pattern string that may contain prefix and suffix in the format:
     'prefix(pattern)suffix' or just 'pattern'"
    | str start end |
    str := aString asString.
    
    "Check for prefix"
    start := str indexOf: $( ifAbsent: [ 0 ].
    end := str lastIndexOf: $) ifAbsent: [ 0 ].
    
    (start > 0 and: [ end > start ]) ifTrue: [
        prefix := str copyFrom: 1 to: start - 1.
        pattern := str copyFrom: start + 1 to: end - 1.
        suffix := str copyFrom: end + 1 to: str size.
    ] ifFalse: [
        pattern := str.
        prefix := ''.
        suffix := ''.
    ].
    
    ^ self
]

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
RulePOJO >> prefix [
    ^ prefix ifNil: [ '' ]
]

{ #category : 'accessing' }
RulePOJO >> prefix: aString [
    prefix := aString asString
]

{ #category : 'printing' }
RulePOJO >> printOn: aStream [
    aStream
        nextPutAll: self class name;
        nextPutAll: ' (prefix: ';
        print: self prefix;
        nextPutAll: ', pattern: ';
        print: self pattern;
        nextPutAll: ', suffix: ';
        print: self suffix;
        nextPutAll: ' -> replacement: ';
        print: self replacement;
        nextPut: $)

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

{ #category : 'accessing' }
RulePOJO >> suffix [
    ^ suffix ifNil: [ '' ]
]

{ #category : 'accessing' }
RulePOJO >> suffix: aString [
    suffix := aString asString
]
