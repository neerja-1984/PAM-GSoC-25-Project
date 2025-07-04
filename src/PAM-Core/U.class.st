Class {
	#name : 'U',
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
U class >> getAllRules [
  "gets all rules of the subclass it is called for"
    (self classPool includesKey: #RulesDictionary)
        ifFalse: [ Error new signal: 'RulesDictionary not defined in subclass.' ].
    
    (self classPool at: #RulesDictionary) ifNil: [
        self initialiseRules.
    ].

    ^ self classPool at: #RulesDictionary.
]

{ #category : 'accessing' }
U class >> initialiseRules [

	self classPool at: #RulesDictionary put: OrderedCollection new.

	self addRule: ' (U)' replacement: 'YUW4'.
	self addRule: ' (UN)I' replacement: 'YUWN'.
	self addRule: ' (UN)' replacement: 'AHN'.
	self addRule: ' (UPON)' replacement: 'AXPAON'.
	self addRule: '@(UR)#' replacement: 'UH4R'.
	self addRule: '(UR)#' replacement: 'YUH4R'.
	self addRule: '(UR)' replacement: 'ER'.
	self addRule: '(U)^ ' replacement: 'AH'.
	self addRule: '(U)^^' replacement: 'AH5'.
	self addRule: '(UY)' replacement: 'AY5'.
	self addRule: ' G(U)#' replacement: ''.
	self addRule: 'G(U)%' replacement: ''.
	self addRule: 'G(U)#' replacement: 'W'.
	self addRule: '#N(U)' replacement: 'YUW'.
	self addRule: '@(U)' replacement: 'UW'.
	self addRule: '(U)' replacement: 'YUW'.
]

{ #category : 'accessing' }
U class >> printRules [
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
