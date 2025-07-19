Class {
	#name : 'T',
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
T class >> getAllRules [
  "gets all rules of the subclass it is called for"
    (self classPool includesKey: #RulesDictionary)
        ifFalse: [ Error new signal: 'RulesDictionary not defined in subclass.' ].
    
    (self classPool at: #RulesDictionary) ifNil: [
        self initialiseRules.
    ].

    ^ self classPool at: #RulesDictionary.
]

{ #category : 'accessing' }
T class >> initialiseRules [

	self classPool at: #RulesDictionary put: OrderedCollection new.
	
	self addRule: '(T)' replacement: 'T'.
	self addRule: ' (T)' replacement: 'TIY4'.
	self addRule: ' (THE) #' replacement: 'DHIY'.
	self addRule: ' (THE)' replacement: 'DHAX'.
	self addRule: '(TO)' replacement: 'TUX'.
	self addRule: ' (THAT)' replacement: 'DHAET'.
	self addRule: ' (THIS)' replacement: 'DHIHS'.
	self addRule: ' (THEY)' replacement: 'DHEY'.
	self addRule: ' (THERE)' replacement: 'DHEHR'.
	self addRule: '(THER)' replacement: 'DHER'.
	self addRule: '(THEIR)' replacement: 'DHEHR'.
	self addRule: ' (THAN)' replacement: 'DHAEN'.
	self addRule: ' (THEM)' replacement: 'DHAEN'.
	self addRule: '(THESE)' replacement: 'DHIYZ'.
	self addRule: ' (THEN)' replacement: 'DHEHN'.
	self addRule: '(THROUGH)' replacement: 'THRUW4'.
	self addRule: '(THOSE)' replacement: 'DHOHZ'.
	self addRule: '(THOUGH)' replacement: 'DHOW'.
	self addRule: '(TODAY)' replacement: 'TUXDEY'.
	self addRule: '(TOMO)RROW' replacement: 'TUMAA5'.
	self addRule: '(TO)TAL' replacement: 'TOW5'.
	self addRule: ' (THUS)' replacement: 'DHAH4S'.
	self addRule: '(TH)' replacement: 'TH'.
	self addRule: '#:(TED)' replacement: 'TIXD'.
	self addRule: 'S(TI)#N' replacement: 'CH'.
	self addRule: '(TI)O' replacement: 'SH'.
	self addRule: '(TI)A' replacement: 'SH'.
	self addRule: '(TIEN)' replacement: 'SHUN'.
	self addRule: '(TUR)#' replacement: 'CHER'.
	self addRule: '(TU)A' replacement: 'CHUW'.
	self addRule: ' (TWO)' replacement: 'TUW'.
	self addRule: '&(T)EN ' replacement: ''.
]

{ #category : 'accessing' }
T class >> printRules [
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
