Class {
	#name : 'L',
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
L class >> getAllRules [
  "gets all rules of the subclass it is called for"
    (self classPool includesKey: #RulesDictionary)
        ifFalse: [ Error new signal: 'RulesDictionary not defined in subclass.' ].
    
    (self classPool at: #RulesDictionary) ifNil: [
        self initialiseRules.
    ].

    ^ self classPool at: #RulesDictionary.
]

{ #category : 'accessing' }
L class >> initialiseRules [
    "Initialize rules for letter L"
    self classPool at: #RulesDictionary put: OrderedCollection new.

    "Add all L rules (with '=' removed from patterns)"
    self addRule: ' (L) ' replacement: 'EH4L'.
    self addRule: '(LO)C#' replacement: 'LOW'.
    self addRule: 'L(L)' replacement: ''.
    self addRule: '#:^(L)%' replacement: 'UL'.
    self addRule: '(LEAD)' replacement: 'LIYD'.
    self addRule: ' (LAUGH)' replacement: 'LAE4F'.
    self addRule: '(L)' replacement: 'L'.

]

{ #category : 'accessing' }
L class >> printRules [
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
