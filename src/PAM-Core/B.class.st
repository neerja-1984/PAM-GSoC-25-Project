Class {
	#name : 'B',
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
B class >> getAllRules [
  "gets all rules of the subclass it is called for"
    (self classPool includesKey: #RulesDictionary)
        ifFalse: [ Error new signal: 'RulesDictionary not defined in subclass.' ].
    
    (self classPool at: #RulesDictionary) ifNil: [
        self initialiseRules.
    ].

    ^ self classPool at: #RulesDictionary.
]

{ #category : 'accessing' }
B class >> initialiseRules [
    "Initialize rules for letter B"
    self classPool at: #RulesDictionary put: OrderedCollection new.

    "Add all B rules"
    self addRule: ' (B) ' replacement: 'BIY4'.
    self addRule: ' (BE)^#' replacement: 'BIH'.
    self addRule: '(BEING)' replacement: 'BIY4IHNX'.
    self addRule: ' (BOTH) ' replacement: 'BOW4TH'.
    self addRule: ' (BUS)#' replacement: 'BIH4Z'.
    self addRule: '(BREAK)' replacement: 'BREY5K'.
    self addRule: '(BUIL)' replacement: 'BIH4L'.
    self addRule: '(B)' replacement: 'B'
]

{ #category : 'accessing' }
B class >> printRules [
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
