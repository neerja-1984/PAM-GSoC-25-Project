Class {
	#name : 'ReciterUtility',
	#superclass : 'Object',
	#classInstVars : [
		'debugMode'
	],
	#category : 'PAM-Core-Reciter',
	#package : 'PAM-Core',
	#tag : 'Reciter'
}

{ #category : 'debug' }
ReciterUtility class >> anyMask: aMask [
    "Return true if any bit in the mask is also set in the receiver"
    ^ (self bitAnd: aMask) ~= 0
]

{ #category : 'debug' }
ReciterUtility class >> disableDebug [
    "Disable debug logging"
    debugMode := false
]

{ #category : 'debug' }
ReciterUtility class >> enableDebug [
    "Enable debug logging"
    debugMode := true
]

{ #category : 'debug' }
ReciterUtility class >> isSpecialCharacter: char [
    "Check if the character is a special pattern character"
    ^ #($  $# $. $& $@ $^ $+ $: $') includes: char
]

{ #category : 'debug' }
ReciterUtility class >> isSpecialCharacter: char at: position in: text [
	"Check if the character should be treated specially"

	| flags |
	flags := Flags flagsFor: char.
	"Check if character is not alphabetic or quote"
	(flags anyMask: Flags flagAlphaOrBackTick ) ifFalse: [ ^ true ].
	
	"check if . is full stop or decimal"
	(char = $. and: [
		 position + 1 > text size or: 
		[ 
			 ((Flags flagsFor: (text at: position + 1)) anyMask: Flags flagNumeric ) not 
		] 
		]) ifTrue: [ ^ true ].

	^ false
]

{ #category : 'debug' }
ReciterUtility class >> log: message [
    debugMode ifTrue: [ 
        Transcript 
            show: '[SAMReciter] ' ;
			   show: message; 
            cr 
    ]
]

{ #category : 'debug' }
ReciterUtility class >> matchSpecialCharacter: char in: text at: position direction: dir [
    "Handle special pattern characters"
    | nextPos flags |
    nextPos := position + dir.
    
    char = $  ifTrue: [  "Space - check non-alphabetic"
        ^ ((AlphabetUtility flagsFor: (text at: position ifAbsent: [ $  ])) 
            anyMask: 128) not  "FLAG_ALPHA_OR_QUOT"
                ifTrue: [ nextPos ]
                ifFalse: [ nil ]
        ].
    
    char = $# ifTrue: [  "Vowel or Y"
        ^ ((AlphabetUtility flagsFor: (text at: position ifAbsent: [ $  ])) 
            anyMask: 64)  "FLAG_VOWEL_OR_Y"
                ifTrue: [ nextPos ]
                ifFalse: [ nil ]
        ].
    
    char = $. ifTrue: [  "Special flag"
        ^ ((AlphabetUtility flagsFor: (text at: position ifAbsent: [ $  ])) 
            anyMask: 8)  "FLAG_0X08"
                ifTrue: [ nextPos ]
                ifFalse: [ nil ]
        ].
    
    char = $& ifTrue: [  "Diphthong or digraph"
        ^ ((AlphabetUtility flagsFor: (text at: position ifAbsent: [ $  ])) 
                anyMask: 16)  "FLAG_DIPHTHONG"
            or: [
                position > 1 and: [
                    | prevChar |
                    prevChar := text at: position - 1 ifAbsent: [ $  ].
                    {prevChar asString, (text at: position) asString} 
                        includesAnyOf: #('HC' 'HS')
                ]
            ]
                ifTrue: [ nextPos ]
                ifFalse: [ nil ]
        ].
    
    char = $@ ifTrue: [  "Voiced, not H"
        | currentChar |
        currentChar := text at: position ifAbsent: [ $  ].
        ^ (((AlphabetUtility flagsFor: currentChar) anyMask: 4)  "FLAG_VOICED"
            and: [ currentChar ~= $H ])
                ifTrue: [ nextPos ]
                ifFalse: [ nil ]
        ].
    
    char = $^ ifTrue: [  "Consonant"
        ^ ((AlphabetUtility flagsFor: (text at: position ifAbsent: [ $  ])) 
            anyMask: 32)  "FLAG_CONSONANT"
                ifTrue: [ nextPos ]
                ifFalse: [ nil ]
        ].
    
    char = $+ ifTrue: [  "Voiced"
        ^ ((AlphabetUtility flagsFor: (text at: position ifAbsent: [ $  ])) 
            anyMask: 4)  "FLAG_VOICED"
                ifTrue: [ nextPos ]
                ifFalse: [ nil ]
        ].
    
    char = $: ifTrue: [  "Vowel"
        | currentChar |
        currentChar := text at: position ifAbsent: [ $  ].
        ^ ((AlphabetUtility flagsFor: currentChar) anyMask: 64)  "FLAG_VOWEL_OR_Y"
            and: [ currentChar ~= $Y ]
                ifTrue: [ nextPos ]
                ifFalse: [ nil ]
        ].
    
    char = $' ifTrue: [  "Apostrophe"
        ^ (text at: position ifAbsent: [ $  ]) = $'
            ifTrue: [ nextPos ]
            ifFalse: [ nil ]
        ].
    
    ^ nextPos  "Default: move to next/previous position"
]
