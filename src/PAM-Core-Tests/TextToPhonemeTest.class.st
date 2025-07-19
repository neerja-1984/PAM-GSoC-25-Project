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
	AlphabetUtility initializeDictionary.
	reciter := Reciter new.
]

{ #category : 'tests' }
TextToPhonemeTest >> testAnticipate [

	| phonemeOutput inputText  |
	inputText := 'Anticipate'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'EY5NTIHKIHPAETEH'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testBibliography [

	| phonemeOutput inputText  |
	inputText := 'Bibliography'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'BIHBLIHOWJRAEFIH'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testChamomile [

	| phonemeOutput inputText  |
	inputText := 'Chamomile'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'CHAEMOWMIHLEH'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testDictionary [

	| phonemeOutput inputText  |
	inputText := 'Dictionary'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'DIY4IHSSHUNEH4RIH'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testDomenico [

	| phonemeOutput inputText  |
	inputText := 'Domenico'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'DUWMEHNIHKOW'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testEngineering [

	| phonemeOutput inputText  |
	inputText := 'Engineering'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'EHNXGIHNIY4RIHNX'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testFluorescent [

	| phonemeOutput inputText  |
	inputText := 'Fluorescent'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'FLUWAOREHZKEHNT'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testGasoline [

	| phonemeOutput inputText  |
	inputText := 'Gasoline'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'GEY4SOWLIHNEH'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testHallucination [ 

	| phonemeOutput inputText  |
	inputText := 'Hallucination'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: '/HAOLUWKIHNAESHUN'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testInfluence [

	| phonemeOutput inputText  |
	inputText := 'Influence'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'IHNFLUWEHNKEH'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testJazz [

	| phonemeOutput inputText  |
	inputText := 'Jazz'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'JAEZZ'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testKnife [

	| phonemeOutput inputText  |
	inputText := 'Knife'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'NIHFEH'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testLeisure [

	| phonemeOutput inputText  |
	inputText := 'Leisure'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'LIY4ZHEREH'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testMusic [

	| phonemeOutput inputText  |
	inputText := 'Music'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'MYUWZIHK'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testNahuel [

	| phonemeOutput inputText  |
	inputText := 'Nahuel'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'NAE/HYUWEHL'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testNeerja [

	| phonemeOutput inputText  |
	inputText := 'Neerja'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'NIY4RJAE'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testNotation [

	| phonemeOutput inputText  |
	inputText := 'Notation'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'NOWTAESHUN'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testOxygen [

	| phonemeOutput inputText  |
	inputText := 'Oxygen'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'OWKSIHGEHN'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testPhoneme [

	| phonemeOutput inputText  |
	inputText := 'Phoneme'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'FOWNEHMEH'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testQuestion [

	| phonemeOutput inputText  |
	inputText := 'Question'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'KWEHZCHUN'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testRhapsody [

	| phonemeOutput inputText  |
	inputText := 'Rhapsody'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'R/HEY5SOWDIH'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testScissors [ 

	| phonemeOutput inputText  |
	inputText := 'Scissors'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'SKIHSAORZ'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testSunflower [

	| phonemeOutput inputText  |
	inputText := 'Sunflower'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'SAH5NFLOWER'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testTransportation [

	| phonemeOutput inputText  |
	inputText := 'Transportation'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'TRAENZPAORTAESHUN'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testUniversal [

	| phonemeOutput inputText  |
	inputText := 'Universal'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'YUWNIHVERZAEL'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testVirtue [

	| phonemeOutput inputText  |
	inputText := 'Virtue'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'VERTUWEH'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testWrong [

	| phonemeOutput inputText  |
	inputText := 'Wrong'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'ROWNX'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testYawning [

	| phonemeOutput inputText  |
	inputText := 'Yawning'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'YAO5NIHNX'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testZerox [

	| phonemeOutput inputText  |
	inputText := 'Zerox'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'ZIY4EHROWKS'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testZigZag [

	| phonemeOutput inputText  |
	inputText := 'ZigZag'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'ZIY4IHJZAEG'.
	
	
	
]
