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
	
	self assert: phonemeOutput equals: #('EY5' 'N' 'T' 'IH' 'K' 'IH' 'P' 'AE' 'T' 'EH').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testBibliography [

	| phonemeOutput inputText  |
	inputText := 'Bibliography'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('B' 'IH' 'B' 'L' 'IH' 'OW' 'J' 'R' 'AE' 'F' 'IH').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testChamomile [

	| phonemeOutput inputText  |
	inputText := 'Chamomile'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('CH' 'AE' 'M' 'OW' 'M' 'IH' 'L' 'EH').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testDictionary [

	| phonemeOutput inputText  |
	inputText := 'Dictionary'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('DIY4' 'IH' 'S' 'SH' 'UN' 'EH4R' 'IH').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testDomenico [

	| phonemeOutput inputText  |
	inputText := 'Domenico'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('DUW' 'M' 'EH' 'N' 'IH' 'K' 'OW').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testEngineering [

	| phonemeOutput inputText  |
	inputText := 'Engineering'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('EH' 'NXG' 'IH' 'N' 'IY4' 'R' 'IH' 'NX').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testFluorescent [

	| phonemeOutput inputText  |
	inputText := 'Fluorescent'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('F' 'L' 'UW' 'AOR' 'EH' 'Z' 'K' 'EH' 'N' 'T').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testGasoline [

	| phonemeOutput inputText  |
	inputText := 'Gasoline'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('G' 'EY4S' 'OW' 'L' 'IH' 'N' 'EH').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testHallucination [ 

	| phonemeOutput inputText  |
	inputText := 'Hallucination'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('/H' 'AOL' '' 'UW' 'K' 'IH' 'N' 'AE' 'SH' 'UN').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testInfluence [

	| phonemeOutput inputText  |
	inputText := 'Influence'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('IHN' 'F' 'L' 'UW' 'EH' 'N' 'K' 'EH').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testJazz [

	| phonemeOutput inputText  |
	inputText := 'Jazz'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('J' 'AE' 'Z' 'Z').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testKnife [

	| phonemeOutput inputText  |
	inputText := 'Knife'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('' 'N' 'IH' 'F' 'EH').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testLeisure [

	| phonemeOutput inputText  |
	inputText := 'Leisure'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('L' 'IY4' 'ZHER' 'EH').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testMusic [

	| phonemeOutput inputText  |
	inputText := 'Music'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('M' 'YUW' 'Z' 'IH' 'K').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testNahuel [

	| phonemeOutput inputText  |
	inputText := 'Nahuel'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('N' 'AE' '/H' 'YUW' 'EH' 'L').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testNeerja [

	| phonemeOutput inputText  |
	inputText := 'Neerja'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('N' 'IY4' 'R' 'J' 'AE').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testNotation [

	| phonemeOutput inputText  |
	inputText := 'Notation'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('N' 'OW' 'T' 'AE' 'SH' 'UN').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testOxygen [

	| phonemeOutput inputText  |
	inputText := 'Oxygen'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('OW' 'KS' 'IH' 'G' 'EH' 'N').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testPhoneme [

	| phonemeOutput inputText  |
	inputText := 'Phoneme'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals:#('F' 'OW' 'N' 'EH' 'M' 'EH')
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testQuestion [

	| phonemeOutput inputText  |
	inputText := 'Question'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('KW' 'EH' 'Z' 'CH' 'UN').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testRhapsody [

	| phonemeOutput inputText  |
	inputText := 'Rhapsody'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('R' '/H' 'EY5' '' 'S' 'OW' 'D' 'IH').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testScissors [ 

	| phonemeOutput inputText  |
	inputText := 'Scissors'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals:#('S' 'K' 'IH' '' 'S' 'AOR' 'Z').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testSunflower [

	| phonemeOutput inputText  |
	inputText := 'Sunflower'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals:#('S' 'AH5' 'N' 'F' 'L' 'OW' 'ER').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testTransportation [

	| phonemeOutput inputText  |
	inputText := 'Transportation'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('T' 'R' 'AE' 'N' 'Z' 'P' 'AOR' 'T' 'AE' 'SH' 'UN').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testUniversal [

	| phonemeOutput inputText  |
	inputText := 'Universal'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('YUWN' 'IH' 'V' 'ER' 'Z' 'AE' 'L').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testVirtue [

	| phonemeOutput inputText  |
	inputText := 'Virtue'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('V' 'ER' 'T' 'UW' 'EH').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testWrong [

	| phonemeOutput inputText  |
	inputText := 'Wrong'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('R' 'OW' 'NX').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testYawning [

	| phonemeOutput inputText  |
	inputText := 'Yawning'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('Y' 'AO5' 'N' 'IH' 'NX').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testZerox [

	| phonemeOutput inputText  |
	inputText := 'Zerox'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals:#('ZIY4' 'EHR' 'OW' 'KS').
	
	
	
]

{ #category : 'tests' }
TextToPhonemeTest >> testZigZag [

	| phonemeOutput inputText  |
	inputText := 'ZigZag'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('ZIY4' 'IH' 'J' 'Z' 'AE' 'G').
	
	
	
]
