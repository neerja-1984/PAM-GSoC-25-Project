Class {
	#name : 'FlagDefinitionTest',
	#superclass : 'TestCase',
	#category : 'PAM-Core-Tests-Reciter',
	#package : 'PAM-Core-Tests',
	#tag : 'Reciter'
}

{ #category : 'constants' }
FlagDefinitionTest >> testAllFlagValues [

	"Test that all flag constants have the correct values"

	self assert: Flags flagNumeric equals: 1.
	self assert: Flags flagRuleset2 equals: 2.
	self assert: Flags flagVoiced equals: 4.
	self assert: Flags flagReasonUnknown equals: 8.
	self assert: Flags flagFricatives equals: 16.
	self assert: Flags flagConsonant equals: 32.
	self assert: Flags flagVowelOrY equals: 64.
	self assert: Flags flagAlphaOrBackTick equals: 128
]

{ #category : 'constants' }
FlagDefinitionTest >> testFlagCombinations_withConsonants [

    | flags |
    
    "Test a consonant flag combination"
    flags := Flags flagConsonant bitOr: Flags flagVoiced.
    self assert: (flags bitAnd: Flags flagConsonant) > 0.
    self assert: (flags bitAnd: Flags flagVoiced) > 0.
    self assert: (flags bitAnd: Flags flagVowelOrY) equals: 0.
]

{ #category : 'constants' }
FlagDefinitionTest >> testFlagCombinations_withVowels [

    | flags |
    
    "Test a vowel flag combination"
    flags := Flags flagVowelOrY bitOr: Flags flagAlphaOrBackTick .
    self assert: (flags bitAnd: Flags flagVowelOrY) > 0.
    self assert: (flags bitAnd: Flags flagAlphaOrBackTick) > 0.
	 self assert: (flags bitAnd: Flags flagNumeric ) equals: 0.
]
