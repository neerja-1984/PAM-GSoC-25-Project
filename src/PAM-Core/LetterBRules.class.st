Class {
	#name : 'LetterBRules',
	#superclass : 'Object',
	#classInstVars : [
		'RulesDictionary'
	],
	#category : 'PAM-Core-Rules',
	#package : 'PAM-Core',
	#tag : 'Rules'
}

{ #category : 'accessing' }
LetterBRules class >> addRule: pattern replacement: replacement [
    "Add a new rule to the collection"
    | rule |
    rule := Rules new
        pattern: pattern;
		  replacement: replacement;
        yourself.
    RulesDictionary add: rule.
]

{ #category : 'accessing' }
LetterBRules class >> getAllRules [
    ^ RulesDictionary ifNil: 
		[ self initialiseRules. ]
]

{ #category : 'accessing' }
LetterBRules class >> initialiseRules [
    "Initialize rules for letter A"
    RulesDictionary := OrderedCollection new.

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
LetterBRules class >> printRules [
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
LetterBRules class >> removeRule: aPattern replacement: aReplacement [
	"Removes a rule for a given character (like $A) with matching pattern and replacement."

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
