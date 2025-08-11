Class {
	#name : 'TextToIPAPhonemeTest',
	#superclass : 'TestCase',
	#instVars : [
		'reciter'
	],
	#category : 'PAM-Core-Tests-Reciter',
	#package : 'PAM-Core-Tests',
	#tag : 'Reciter'
}

{ #category : 'tests' }
TextToIPAPhonemeTest >> testAnticipate [

	| phonemeOutput inputText  |
	inputText := 'Anticipate'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('eɪ' 'n' 't' 'ɪ' 'k' 'ɪ' 'p' 'æ' 't' 'e').
]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testBibliography [ 

	| phonemeOutput inputText  |
	inputText := 'Bibliography'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('b' 'ɪ' 'b' 'l' 'ɪ' 'əʊ' 'dʒ' 'r' 'æ' 'f' 'ɪ').
]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testChamomile [

	| phonemeOutput inputText  |
	inputText := 'Chamomile'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals:#('ʈʃ' 'æ' 'm' 'əʊ' 'm' 'ɪ' 'l' 'e').
]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testDictionary [ 

	| phonemeOutput inputText  |
	inputText := 'Dictionary'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('d' 'i_colon' 'ɪ' 's' 'ʃ' 'ʌ' 'n' 'e' 'r' 'ɪ').
]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testDomenico [

	| phonemeOutput inputText  |
	inputText := 'Domenico'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('d' 'u_colon' 'm' 'e' 'n' 'ɪ' 'k' 'əʊ').
]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testEngineering [

	| phonemeOutput inputText  |
	inputText := 'Engineering'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('e' 'n' 'g' 'g' 'ɪ' 'n' 'i_colon' 'r' 'ɪ' 'n' 'g').
]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testFluorescent [ 

	| phonemeOutput inputText  |
	inputText := 'Fluorescent'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('f' 'l' 'u_colon' 'ɔ_colon' 'r' 'e' 'z' 'k' 'e' 'n' 't').

]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testGasoline [

	| phonemeOutput inputText  |
	inputText := 'Gasoline'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('g' 'eɪ' 's' 'əʊ' 'l' 'ɪ' 'n' 'e').
]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testHallucination [

	| phonemeOutput inputText  |
	inputText := 'Hallucination'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('h' 'ɔ_colon' 'l' '' 'u_colon' 'k' 'ɪ' 'n' 'æ' 'ʃ' 'ʌ' 'n').

]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testInfluence [ 

	| phonemeOutput inputText  |
	inputText := 'Influence'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('ɪ' 'n' 'f' 'l' 'u_colon' 'e' 'n' 'k' 'e').

]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testJazz [

	| phonemeOutput inputText  |
	inputText := 'Jazz'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals:#('dʒ' 'æ' 'z' 'z').
]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testKnife [

	| phonemeOutput inputText  |
	inputText := 'Knife'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('' 'n' 'ɪ' 'f' 'e')
]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testLeisure [

	| phonemeOutput inputText  |
	inputText := 'Leisure'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('l' 'i_colon' 'ʒ' 'ɜ_colon' 'e').
]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testMusic [

	| phonemeOutput inputText  |
	inputText := 'Music'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('m' 'j' 'u_colon' 'z' 'ɪ' 'k').
]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testNahuel [

	| phonemeOutput inputText  |
	inputText := 'Nahuel'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('n' 'æ' 'h' 'j' 'u_colon' 'e' 'l').
]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testNeerja [

	| phonemeOutput inputText  |
	inputText := 'Neerja'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('n' 'i_colon' 'r' 'dʒ' 'æ')
]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testNotation [

	| phonemeOutput inputText  |
	inputText := 'Notation'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('n' 'əʊ' 't' 'æ' 'ʃ' 'ʌ' 'n')
]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testOxygen [

	| phonemeOutput inputText  |
	inputText := 'Oxygen'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals:#('əʊ' 'k' 's' 'ɪ' 'g' 'e' 'n')
]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testPhoneme [

	| phonemeOutput inputText  |
	inputText := 'Phoneme'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('f' 'əʊ' 'n' 'e' 'm' 'e').
]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testQuestion [

	| phonemeOutput inputText  |
	inputText := 'Question'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('k' 'w' 'e' 'z' 'ʈʃ' 'ʌ' 'n')
]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testRhapsody [

	| phonemeOutput inputText  |
	inputText := 'Rhapsody'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('r' 'h' 'eɪ' '' 's' 'əʊ' 'd' 'ɪ')
]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testScissors [

	| phonemeOutput inputText  |
	inputText := 'Scissors'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals:#('s' 'k' 'ɪ' '' 's' 'ɔ_colon' 'r' 'z')
]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testSunflower [

	| phonemeOutput inputText  |
	inputText := 'Sunflower'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('s' 'ʌ' 'n' 'f' 'l' 'əʊ' 'ɜ_colon').
]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testTransportation [

	| phonemeOutput inputText  |
	inputText := 'Transportation'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('t' 'r' 'æ' 'n' 'z' 'p' 'ɔ_colon' 'r' 't' 'æ' 'ʃ' 'ʌ' 'n').
]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testUniversal [

	| phonemeOutput inputText  |
	inputText := 'Universal'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('j' 'u_colon' 'n' 'ɪ' 'v' 'ɜ_colon' 'z' 'æ' 'l')
]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testVirtue [ 
	| phonemeOutput inputText  |
	inputText := 'Virtue'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('v' 'ɜ_colon' 't' 'u_colon' 'e')
]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testWrong [

	| phonemeOutput inputText  |
	inputText := 'Wrong'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('r' 'əʊ' 'n' 'g').

]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testYawning [

	| phonemeOutput inputText  |
	inputText := 'Yawning'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('j' 'ɔ_colon' 'n' 'ɪ' 'n' 'g')

]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testZerox [

	| phonemeOutput inputText  |
	inputText := 'Zerox'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals:#('z' 'i_colon' 'e' 'r' 'əʊ' 'k' 's').
]

{ #category : 'tests' }
TextToIPAPhonemeTest >> testZigZag [

	| phonemeOutput inputText  |
	inputText := 'ZigZag'.
	
	phonemeOutput := Reciter textToIPAPhonemes: inputText.
	
	self assert: phonemeOutput equals: #('z' 'i_colon' 'ɪ' 'dʒ' 'z' 'æ' 'g')

]
