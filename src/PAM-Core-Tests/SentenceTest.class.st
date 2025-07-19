Class {
	#name : 'SentenceTest',
	#superclass : 'TestCase',
	#category : 'PAM-Core-Tests-Reciter',
	#package : 'PAM-Core-Tests',
	#tag : 'Reciter'
}

{ #category : 'tests' }
SentenceTest >> testGoogleSummerOfCode [
	"Need to do add changes in Rules -> to consider space as well in between words !"	

	| phonemeOutput inputText  |
	
	inputText := 'Google Summer Of Code'.
	
	phonemeOutput := Reciter textToPhonemes: inputText.
	
	self assert: phonemeOutput equals: 'GUW5GLEH  SAH5MMER  AHV  KOWDEH'.
]
