"
LetterRules is a utility class that provides CRUD (Create, Read, Update, Delete) operations for phoneme rules associated with a particular letter.

Each subclass of LetterRules manages rules for one specific character (like A, B, C...), using a shared classPool variable called `RulesDictionary`, which stores an `OrderedCollection` of `RulePOJO` objects. Each rule includes a prefix, core pattern, suffix, and a phoneme replacement.

Core Features:

1. `addRule:replacement:`  
    Adds a new rule with the given pattern and replacement.  
    If a rule with the same prefix, pattern, and suffix already exists, its replacement is updated.  
    - Example:  
        LetterARules addRule: '(AR)#' replacement: 'EH4R'.

2. `removeRule:replacement:`  
    Removes a rule that matches the given pattern and replacement string.  
    - Example:  
        LetterARules removeRule: '(AR)#' replacement: 'EH4R'.

3. `initialiseRules`  
    Initializes the `RulesDictionary` for the subclass if it's not already set.  
    - Automatically called during rule access if needed.

4. `printRules`  
    Logs all rules for the current subclass (e.g., LetterARules) to the Transcript in a readable format.  
    - Output example: ^(AR)# -> EH4R

Design Note:  
LetterRules is designed to be subclassed for each letter (e.g., `A`, `B`) to modularize rule management.  



"
Class {
	#name : 'PunctuationRules',
	#superclass : 'Object',
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

{ #category : 'adding-removing methods' }
PunctuationRules class >> addRule: patternString replacement: replacement [
    "Add rule with pattern that may include prefix/suffix.
    If pattern exists, update its replacement."

    | ruleList existingRule parsedRule |

    ruleList := self getAllRules.

    "Create a new RulePOJO and parse the pattern"
    parsedRule := RulePOJO new.
    parsedRule parsePattern: patternString.
    parsedRule replacement: replacement.

    "Check if a rule with same core pattern already exists"
	existingRule := ruleList
    	detect: [ :each |
        	each pattern = parsedRule pattern and:
        	[ each prefix = parsedRule prefix and:
          	[ each suffix = parsedRule suffix ] ]
    	]
        ifNone: [ nil ].

    existingRule
        ifNotNil: [
            existingRule replacement: replacement.
            existingRule prefix: parsedRule prefix.
            existingRule suffix: parsedRule suffix.
            Transcript nextPutAll: 'Updated existing rule for pattern: '; nextPutAll: patternString; cr.
        ]
        ifNil: [
            ruleList add: parsedRule.
            Transcript nextPutAll: 'Added new rule for pattern: '; nextPutAll: patternString; cr.
        ].

]

{ #category : 'accessing' }
PunctuationRules class >> getAllRules [
	"Get all rules of the subclass it's called from."
	| rulesDict |
	
	"logger"
	(self classPool includesKey: #RulesDictionary)
		ifFalse: [ Error signal: 'RulesDictionary not defined in subclass.' ].
	
	rulesDict := self classPool at: #RulesDictionary.
	
	rulesDict ifNil: [
		"initlise then call the value of classPool"
		self initialiseRules.
		^ self classPool at: #RulesDictionary
	].

	^ rulesDict
]

{ #category : 'accessing' }
PunctuationRules class >> initialiseRules [
   "Initialize the class variable -> will be overridden by subclasses"
	self classPool at: #RulesDictionary put: OrderedCollection new.
	
    self addRule: '(!)' replacement: '.'.
    self addRule: '(") ' replacement: '-AH5NKWOWT-'.
    self addRule: '(")' replacement: 'KWOW4T-'.
    self addRule: '(#)' replacement: 'NAH4MBER'.
    self addRule: '($)' replacement: 'DAA4LER'.
    self addRule: '(%)' replacement: 'PERSEH4NT'.
    self addRule: '(&)' replacement: 'AEND'.
    self addRule: '(*)' replacement: 'AE4STERIHSK'.
    self addRule: '(+)' replacement: 'PLAH4S'.
    self addRule: '(,)' replacement: ','.
    self addRule: ' (-) ' replacement: '-'.
    self addRule: '(-)' replacement: ''.
    self addRule: '(.)' replacement: 'POYNT'.
    self addRule: '(/)' replacement: 'SLAE4SH'.
    self addRule: '(0)' replacement: 'ZIY4ROW'.
    self addRule: ' (1ST)' replacement: 'FER4ST'.
    self addRule: ' (10TH)' replacement: 'TEH4NTH'.
    self addRule: '(1)' replacement: 'WAH4N'.
    self addRule: ' (2ND)' replacement: 'SEH4KUND'.
    self addRule: '(2)' replacement: 'TUW4'.
    self addRule: ' (3RD)' replacement: 'THER4D'.
    self addRule: '(3)' replacement: 'THRIY4'.
    self addRule: '(4)' replacement: 'FOH4R'.
    self addRule: ' (5TH)' replacement: 'FIH4FTH'.
    self addRule: '(5)' replacement: 'FAY4V'.
    self addRule: ' (64) ' replacement: 'SIH4KSTIY FOHR'.
    self addRule: '(6)' replacement: 'SIH4KS'.
    self addRule: '(7)' replacement: 'SEH4VUN'.
    self addRule: ' (8TH)' replacement: 'EY4TH'.
    self addRule: '(8)' replacement: 'EY4T'.
    self addRule: '(9)' replacement: 'NAY4N'.
    self addRule: '(:)' replacement: '.'.
    self addRule: '(;)' replacement: '.'.
    self addRule: '(<)' replacement: 'LEH4S DHAEN'.
    self addRule: '(=)' replacement: 'IY4KWULZ'.
    self addRule: '(>)' replacement: 'GREY4TER DHAEN'.
    self addRule: '(?)' replacement: '?'.
    self addRule: '(@)' replacement: 'AE6T'.
    self addRule: '(^)' replacement: 'KAE4RIXT'.
]

{ #category : 'accessing' }
PunctuationRules class >> printRules [
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

{ #category : 'adding-removing methods' }
PunctuationRules class >> removeRule: aPattern replacement: aReplacement [
    "Removes the rule that matches the parsed core pattern and replacement."

    | ruleList ruleToRemove parsedRule corePattern |

    ruleList := self getAllRules.

    "Parse the pattern string to extract core pattern (between parentheses)"
    parsedRule := RulePOJO new.
    parsedRule parsePattern: aPattern.
    corePattern := parsedRule pattern.

    "Find the rule to remove"
    ruleToRemove := ruleList
        detect: [ :each |
            each pattern = corePattern and: [ each replacement = aReplacement ]
        ]
        ifNone: [
            Transcript
                nextPutAll: 'Rule not found for pattern: ';
                nextPutAll: aPattern;
                cr.
            ^ self
        ].

    "Remove the rule"
    ruleList remove: ruleToRemove.
    Transcript
        nextPutAll: 'Rule removed successfully for pattern: ';
        nextPutAll: aPattern;
        cr.

]
