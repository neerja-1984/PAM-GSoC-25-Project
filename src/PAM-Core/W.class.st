Class {
	#name : 'W',
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
W class >> getAllRules [
  "gets all rules of the subclass it is called for"
    (self classPool includesKey: #RulesDictionary)
        ifFalse: [ Error new signal: 'RulesDictionary not defined in subclass.' ].
    
    (self classPool at: #RulesDictionary) ifNil: [
        self initialiseRules.
    ].

    ^ self classPool at: #RulesDictionary.
]

{ #category : 'accessing' }
W class >> initialiseRules [

	self classPool at: #RulesDictionary put: OrderedCollection new.

	self addRule: ' (W)' replacement: 'DAH4BULYUW'.
	self addRule: ' (WERE)' replacement: 'WER'.
	self addRule: '(WA)SH' replacement: 'WAA'.
	self addRule: '(WA)ST' replacement: 'WEY'.
	self addRule: '(WA)S' replacement: 'WAH'.
	self addRule: '(WA)T' replacement: 'WAA'.
	self addRule: '(WHERE)' replacement: 'WHEHR'.
	self addRule: '(WHAT)' replacement: 'WHAHT'.
	self addRule: '(WHOL)' replacement: '/HOWL'.
	self addRule: '(WHO)' replacement: '/HUW'.
	self addRule: '(WH)' replacement: 'WH'.
	self addRule: '(WAR)#' replacement: 'WEHR'.
	self addRule: '(WAR)' replacement: 'WAOR'.
	self addRule: '(WOR)^' replacement: 'WER'.
	self addRule: '(WR)' replacement: 'R'.
	self addRule: '(WOM)A' replacement: 'WUHM'.
	self addRule: '(WOM)E' replacement: 'WIHM'.
	self addRule: '(WEA)R' replacement: 'WEH'.
	self addRule: '(WANT)' replacement: 'WAA5NT'.
	self addRule: 'ANS(WER)' replacement: 'ER'.
	self addRule: '(W)' replacement: 'W'.
]

{ #category : 'accessing' }
W class >> printRules [
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
