Class {
	#name : 'C',
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
C class >> getAllRules [
  "gets all rules of the subclass it is called for"
    (self classPool includesKey: #RulesDictionary)
        ifFalse: [ Error new signal: 'RulesDictionary not defined in subclass.' ].
    
    (self classPool at: #RulesDictionary) ifNil: [
        self initialiseRules.
    ].

    ^ self classPool at: #RulesDictionary.
]

{ #category : 'accessing' }
C class >> initialiseRules [
    "Initialize rules for letter C"
    self classPool at: #RulesDictionary put: OrderedCollection new.

    "Add all C rules"
	self addRule: '(C)+' replacement: 'S'.
	self addRule: '(C)' replacement: 'K'.
	self addRule: ' (C)' replacement: 'SIY4'.
	self addRule: ' (CH)^' replacement: 'K'.
	self addRule: '^E(CH)' replacement: 'K'.
	self addRule: '(CHA)R#' replacement: 'KEH5'.
	self addRule: '(CH)' replacement: 'CH'.
	self addRule: ' S(CI)#' replacement: 'SAY4'.
	self addRule: '(CI)A' replacement: 'SH'.
	self addRule: '(CI)O' replacement: 'SH'.
	self addRule: '(CI)EN' replacement: 'SH'.
	self addRule: '(CITY)' replacement: 'SIHTIY'.
	self addRule: '(CK)' replacement: 'K'.
	self addRule: '(COMMODORE)' replacement: 'KAA4MAHDOHR'.
	self addRule: '(COM)' replacement: 'KAHM'.
	self addRule: '(CUIT)' replacement: 'KIHT'.
	self addRule: '(CREA)' replacement: 'KRIYEY'.
]

{ #category : 'accessing' }
C class >> printRules [
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
