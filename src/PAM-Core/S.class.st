Class {
	#name : 'S',
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
S class >> getAllRules [
  "gets all rules of the subclass it is called for"
    (self classPool includesKey: #RulesDictionary)
        ifFalse: [ Error new signal: 'RulesDictionary not defined in subclass.' ].
    
    (self classPool at: #RulesDictionary) ifNil: [
        self initialiseRules.
    ].

    ^ self classPool at: #RulesDictionary.
]

{ #category : 'accessing' }
S class >> initialiseRules [

	self classPool at: #RulesDictionary put: OrderedCollection new.

	self addRule: '(S)' replacement: 'S'.
	self addRule: ' (S)' replacement: 'EH4S'.
	self addRule: '(SH)' replacement: 'SH'.
	self addRule: '#(SION)' replacement: 'ZHUN'.
	self addRule: '(SOME)' replacement: 'SAHM'.
	self addRule: '#(SUR)#' replacement: 'ZHER'.
	self addRule: '(SUR)#' replacement: 'SHER'.
	self addRule: '#(SU)#' replacement: 'ZHUW'.
	self addRule: '#(SSU)#' replacement: 'SHUW'.
	self addRule: '#(SED)' replacement: 'ZD'.
	self addRule: '#(S)#' replacement: 'Z'.
	self addRule: '(SAID)' replacement: 'SEHD'.
	self addRule: '^(SION)' replacement: 'SHUN'.
	self addRule: '(S)S' replacement: ''.
	self addRule: '.(S)' replacement: 'Z'.
	self addRule: '#:.E(S)' replacement: 'Z'.
	self addRule: '#:^#(S)' replacement: 'S'.
	self addRule: 'U(S)' replacement: 'S'.
	self addRule: ' :#(S)' replacement: 'Z'.
	self addRule: '##(S)' replacement: 'Z'.
	self addRule: ' (SCH)' replacement: 'SK'.
	self addRule: '(S)C+' replacement: ''.
	self addRule: '#(SM)' replacement: 'ZUM'.
	self addRule: '#(SN)' replacement: 'ZUM'.
	self addRule: '(STLE)' replacement: 'SUL'.
]

{ #category : 'accessing' }
S class >> printRules [
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
