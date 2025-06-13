"
Has CRUD Capabilities with Data Consistency 

1) addRule:replacement: 

		Adds a rule for a given character. If a rule with the same pattern exists, it updates the replacement. Otherwise, it adds a new rule.
		
2) removeRule:replacement:

		Removes all rules with matching pattern and replacement.
		
3) initialiseRules 
		
			Makes the RulesDictionary
			
4) printAllRules

		print all rules for this character -> open the dictionary type mapping in transcript.
"
Class {
	#name : 'LetterARules',
	#superclass : 'Object',
	#classInstVars : [
		'RulesDictionary'
	],
	#category : 'PAM-Core-Rules',
	#package : 'PAM-Core',
	#tag : 'Rules'
}

{ #category : 'accessing' }
LetterARules class >> addRule: pattern replacement: replacement [

    | ruleList existingRule |
    
    ruleList := self getAllRules.

    "Check if pattern exists"
    existingRule := ruleList detect: [ :each | each pattern = pattern ] ifNone: [ nil ].

    existingRule 
        ifNotNil: [ 
            existingRule replacement: replacement.
            Transcript nextPutAll: 'Updated existing rule for pattern: '; nextPutAll: pattern; cr.
        ]
        ifNil: [ 
            ruleList add: (Rules new
                pattern: pattern;
                replacement: replacement;
                yourself).
            Transcript nextPutAll: 'Added new rule for pattern: '; nextPutAll: pattern; cr.
        ].
]

{ #category : 'accessing' }
LetterARules class >> getAllRules [
    ^ RulesDictionary ifNil: [ self initialiseRules ]
]

{ #category : 'accessing' }
LetterARules class >> initialiseRules [
    "Initialize rules for letter A"
    RulesDictionary := OrderedCollection new.
    
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
LetterARules class >> printRules [
	"Print all rules added to this letter's ruleset"

	| rules |
	Transcript open.
	rules := self getAllRules.
	rules do: [ :rule |
		Transcript
			show: rule pattern;
			show: ' -> ';
			show: rule replacement;
			cr ]
]

{ #category : 'accessing' }
LetterARules class >> removeRule: aPattern replacement: aReplacement [

	| ruleList ruleToRemove |
	ruleList := self getAllRules.

	"Find the rule to remove"
	ruleToRemove := ruleList detect: [ :each |
		each pattern = aPattern and: [ each replacement = aReplacement ]
	] ifNone: [ 
		Transcript nextPutAll: 'Rule not found'; cr.
		^ self 
	].

	"Remove it"
	ruleList remove: ruleToRemove.
	Transcript nextPutAll: 'Rule removed successfully'; cr.

]
