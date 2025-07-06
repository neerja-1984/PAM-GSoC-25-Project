Class {
	#name : 'SpecialCharacterMappingTest',
	#superclass : 'TestCase',
	#category : 'PAM-Core-Tests-Reciter',
	#package : 'PAM-Core-Tests',
	#tag : 'Reciter'
}

{ #category : 'tests' }
SpecialCharacterMappingTest >> testCHFricativeMatch [
	"Check 'CH' — H at position 4, prev is C"

	| text result |
	text := 'RICH'.
	result := ReciterUtility
		          matchSpecialCharacter: $&
		          in: text
		          at: 4
		          direction: 1.
	self assert: result equals: 5
]

{ #category : 'tests' }
SpecialCharacterMappingTest >> testConsonantMatch [
	"B is a consonant"

	| text result |
	text := 'BAT'.
	result := ReciterUtility
		          matchSpecialCharacter: $^
		          in: text
		          at: 1
		          direction: 1.
	self assert: result equals: 2
]

{ #category : 'tests' }
SpecialCharacterMappingTest >> testSHFricativeMatch [
	"Check 'SH' — H at position 4, prev is S"

	| text result |
	text := 'WASH'.
	result := ReciterUtility
		          matchSpecialCharacter: $&
		          in: text
		          at: 4
		          direction: 1.
	self assert: result equals: 5
]

{ #category : 'tests' }
SpecialCharacterMappingTest >> testVowelExcludingYMatch [

	| text result |
	text := 'EAST'.
	result := ReciterUtility
		          matchSpecialCharacter: $:
		          in: text
		          at: 2
		          direction: 1.
	self assert: result equals: 3.
]

{ #category : 'tests' }
SpecialCharacterMappingTest >> testVowelOrY [

    | text result |
    text := 'HAPPY'.
    result := ReciterUtility matchSpecialCharacter: $# in: text at: 5 direction: 1.
    self assert: result = 6.
]

{ #category : 'tests' }
SpecialCharacterMappingTest >> testVowelOrYMatch [

    | text result |
    text := 'HAPPY'.
    result := ReciterUtility matchSpecialCharacter: $# in: text at: 5 direction: 1.
    self assert: result = 6.
]
