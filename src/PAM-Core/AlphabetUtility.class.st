Class {
	#name : 'AlphabetUtility',
	#superclass : 'Object',
	#classInstVars : [
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
    self registerLetterRules: LetterARules for: $A.
    "self registerLetterRules: LetterBRules for: $B."
]

{ #category : 'initialization - data' }
AlphabetUtility class >> registerLetterRules: ruleClass for: letter [
    "Register a letter's rules"
    RulesDictionaryByLetter at: letter asUppercase put: ruleClass rules
]

{ #category : 'accessing' }
AlphabetUtility class >> rulesFor: aCharacter [
    "Get all rules for a specific character"
    ^ (RulesDictionaryByLetter at: aCharacter asUppercase ifAbsent: [ #() ]) asOrderedCollection
]
