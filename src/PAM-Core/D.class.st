Class {
	#name : 'D',
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
D class >> getAllRules [
  "gets all rules of the subclass it is called for"
    (self classPool includesKey: #RulesDictionary)
        ifFalse: [ Error new signal: 'RulesDictionary not defined in subclass.' ].
    
    (self classPool at: #RulesDictionary) ifNil: [
        self initialiseRules.
    ].

    ^ self classPool at: #RulesDictionary.
]

{ #category : 'accessing' }
D class >> initialiseRules [

	self classPool at: #RulesDictionary put: OrderedCollection new.

	self addRule: ' (D)' replacement: 'DIY4'.
	self addRule: ' (DR.)' replacement: 'DAA4KTER'.
	self addRule: '#:(DED)' replacement: 'DIHD'.
	self addRule: '.E(D)' replacement: 'D'.
	self addRule: '#:^E(D)' replacement: 'T'.
	self addRule: ' (DE)^#' replacement: 'DIH'.
	self addRule: ' (DO)' replacement: 'DUW'.
	self addRule: ' (DOES)' replacement: 'DAHZ'.
	self addRule: '(DONE)' replacement: 'DAH5N'.
	self addRule: '(DOING)' replacement: 'DUW4IHNX'.
	self addRule: ' (DOW)' replacement: 'DAW'.
	self addRule: '#(DU)A' replacement: 'JUW'.
	self addRule: '#(DU)^#' replacement: 'JAX'.
	self addRule: '(D)' replacement: 'D'.
]

{ #category : 'accessing' }
D class >> printRules [
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
