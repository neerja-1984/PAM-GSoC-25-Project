Class {
	#name : 'P',
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
P class >> getAllRules [
  "gets all rules of the subclass it is called for"
    (self classPool includesKey: #RulesDictionary)
        ifFalse: [ Error new signal: 'RulesDictionary not defined in subclass.' ].
    
    (self classPool at: #RulesDictionary) ifNil: [
        self initialiseRules.
    ].

    ^ self classPool at: #RulesDictionary.
]

{ #category : 'accessing' }
P class >> initialiseRules [
    "Initialize rules for letter P"
    self classPool at: #RulesDictionary put: OrderedCollection new.

    "Add all P rules"
	self addRule: '(P)' replacement: 'P'.
	self addRule: ' (P)' replacement: 'PIY4'.
	self addRule: '(PH)' replacement: 'F'.
	self addRule: '(PEOPL)' replacement: 'PIY5PUL'.
	self addRule: '(POW)' replacement: 'PAW4'.
	self addRule: '(PUT)' replacement: 'PUHT'.
	self addRule: '(P)P' replacement: ''.
	self addRule: '(P)S' replacement: ''.
	self addRule: '(P)N' replacement: ''.
	self addRule: '(PROF.)' replacement: 'PROHFEH4SER'.

]

{ #category : 'accessing' }
P class >> printRules [
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
