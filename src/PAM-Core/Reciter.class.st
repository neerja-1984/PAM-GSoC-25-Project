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
    | text output pos charFlags rule currentChar |
    text := '  ',input asUppercase. "Pad with space to justify start of a word"
    output := ''.
    pos := 1.

    [ pos <= text size ] whileTrue: [
        currentChar := text at: pos.

        "1. Handle period only if followed by number"
        (currentChar = $. and: [
            pos < text size and: [
                ((text at: pos + 1 ifAbsent: [ $ ]) isDigit) not
            ]
        ]) ifTrue: [
            output := output , '.'.
            pos := pos + 1.
            ReciterUtility log: 'Skipping period (.)'.
        ].

        "2. Get char flags"
        charFlags := Flags flagsFor: currentChar.

        "3. Skip unknown characters (no flags)"
        (charFlags = 0) ifTrue: [
            output := output , ' '.
            ReciterUtility log: 'Skipping unknown character: ' , currentChar asString.
            pos := pos + 1.
        ].

        "4. Handle non-alphabetic characters (except quotes)"
        ((charFlags anyMask: 128) not and: [ currentChar ~= $' ]) ifTrue: [
            output := output , ' '.
            ReciterUtility log: 'Skipping non-alphabetic character: ' , currentChar asString.
            pos := pos + 1.
        ].

        "5. Apply matching rule if found"
        rule := ReciterUtility findMatchingRuleIn: text at: pos.

        rule
            ifNotNil: [
                | replacement skipCount |
                replacement := rule replacement.
                skipCount := rule pattern size max: 1.

                output := output , replacement.
                pos := pos + skipCount.

                ReciterUtility log: 'Applied rule: ' , rule printString.
            ]
            ifNil: [
                output := output , currentChar asString.
                pos := pos + 1.
                ReciterUtility log: 'No rule for: ' , currentChar asString.
            ].
    ].

    ^ output
]

{ #category : 'as yet unclassified' }
Reciter >> textToPhoneme: aString [ 
	self shouldBeImplemented.
]
