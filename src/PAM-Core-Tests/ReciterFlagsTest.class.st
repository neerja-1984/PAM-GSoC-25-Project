Class {
	#name : 'ReciterFlagsTest',
	#superclass : 'TestCase',
	#category : 'PAM-Core-Tests-Reciter',
	#package : 'PAM-Core-Tests',
	#tag : 'Reciter'
}

{ #category : 'constants' }
ReciterFlagsTest >> testAllFlagValues [

	"Test that all flag constants have the correct values"

	self assert: ReciterFlags flagNumeric equals: 1.
	self assert: ReciterFlags flagRuleset2 equals: 2.
	self assert: ReciterFlags flagVoiced equals: 4.
	self assert: ReciterFlags flagReasonUnknown equals: 8.
	self assert: ReciterFlags flagFricatives equals: 16.
	self assert: ReciterFlags flagConsonant equals: 32.
	self assert: ReciterFlags flagVowelOrY equals: 64.
	self assert: ReciterFlags flagAlphaOrBackTick equals: 128
]

{ #category : 'constants' }
ReciterFlagsTest >> testFlagCombinations_withConsonants [

    | flags |
    
    "Test a consonant flag combination"
    flags := ReciterFlags flagConsonant bitOr: ReciterFlags flagVoiced.
    self assert: (flags bitAnd: ReciterFlags flagConsonant) > 0.
    self assert: (flags bitAnd: ReciterFlags flagVoiced) > 0.
    self assert: (flags bitAnd: ReciterFlags flagVowelOrY) equals: 0.
]

{ #category : 'constants' }
ReciterFlagsTest >> testFlagCombinations_withVowels [

    | flags |
    
    "Test a vowel flag combination"
    flags := ReciterFlags flagVowelOrY bitOr: ReciterFlags flagAlphaOrBackTick .
    self assert: (flags bitAnd: ReciterFlags flagVowelOrY) > 0.
    self assert: (flags bitAnd: ReciterFlags flagAlphaOrBackTick) > 0.
	 self assert: (flags bitAnd: ReciterFlags flagNumeric ) equals: 0.
]
