Class {
	#name : 'O',
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
O class >> getAllRules [
  "gets all rules of the subclass it is called for"
    (self classPool includesKey: #RulesDictionary)
        ifFalse: [ Error new signal: 'RulesDictionary not defined in subclass.' ].
    
    (self classPool at: #RulesDictionary) ifNil: [
        self initialiseRules.
    ].

    ^ self classPool at: #RulesDictionary.
]

{ #category : 'accessing' }
O class >> initialiseRules [
    "Initialize rules for letter O"
    self classPool at: #RulesDictionary put: OrderedCollection new.

    "Add all O rules (with '=' removed from patterns)"
    self addRule: ' (O) ' replacement: 'OH4W'.
    self addRule: '(OF)' replacement: 'AHV'.
    self addRule: ' (OH)' replacement: 'OW5'.
    self addRule: '(OROUGH)' replacement: 'ER4OW'.
    self addRule: '#:(OR)' replacement: 'ER'.
    self addRule: '#:(ORS)' replacement: 'ERZ'.
    self addRule: '(OR)' replacement: 'AOR'.
    self addRule: ' (ONE)' replacement: 'WAHN'.
    self addRule: '#(ONE)' replacement: 'WAHN'.
    self addRule: '(OW)' replacement: 'OW'.
    self addRule: ' (OVER)' replacement: 'OW5VER'.
    self addRule: 'PR(O)V' replacement: 'UW4'.
    self addRule: '(OV)' replacement: 'AH4V'.
    self addRule: '(O)^%' replacement: 'OW5'.
    self addRule: '(O)^EN' replacement: 'OW'.
    self addRule: '(O)^I#' replacement: 'OW5'.
    self addRule: '(OL)D' replacement: 'OW4L'.
    self addRule: '(OUGHT)' replacement: 'AO5T'.
    self addRule: '(OUGH)' replacement: 'AH5F'.
    self addRule: ' (OU)' replacement: 'AW'.
    self addRule: 'H(OU)S#' replacement: 'AW4'.
    self addRule: '(OUS)' replacement: 'AXS'.
    self addRule: '(OUR)' replacement: 'OHR'.
    self addRule: '(OULD)' replacement: 'UH5D'.
    self addRule: '(OU)^L' replacement: 'AH5'.
    self addRule: '(OUP)' replacement: 'UW5P'.
    self addRule: '(OU)' replacement: 'AW'.
    self addRule: '(OY)' replacement: 'OY'.
    self addRule: '(OING)' replacement: 'OW4IHNX'.
    self addRule: '(OI)' replacement: 'OY5'.
    self addRule: '(OOR)' replacement: 'OH5R'.
    self addRule: '(OOK)' replacement: 'UH5K'.
    self addRule: 'F(OOD)' replacement: 'UW5D'.
    self addRule: 'L(OOD)' replacement: 'AH5D'.
    self addRule: 'M(OOD)' replacement: 'UW5D'.
    self addRule: '(OOD)' replacement: 'UH5D'.
    self addRule: 'F(OOT)' replacement: 'UH5T'.
    self addRule: '(OO)' replacement: 'UW5'.
    self addRule: '(O'')' replacement: 'OH'.
    self addRule: '(O)E' replacement: 'OW'.
    self addRule: '(O)' replacement: 'OW'.
    self addRule: '(OA)' replacement: 'OW4'.
    self addRule: ' (ONLY)' replacement: 'OW4NLIY'.
    self addRule: ' (ONCE)' replacement: 'WAH4NS'.
    self addRule: '(ON''T)' replacement: 'OW4NT'.
    self addRule: 'C(O)N' replacement: 'AA'.
    self addRule: '(O)NG' replacement: 'AO'.
    self addRule: ' :^(O)N' replacement: 'AH'.
    self addRule: 'I(ON)' replacement: 'UN'.
    self addRule: '#:(ON)' replacement: 'UN'.
    self addRule: '#^(ON)' replacement: 'UN'.
    self addRule: '(O)ST' replacement: 'OW'.
    self addRule: '(OF)^' replacement: 'AO4F'.
    self addRule: '(OTHER)' replacement: 'AH5DHER'.
    self addRule: 'R(O)B' replacement: 'RAA'.
    self addRule: '^R(O):#' replacement: 'OW5'.
    self addRule: '(OSS)' replacement: 'AO5S'.
    self addRule: '#:^(OM)' replacement: 'AHM'.
    self addRule: '(O)' replacement: 'AA'.

]

{ #category : 'accessing' }
O class >> printRules [
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
