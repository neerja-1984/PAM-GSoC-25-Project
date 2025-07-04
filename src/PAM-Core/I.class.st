Class {
	#name : 'I',
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
I class >> getAllRules [
  "gets all rules of the subclass it is called for"
    (self classPool includesKey: #RulesDictionary)
        ifFalse: [ Error new signal: 'RulesDictionary not defined in subclass.' ].
    
    (self classPool at: #RulesDictionary) ifNil: [
        self initialiseRules.
    ].

    ^ self classPool at: #RulesDictionary.
]

{ #category : 'accessing' }
I class >> initialiseRules [

	self classPool at: #RulesDictionary put: OrderedCollection new.
	
	self addRule: ' (IN)' replacement: 'IHN'.
	self addRule: ' (I)' replacement: 'AY4'.
	self addRule: '(I)' replacement: 'AY'.
	self addRule: '(IN)D' replacement: 'AY5N'.
	self addRule: 'SEM(I)' replacement: 'IY'.
	self addRule: ' ANT(I)' replacement: 'AY'.
	self addRule: '(IER)' replacement: 'IYER'.
	self addRule: '#:R(IED)' replacement: 'IYD'.
	self addRule: '(IED)' replacement: 'AY5D'.
	self addRule: '(IEN)' replacement: 'IYEHN'.
	self addRule: '(IE)T' replacement: 'AY4EH'.
	self addRule: ' :(I)^%' replacement: 'AY5'.
	self addRule: ' :(IE)' replacement: 'AY4'.
	self addRule: '(I)%' replacement: 'IY'.
	self addRule: '(IE)' replacement: 'IY4'.
	self addRule: ' (IDEA)' replacement: 'AYDIY5AH'.
	self addRule: '(I)^+:#' replacement: 'IH'.
	self addRule: '(IR)#' replacement: 'AYR'.
	self addRule: '(IZ)%' replacement: 'AYZ'.
	self addRule: '(IS)%' replacement: 'AYZ'.
	self addRule: 'I^(I)^#' replacement: 'IH'.
	self addRule: '+^(I)^+' replacement: 'AY'.
	self addRule: '#:^(I)^+' replacement: 'IH'.
	self addRule: '(I)^+' replacement: 'AY'.
	self addRule: '(IR)' replacement: 'ER'.
	self addRule: '(IGH)' replacement: 'AY4'.
	self addRule: '(ILD)' replacement: 'AY5LD'.
	self addRule: ' (IGN)' replacement: 'IHGN'.
	self addRule: '(IGN)' replacement: 'AY4N'.
	self addRule: '(IGN)^' replacement: 'AY4N'.
	self addRule: '(IGN)%' replacement: 'AY4N'.
	self addRule: '(ICRO)' replacement: 'AY4KROH'.
	self addRule: '(IQUE)' replacement: 'IY4K'.
	self addRule: '(I)' replacement: 'IH'.
]

{ #category : 'accessing' }
I class >> printRules [
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
