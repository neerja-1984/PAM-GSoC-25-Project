Class {
	#name : 'LetterTest',
	#superclass : 'TestCase',
	#classVars : [
		'originalRules'
	],
	#category : 'PAM-Core-Tests-Rules',
	#package : 'PAM-Core-Tests',
	#tag : 'Rules'
}

{ #category : 'tests' }
LetterTest >> resetRulesUtility [
    "Helper method to clear RulesDictionary before each test"
    A classPool at: #RulesDictionary put: OrderedCollection new.
]

{ #category : 'running' }
LetterTest >> setUp [
    "Backup the current RulesDictionary"
    super setUp.
    originalRules := (A classPool at: #RulesDictionary) collect: [:each | each copy]. 
    self resetRulesUtility.
]

{ #category : 'running' }
LetterTest >> tearDown [
	 "Restore or clean up logic here if needed"
	 A classPool at: #RulesDictionary put: originalRules copy.
    super tearDown.

]

{ #category : 'tests' }
LetterTest >> testAddRule [

	| rules match |
	self resetRulesUtility.
	A addRule: 'TEST' replacement: 'VALUE'.

	rules := A getAllRules.
	match := rules detect: [ :r | r pattern = 'TEST' ] ifNone: [ nil ].

	self assert: match notNil.
	self assert: match replacement equals: 'VALUE'
]

{ #category : 'tests' }
LetterTest >> testAddRuleUpdatesIfExists [
	 | rules match |
    self resetRulesUtility .

    A addRule: 'DUPLICATE' replacement: 'OLD'.
    A addRule: 'DUPLICATE' replacement: 'NEW'.

    rules := A getAllRules.
    match := rules detect: [ :r | r pattern = 'DUPLICATE' ] ifNone: [ nil ].

    self assert: match notNil.
    self assert: match replacement equals: 'NEW'.
    self assert: (rules select: [:r | r pattern = 'DUPLICATE']) size equals: 1.
]

{ #category : 'tests' }
LetterTest >> testGetAllRulesReturnsCollection [

	| rules |
	rules := A getAllRules.
	self assert: rules class equals: OrderedCollection
]

{ #category : 'tests' }
LetterTest >> testMatchesRule [

	| rules match |
	rules := AlphabetUtility rulesFor: $L.
	match := ReciterUtility matches: (rules at: 2) in: 'LLO' at: 2.
	
	self assert: match.

]

{ #category : 'tests' }
LetterTest >> testRemoveRule [
	 | rules match |
	
    self resetRulesUtility .

    A addRule: 'REMOVE_ME' replacement: 'ABC'.
    A removeRule: 'REMOVE_ME' replacement: 'ABC'.

    rules := A getAllRules.
    match := rules detect: [ :r | r pattern = 'REMOVE_ME' ] ifNone: [ nil ].

    self assert: match isNil.
]
