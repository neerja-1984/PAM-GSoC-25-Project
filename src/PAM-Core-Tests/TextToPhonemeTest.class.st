Class {
	#name : 'TextToPhonemeTest',
	#superclass : 'TestCase',
	#instVars : [
		'reciter'
	],
	#classInstVars : [
		'reciter'
	],
	#category : 'PAM-Core-Tests-Reciter',
	#package : 'PAM-Core-Tests',
	#tag : 'Reciter'
}

{ #category : 'running' }
TextToPhonemeTest >> setUp [
	super setUp.
	reciter := Reciter new.
]

{ #category : 'tests' }
TextToPhonemeTest >> testBABAPhoneme [

	| phonemeOutput inputText  |
	inputText := 'BABA'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'BAEBAE'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testCollegePhoneme [

	| phonemeOutput inputText  |
	inputText := 'COLLEGE'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'KOW5ULEHG'.
	
	
	
]
