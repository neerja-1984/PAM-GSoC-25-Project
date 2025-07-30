Class {
	#name : 'PhonemeToIPATest',
	#superclass : 'TestCase',
	#category : 'PAM-Core-Tests-Instrument',
	#package : 'PAM-Core-Tests',
	#tag : 'Instrument'
}

{ #category : 'tests' }
PhonemeToIPATest >> testStripStressMarkersInPhoneme [

	| result |
	result := PhonemeToIPAConvertor stripStressMarkersInPhoneme: 'EH1N2OW3'.
	self assert: result equals: 'EHNOW'
]
