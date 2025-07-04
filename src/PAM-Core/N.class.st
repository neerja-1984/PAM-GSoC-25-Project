Class {
	#name : 'N',
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
N class >> getAllRules [
  "gets all rules of the subclass it is called for"
    (self classPool includesKey: #RulesDictionary)
        ifFalse: [ Error new signal: 'RulesDictionary not defined in subclass.' ].
    
    (self classPool at: #RulesDictionary) ifNil: [
        self initialiseRules.
    ].

    ^ self classPool at: #RulesDictionary.
]

{ #category : 'accessing' }
N class >> initialiseRules [

	self classPool at: #RulesDictionary put: OrderedCollection new.

	self addRule: 'E(NG)+' replacement: 'NJ'.
	self addRule: '(NG)R' replacement: 'NXG'.
	self addRule: '(NG)#' replacement: 'NXG'.
	self addRule: '(NGL)%' replacement: 'NXGUL'.
	self addRule: '(NG)' replacement: 'NX'.
	self addRule: '(NK)' replacement: 'NXK'.
	self addRule: ' (NOW)' replacement: 'NAW4'.
	self addRule: 'N(N)' replacement: ''.
	self addRule: '(NON)E' replacement: 'NAH4N'.
	self addRule: '(N)' replacement: 'N'.
]

{ #category : 'accessing' }
N class >> printRules [
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
