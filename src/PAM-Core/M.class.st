Class {
	#name : 'M',
	#superclass : 'LetterRules',
	#classVars : [
		'RulesDictionary'
	],
	#classInstVars : [
		'RulesDictionary'
	],
	#category : 'PAM-Core-Rules',
	#package : 'PAM-Core',
	#tag : 'Rules'
}

{ #category : 'accessing' }
M class >> getAllRules [
  "gets all rules of the subclass it is called for"
    (self classPool includesKey: #RulesDictionary)
        ifFalse: [ Error new signal: 'RulesDictionary not defined in subclass.' ].
    
    (self classPool at: #RulesDictionary) ifNil: [
        self initialiseRules.
    ].

    ^ self classPool at: #RulesDictionary.
]

{ #category : 'accessing' }
M class >> initialiseRules [

	self classPool at: #RulesDictionary put: OrderedCollection new.
	
	self addRule: ' (M)' replacement: 'EH4M'.
	self addRule: ' (MR.)' replacement: 'MIH4STER'.
	self addRule: ' (MS.)' replacement: 'MIH5Z'.
	self addRule: ' (MRS.)' replacement: 'MIH4SIXZ'.
	self addRule: '(MOV)' replacement: 'MUW4V'.
	self addRule: '(MACHIN)' replacement: 'MAHSHIY5N'.
	self addRule: 'M(M)' replacement: ''.
	self addRule: '(M)' replacement: 'M'.
]

{ #category : 'accessing' }
M class >> printRules [
    "Print all rules added to a letter's ruleset"
    | rules |
    Transcript open.
    rules := self getAllRules.

    rules ifNil: [
        Transcript show: 'RulesDictionary is nil. Initialize first.'; cr.
        ^ self
    ].

    rules do: [ :rule |
        Transcript
            show: rule prefix;
            show: '(';
            show: rule pattern;
            show: ')';
            show: rule suffix;
            show: ' -> ';
            show: rule replacement;
            cr
    ].

]
