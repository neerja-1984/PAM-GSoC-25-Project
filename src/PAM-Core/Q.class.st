Class {
	#name : 'Q',
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
Q class >> getAllRules [
  "gets all rules of the subclass it is called for"
    (self classPool includesKey: #RulesDictionary)
        ifFalse: [ Error new signal: 'RulesDictionary not defined in subclass.' ].
    
    (self classPool at: #RulesDictionary) ifNil: [
        self initialiseRules.
    ].

    ^ self classPool at: #RulesDictionary.
]

{ #category : 'accessing' }
Q class >> initialiseRules [

	self classPool at: #RulesDictionary put: OrderedCollection new.

	self addRule: ' (Q)' replacement: 'KYUW4'.
	self addRule: '(QUAR)' replacement: 'KWOH5R'.
	self addRule: '(QU)' replacement: 'KW'.
	self addRule: '(Q)' replacement: 'K'.
]

{ #category : 'accessing' }
Q class >> printRules [
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
