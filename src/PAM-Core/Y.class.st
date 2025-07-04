Class {
	#name : 'Y',
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
Y class >> getAllRules [
  "gets all rules of the subclass it is called for"
    (self classPool includesKey: #RulesDictionary)
        ifFalse: [ Error new signal: 'RulesDictionary not defined in subclass.' ].
    
    (self classPool at: #RulesDictionary) ifNil: [
        self initialiseRules.
    ].

    ^ self classPool at: #RulesDictionary.
]

{ #category : 'accessing' }
Y class >> initialiseRules [

	self classPool at: #RulesDictionary put: OrderedCollection new.

	self addRule: ' (Y)' replacement: 'WAY4'.
	self addRule: '(YOUNG)' replacement: 'YAHNX'.
	self addRule: ' (YOUR)' replacement: 'YOHR'.
	self addRule: ' (YOU)' replacement: 'YUW'.
	self addRule: ' (YES)' replacement: 'YEHS'.
	self addRule: ' (Y)' replacement: 'Y'.
	self addRule: 'F(Y)' replacement: 'AY'.
	self addRule: 'PS(YCH)' replacement: 'AYK'.
	self addRule: '#:^(Y)' replacement: 'IY'.
	self addRule: '#:^(Y)I' replacement: 'IY'.
	self addRule: ' :(Y) ' replacement: 'AY'.
	self addRule: ' :(Y)#' replacement: 'AY'.
	self addRule: ' :(Y)^+:#' replacement: 'IH'.
	self addRule: ' :(Y)^#' replacement: 'AY'.
	self addRule: '(Y)' replacement: 'IH'.
]

{ #category : 'accessing' }
Y class >> printRules [
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
