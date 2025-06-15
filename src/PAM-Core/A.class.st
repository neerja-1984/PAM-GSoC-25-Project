Class {
	#name : 'A',
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
A class >> getAllRules [
  "gets all rules of the subclass it is called for"
    (self classPool includesKey: #RulesDictionary)
        ifFalse: [ Error new signal: 'RulesDictionary not defined in subclass.' ].
    
    (self classPool at: #RulesDictionary) ifNil: [
        self initialiseRules.
    ].

    ^ self classPool at: #RulesDictionary.
]

{ #category : 'accessing' }
A class >> initialiseRules [
    "Initialize rules for letter A"
    self classPool at: #RulesDictionary put: OrderedCollection new.

    "Add all A rules"
    self addRule: ' (A.)' replacement: 'EH4Y.'.
    self addRule: '(A) ' replacement: 'AH'.
    self addRule: ' (ARE) ' replacement: 'AAR'.
    self addRule: ' (AR)O' replacement: 'AXR'.
    self addRule: '(AR)#' replacement: 'EH4R'.
    self addRule: ' ^(AS)#' replacement: 'EY4S'.
    self addRule: '(A)WA' replacement: 'AX'.
    self addRule: '(AW)' replacement: 'AO5'.
    self addRule: ' :(ANY)' replacement: 'EH4NIY'.
    self addRule: '(A)^+#' replacement: 'EY5'.
    self addRule: '#:(ALLY)' replacement: 'ULIY'.
    self addRule: ' (AL)#' replacement: 'UL'.
    self addRule: '(AGAIN)' replacement: 'AXGEH4N'.
    self addRule: '#:(AG)E' replacement: 'IHJ'.
    self addRule: '(A)^%' replacement: 'EY'.
    self addRule: '(A)^+:#' replacement: 'AE'.
    self addRule: ' :(A)^+ ' replacement: 'EY4'.
    self addRule: ' (ARR)' replacement: 'AXR'.
    self addRule: '(ARR)' replacement: 'AE4R'.
    self addRule: ' ^(AR) ' replacement: 'AA5R'.
    self addRule: '(AR)' replacement: 'AA5R'.
    self addRule: '(AIR)' replacement: 'EH4R'.
    self addRule: '(AI)' replacement: 'EY4'.
    self addRule: '(AY)' replacement: 'EY5'.
    self addRule: '(AU)' replacement: 'AO4'.
    self addRule: '#:(AL) ' replacement: 'UL'.
    self addRule: '#:(ALS) ' replacement: 'ULZ'.
    self addRule: '(ALK)' replacement: 'AO4K'.
    self addRule: '(AL)^' replacement: 'AOL'.
    self addRule: ' :(ABLE)' replacement: 'EY4BUL'.
    self addRule: '(ABLE)' replacement: 'AXBUL'.
    self addRule: '(A)VO' replacement: 'EY4'.
    self addRule: '(ANG)+' replacement: 'EY4NJ'.
    self addRule: '(ATARI)' replacement: 'AHTAA4RIY'.
    self addRule: '(A)TOM' replacement: 'AE'.
    self addRule: '(A)TTI' replacement: 'AE'.
    self addRule: ' (AT) ' replacement: 'AET'.
    self addRule: ' (A)T' replacement: 'AH'.
    self addRule: '(A)' replacement: 'AE'
]

{ #category : 'accessing' }
A class >> printRules [

	| tmp1 |
	Transcript open.
	tmp1 := self getAllRules.
	tmp1
		ifNil: [
			Transcript
				show: 'RulesDictionary is nil. Initialize first.';
				cr.
			^ self ]
		ifNotNil: [ tmp1 ].
	tmp1 do: [ :arg1 |
		Transcript
			show: arg1 pattern;
			show: ' -> ';
			show: arg1 replacement;
			cr ]
]
