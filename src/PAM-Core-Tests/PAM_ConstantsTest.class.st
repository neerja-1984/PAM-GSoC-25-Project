Class {
	#name : 'PAM_ConstantsTest',
	#superclass : 'TestCase',
	#category : 'PAM-Core-Tests',
	#package : 'PAM-Core-Tests'
}

{ #category : 'Flags for Constant purpose' }
PAM_ConstantsTest >> testAllFlagValues [

	"Test that all flag constants have the correct values"

	self assert: PAM_Constants flagNumeric equals: 1.
	self assert: PAM_Constants flagRuleset2 equals: 2.
	self assert: PAM_Constants flagVoiced equals: 4.
	self assert: PAM_Constants flagReasonUnknown equals: 8.
	self assert: PAM_Constants flagFricatives equals: 16.
	self assert: PAM_Constants flagConsonant equals: 32.
	self assert: PAM_Constants flagVowelOrY equals: 64.
	self assert: PAM_Constants flagAlphaOrBackTick equals: 128
]

{ #category : 'Flags for Constant purpose' }
PAM_ConstantsTest >> testFlagCombinations_withConsonants [

    | flags |
    
    "Test a consonant flag combination"
    flags := PAM_Constants flagConsonant bitOr: PAM_Constants flagVoiced.
    self assert: (flags bitAnd: PAM_Constants flagConsonant) > 0.
    self assert: (flags bitAnd: PAM_Constants flagVoiced) > 0.
    self assert: (flags bitAnd: PAM_Constants flagVowelOrY) equals: 0.
]

{ #category : 'Flags for Constant purpose' }
PAM_ConstantsTest >> testFlagCombinations_withVowels [

    | flags |
    
    "Test a vowel flag combination"
    flags := PAM_Constants flagVowelOrY bitOr: PAM_Constants flagAlphaOrBackTick .
    self assert: (flags bitAnd: PAM_Constants flagVowelOrY) > 0.
    self assert: (flags bitAnd: PAM_Constants flagAlphaOrBackTick) > 0.
	 self assert: (flags bitAnd: PAM_Constants flagNumeric ) equals: 0.
]
