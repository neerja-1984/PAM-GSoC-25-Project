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
	
	self assert: phonemeOutput equals: 'EY5NTICIPAETEH'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testBibliography [

	| phonemeOutput inputText  |
	inputText := 'Bibliography'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'BIBLIAAGRAEP/HY'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testCelsius [

	| phonemeOutput inputText  |
	inputText := 'Celsius'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'CEHLSIUS'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testDictionary [

	| phonemeOutput inputText  |
	inputText := 'Dictionary'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'DICTIUNEH4RY'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testDomenico [

	| phonemeOutput inputText  |
	inputText := 'Domenico'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'DOWMEHNICAA'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testEngineering [

	| phonemeOutput inputText  |
	inputText := 'Engineering'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'EHNGINIY4RING'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testFluorescent [

	| phonemeOutput inputText  |
	inputText := 'Fluorescent'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'FLUAOREHSCEHNT'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testGasoline [

	| phonemeOutput inputText  |
	inputText := 'Gasoline'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'GEY4SAALINEH'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testHallucination [ 

	| phonemeOutput inputText  |
	inputText := 'Hallucination'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: '/HAOLUCINAETIUN'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testInfluence [

	| phonemeOutput inputText  |
	inputText := 'Influence'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'INFLUEHNCEH'.
	
	
	
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
	
	self assert: phonemeOutput equals: 'KNIFEH'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testLeisure [

	| phonemeOutput inputText  |
	inputText := 'Leisure'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'LIY4SUREH'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testMusic [

	| phonemeOutput inputText  |
	inputText := 'Music'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'MUSIC'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testNahuel [

	| phonemeOutput inputText  |
	inputText := 'Nahuel'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'NAE/HUEHL'.
	
	
	
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
	
	self assert: phonemeOutput equals: 'NAATAETIUN'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testOxygen [

	| phonemeOutput inputText  |
	inputText := 'Oxygen'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'AAXYGEHN'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testPhoneme [

	| phonemeOutput inputText  |
	inputText := 'Phoneme'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'P/HAANEHMEH'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testQuestion [

	| phonemeOutput inputText  |
	inputText := 'Question'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'QUEHSTIUN'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testRhapsody [

	| phonemeOutput inputText  |
	inputText := 'Rhapsody'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'R/HEY5PSAADY'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testScissors [ 

	| phonemeOutput inputText  |
	inputText := 'Scissors'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'SCISSAORS'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testSunflower [

	| phonemeOutput inputText  |
	inputText := 'Sunflower'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'SUNFLOWER'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testTransportation [

	| phonemeOutput inputText  |
	inputText := 'Transportation'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'TRAENSPAORTAETIUN'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testUniversal [

	| phonemeOutput inputText  |
	inputText := 'Universal'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'UNIVERSAEL'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testVirtue [

	| phonemeOutput inputText  |
	inputText := 'Virtue'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'VIRTUEH'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testWrong [

	| phonemeOutput inputText  |
	inputText := 'Wrong'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'WRAANG'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testYawn [

	| phonemeOutput inputText  |
	inputText := 'Yawning'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'YAO5NING'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testZerox [

	| phonemeOutput inputText  |
	inputText := 'Zerox'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'ZEHRAAX'.
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testZigZag [

	| phonemeOutput inputText  |
	inputText := 'ZigZag'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'ZIGZAEG'.
	
	
	
]
