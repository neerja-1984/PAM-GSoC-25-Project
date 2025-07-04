Class {
	#name : 'E',
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
E class >> getAllRules [
  "gets all rules of the subclass it is called for"
    (self classPool includesKey: #RulesDictionary)
        ifFalse: [ Error new signal: 'RulesDictionary not defined in subclass.' ].
    
    (self classPool at: #RulesDictionary) ifNil: [
        self initialiseRules.
    ].

    ^ self classPool at: #RulesDictionary.
]

{ #category : 'accessing' }
E class >> initialiseRules [
    "Initialize rules for letter E"
    self classPool at: #RulesDictionary put: OrderedCollection new.

    "Add all E rules"
    self addRule: ' (E) ' replacement: 'IYIY4'.
    self addRule: '#:(E)' replacement: ''.
    self addRule: '\:^(E)' replacement: ''.
    self addRule: ' :(E)' replacement: 'IY'.
    self addRule: '#(ED)' replacement: 'D'.
    self addRule: '#:(E)D' replacement: ''.
    self addRule: '(EV)ER' replacement: 'EH4V'.
    self addRule: '(E)^%' replacement: 'IY4'.
    self addRule: '(ERI)#' replacement: 'IY4RIY'.
    self addRule: '(ERI)' replacement: 'EH4RIH'.
    self addRule: '#:(ER)#' replacement: 'ER'.
    self addRule: '(ERROR)' replacement: 'EH4ROHR'.
    self addRule: '(ERASE)' replacement: 'IHREY5S'.
    self addRule: '(ER)#' replacement: 'EHR'.
    self addRule: '(ER)' replacement: 'ER'.
    self addRule: ' (EVEN)' replacement: 'IYVEHN'.
    self addRule: '#:(E)W' replacement: ''.
    self addRule: '@(EW)' replacement: 'UW'.
    self addRule: '(EW)' replacement: 'YUW'.
    self addRule: '(E)O' replacement: 'IY'.
    self addRule: '#:&(ES)' replacement: 'IHZ'.
    self addRule: '#:(E)S' replacement: ''.
    self addRule: '#:(ELY)' replacement: 'LIY'.
    self addRule: '#:(EMENT)' replacement: 'MEHNT'.
    self addRule: '(EFUL)' replacement: 'FUHL'.
    self addRule: '(EE)' replacement: 'IY4'.
    self addRule: '(EARN)' replacement: 'ER5N'.
    self addRule: ' (EAR)^' replacement: 'ER5'.
    self addRule: '(EAD)' replacement: 'EHD'.
    self addRule: '#:(EA)' replacement: 'IYAX'.
    self addRule: '(EA)SU' replacement: 'EH5'.
    self addRule: '(EA)' replacement: 'IY5'.
    self addRule: '(EIGH)' replacement: 'EY4'.
    self addRule: '(EI)' replacement: 'IY4'.
    self addRule: ' (EYE)' replacement: 'AY4'.
    self addRule: '(EY)' replacement: 'IY'.
    self addRule: '(EU)' replacement: 'YUW5'.
    self addRule: '(EQUAL)' replacement: 'IY4KWUL'.
    self addRule: '(E)' replacement: 'EH'.

]

{ #category : 'accessing' }
E class >> printRules [
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
