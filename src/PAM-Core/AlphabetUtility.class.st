Class {
	#name : 'AlphabetUtility',
	#superclass : 'Object',
	#classVars : [
		'RulesDictionaryByLetter'
	],
	#category : 'PAM-Core-Reciter',
	#package : 'PAM-Core',
	#tag : 'Reciter'
}

{ #category : 'initialization - data' }
AlphabetUtility class >> initializeDictionary [
    "Initialize the rule utility"
    RulesDictionaryByLetter := Dictionary new.
    
    "Register all letter rule classes"
    self registerLetterRules: A for: $A.
    self registerLetterRules: B for: $B.
    self registerLetterRules: E for: $E.
    self registerLetterRules: H for: $H.
    self registerLetterRules: L for: $L.
    self registerLetterRules: O for: $O.
]

{ #category : 'initialization - data' }
AlphabetUtility class >> registerLetterRules: ruleClass for: letter [
    "Register a letter's rules"
    RulesDictionaryByLetter at: letter asUppercase put: ruleClass getAllRules.
]

{ #category : 'accessing' }
AlphabetUtility class >> rulesFor: aCharacter [
    "Get all rules for a specific character"
    ^ (RulesDictionaryByLetter at: aCharacter asUppercase ifAbsent: [ #() ]) asOrderedCollection
]
