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
	#name : 'LetterRules',
	#superclass : 'Object',
	#category : 'PAM-Core-Rules',
	#package : 'PAM-Core',
	#tag : 'Rules'
}

{ #category : 'accessing' }
LetterRules class >> addRule: pattern replacement: replacement [
	 "add rules ; incase pattern exists .. update it's replacement"
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
            ruleList add: (RulePOJO new
                pattern: pattern;
                replacement: replacement;
                yourself).
            Transcript nextPutAll: 'Added new rule for pattern: '; nextPutAll: pattern; cr.
        ].
]

{ #category : 'accessing' }
LetterRules class >> getAllRules [
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
LetterRules class >> initialiseRules [
   "Initialize the class variable -> will be overridden by subclasses"
	self classPool at: #RulesDictionary put: OrderedCollection new.
]

{ #category : 'accessing' }
LetterRules class >> printRules [
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
			show: rule pattern;
			show: ' -> ';
			show: rule replacement;
			cr ]
]

{ #category : 'accessing' }
LetterRules class >> removeRule: aPattern replacement: aReplacement [
	"Removes all rule for a given character with matching pattern and replacement."

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
