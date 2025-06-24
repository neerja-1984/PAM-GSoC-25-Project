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
ReciterUtility class >> checkPrefix: prefix in: text at: position [
    "Check if the prefix matches before the current position"
    | pos rulePos |
    pos := position.
    rulePos := prefix size.
    
    [rulePos > 0 and: [pos > 0]] whileTrue: [
        | ruleChar textChar |
        ruleChar := prefix at: rulePos.
        textChar := text at: pos.
        
        (self isSpecialCharacter: ruleChar) 
            ifTrue: [ 
                | result |
                result := self matchSpecialCharacter: ruleChar 
                                            in: text 
                                            at: pos
                                            direction: -1.
                result ifNil: [ ^ false ].
                pos := result.
            ]
            ifFalse: [
                (textChar asUppercase = ruleChar asUppercase) ifFalse: [ ^ false ].
                pos := pos - 1.
            ].
        rulePos := rulePos - 1.
    ].
    
    ^ true
]

{ #category : 'debug' }
ReciterUtility class >> checkSuffix: suffix in: text at: position [
    "Check if the suffix matches after the current position"
    | pos rulePos |
    pos := position.
    rulePos := 1.
    
    [rulePos <= suffix size and: [pos <= text size]] whileTrue: [
        | ruleChar textChar |
        ruleChar := suffix at: rulePos.
        textChar := text at: pos ifAbsent: [ $  ].
        
        (self isSpecialCharacter: ruleChar)
            ifTrue: [ 
                | result |
                result := self matchSpecialCharacter: ruleChar 
                                            in: text 
                                            at: pos
                                            direction: 1.
                result ifNil: [ ^ false ].
                pos := result.
            ]
            ifFalse: [
                (textChar asUppercase = ruleChar asUppercase) ifFalse: [ ^ false ].
                pos := pos + 1.
            ].
        rulePos := rulePos + 1.
    ].
    
    ^ rulePos > suffix size
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
ReciterUtility class >> findMatchingRule: text at: position [
    "Find the first matching rule for the text at the given position"
    | char |
    char := (text at: position ifAbsent: [ ^ nil ]) asUppercase.

    ((Flags flagsFor: char) anyMask: 2) ifTrue: [  "FLAG_RULESET2"
        (AlphabetUtility rulesFor: char) do: [ :rule |
            (self matches: rule in: text at: position) ifTrue: [ ^ rule ].
        ].
    ].

    ^ nil
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
    | nextPos currentChar prevChar |
    
    nextPos := position + dir.

    char = $  ifTrue: [  "Space - check non-alphabetic"
        ^ (((Flags flagsFor: (text at: position ifAbsent: [ $  ])) anyMask: 128) not)
            ifTrue: [ nextPos ]
            ifFalse: [ nil ]  "FLAG_ALPHA_OR_QUOT"
    ].

    char = $# ifTrue: [  "Vowel or Y"
        ^ ((Flags flagsFor: (text at: position ifAbsent: [ $  ])) anyMask: 64)
            ifTrue: [ nextPos ]
            ifFalse: [ nil ]  "FLAG_VOWEL_OR_Y"
    ].

    char = $. ifTrue: [  "Special flag"
        ^ ((Flags flagsFor: (text at: position ifAbsent: [ $  ])) anyMask: 8)
            ifTrue: [ nextPos ]
            ifFalse: [ nil ]  "FLAG_0X08"
    ].

    char = $& ifTrue: [  "Diphthong or digraph"
        ^ (((Flags flagsFor: (text at: position ifAbsent: [ $  ])) anyMask: 16)
            or: [
                position > 1 and: [
                    prevChar := text at: position - 1 ifAbsent: [ $  ].
                    {prevChar asString, (text at: position) asString}
                        includesAnyOf: #('HC' 'HS')
                ]
            ])
            ifTrue: [ nextPos ]
            ifFalse: [ nil ]  "FLAG_DIPHTHONG or HC/HS"
    ].

    char = $@ ifTrue: [  "Voiced, not H"
        currentChar := text at: position ifAbsent: [ $  ].
        ^ (((Flags flagsFor: currentChar) anyMask: 4)
            and: [ currentChar ~= $H ])
            ifTrue: [ nextPos ]
            ifFalse: [ nil ]  "FLAG_VOICED"
    ].

    char = $^ ifTrue: [  "Consonant"
        ^ ((Flags flagsFor: (text at: position ifAbsent: [ $  ])) anyMask: 32)
            ifTrue: [ nextPos ]
            ifFalse: [ nil ]  "FLAG_CONSONANT"
    ].

    char = $+ ifTrue: [  "Voiced"
        ^ ((Flags flagsFor: (text at: position ifAbsent: [ $  ])) anyMask: 4)
            ifTrue: [ nextPos ]
            ifFalse: [ nil ]  "FLAG_VOICED"
    ].

    char = $: ifTrue: [  "Vowel but not Y"
        currentChar := text at: position ifAbsent: [ $  ].
        ^ (((Flags flagsFor: currentChar) anyMask: 64) and: [ currentChar ~= $Y ])
            ifTrue: [ nextPos ]
            ifFalse: [ nil ]  "FLAG_VOWEL_OR_Y excluding Y"
    ].

    char = $' ifTrue: [  "Apostrophe"
        ^ ((text at: position ifAbsent: [ $  ]) = $')
            ifTrue: [ nextPos ]
            ifFalse: [ nil ]
    ].

    ^ nextPos  "Default: move to next/previous position"

]

{ #category : 'debug' }
ReciterUtility class >> matches: rule in: text at: position [
    "Check if the rule matches at the given position"
    | pattern matchStart matchEnd |
    pattern := rule pattern.
    
    "Check prefix"
    (self checkPrefix: rule prefix in: text at: position - 1) ifFalse: [ ^ false ].
    
    "Check main pattern"
    matchStart := position.
    matchEnd := position + pattern size - 1.
    (matchEnd > text size) ifTrue: [ ^ false ].
    
    (text copyFrom: matchStart to: matchEnd) = pattern ifFalse: [ ^ false ].
    
    "Check suffix"
    ^ self checkSuffix: rule suffix in: text at: matchEnd + 1
]
