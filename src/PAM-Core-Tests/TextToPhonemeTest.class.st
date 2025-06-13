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
TextToPhonemeTest >> testCollegePhoneme [

	| phonemeOutput inputText  |
	inputText := 'COLLEGE'.
	
	phonemeOutput := reciter textToPhoneme: inputText.
	
	self assert: phonemeOutput equals: 'KOW5ULEHG'.
	
	
	
]
