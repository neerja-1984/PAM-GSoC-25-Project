Class {
	#name : 'Reciter',
	#superclass : 'Object',
	#instVars : [
		'debugMode'
	],
	#category : 'PAM-Core-Reciter',
	#package : 'PAM-Core',
	#tag : 'Reciter'
}

{ #category : 'class initialization' }
Reciter class >> initialize [
    "Initialize the reciter with default settings"
    "debugMode := false"

]

{ #category : 'control' }
Reciter class >> textToPhonemes: input [
	"Convert input text to phonemes"

	| text output pos charFlags rule |
	text := ' ' , input asUppercase.
	output := ''.
	pos := 1.

	[ pos <= text size ] whileTrue: [
		| currentChar |
		currentChar := text at: pos.

		"Handle period (.) specially"
		currentChar = $. ifTrue: [ "Only process if followed by a number"
			(pos < text size and: [
				 (Flags flagsFor: (text at: pos + 1)) anyMask: 1 ]) ifFalse: [
				output := output , '.'.
				pos := pos + 1.
				ReciterUtility log: 'Skipping period (.)'.
				^ output ] "FLAG_NUMERIC" ].

		"Handle other special characters"
		charFlags := Flags flagsFor: currentChar.

		charFlags = 0 ifTrue: [ "Character not in our tables (e.g., space, punctuation)"
			output := output , ' '.
			pos := pos + 1.
			ReciterUtility log: 'Skipping unknown character: ' , currentChar.
			^ output ].

		"Check if character is alphabetic or quote"
		(charFlags anyMask: 128) ifFalse: [ "FLAG_ALPHA_OR_QUOT"
			output := output , ' '.
			pos := pos + 1.
			ReciterUtility log: 'Skipping non-alphabetic character: ' , currentChar.
			^ output ].

		rule := ReciterUtility findMatchingRule: text at: pos.

		rule
			ifNotNil: [
				| replacement skipCount |
				replacement := rule replacement.
				skipCount := rule pattern size max: 1.

				output := output , replacement.
				pos := pos + skipCount.

				ReciterUtility log: 'Applied rule: ' , rule printString ]
			ifNil: [ "No matching rule, keep character as is"
				output := output , currentChar.
				pos := pos + 1.
				ReciterUtility log: 'No rule for: ' , currentChar asString ] ].

	^ output
]

{ #category : 'as yet unclassified' }
Reciter >> textToPhoneme: aString [ 
	self shouldBeImplemented.
]
