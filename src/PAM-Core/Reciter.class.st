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
    | text output pos |
    
    text := ' ', input asUppercase.
    output := ''.
    pos := 1.
    
    [pos <= text size] whileTrue: [
        | char rule |
        char := text at: pos.
        
        "Skip processing if it's not a letter we handle"
        (ReciterUtility isSpecialCharacter: char at: pos in: text) ifTrue: [
            output := output, ' '.
            pos := pos + 1.
            ReciterUtility log: 'Skipping special character: ' , char.
            ^ output
        ].
        
        rule := ReciterUtility findMatchingRule: text at: pos.
        
        rule ifNotNil: [
            | replacement skipCount |
            replacement := rule replacement.
            skipCount := (rule pattern size) max: 1.
            
            output := output, replacement.
            pos := pos + skipCount.
            
            ReciterUtility log: 'Applied rule: ' , rule pattern , ' -> ' , replacement.
        ] ifNil: [ 
            output := output, (text at: pos).
            pos := pos + 1.
            ReciterUtility log: 'No rule for: ' , (text at: pos) asString.
        ].
    ].
    
    ^ output
]

{ #category : 'as yet unclassified' }
Reciter >> textToPhoneme: aString [ 
	self shouldBeImplemented.
]
