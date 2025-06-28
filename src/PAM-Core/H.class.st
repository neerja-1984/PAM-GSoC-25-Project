Class {
	#name : 'H',
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
H class >> getAllRules [
  "gets all rules of the subclass it is called for"
    (self classPool includesKey: #RulesDictionary)
        ifFalse: [ Error new signal: 'RulesDictionary not defined in subclass.' ].
    
    (self classPool at: #RulesDictionary) ifNil: [
        self initialiseRules.
    ].

    ^ self classPool at: #RulesDictionary.
]

{ #category : 'accessing' }
H class >> initialiseRules [
    "Initialize rules for letter H"
    self classPool at: #RulesDictionary put: OrderedCollection new.

    "Add all H rules (with '=' removed from patterns)"
    self addRule: ' (H) ' replacement: 'EY4CH'.
    self addRule: ' (HAV)' replacement: '/HAE6V'.
    self addRule: ' (HERE)' replacement: '/HIYR'.
    self addRule: ' (HOUR)' replacement: 'AW5ER'.
    self addRule: '(HOW)' replacement: '/HAW'.
    self addRule: '(H)#' replacement: '/H'.
    self addRule: '(H)' replacement: ''.

]

{ #category : 'accessing' }
H class >> printRules [
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
