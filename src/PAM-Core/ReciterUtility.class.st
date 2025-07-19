"
ReciterUtility provides core phoneme matching logic and helper utilities for `textTophonemes` conversion.

Key responsibilities:
- Rule matching (`findMatchingRuleIn:at:`)
- Pattern interpretation (`matches:in:at:` and `matchSpecialCharacter:in:at:direction:`)
- Logging and debug support (`log:`)
- Special character recognition (`isSpecialCharacter:`)

- Examples:

1. Find the best matching rule for a character at a given position:
   ReciterUtility findMatchingRuleIn: 'SING' at: 2
   → Returns a dictionary of `RulePOJO` rules matching 'I' in 'SING'

2. Check if a rule matches text contextually:
   ReciterUtility matches: rule in: 'STRING' at: 3
   → Returns true if prefix, pattern, and suffix match via `Reciter>>#checkSuffix:  in:  at:` and `Reciter>>#checkPrefix:  in:  at:`

3. Interpret special characters in rule patterns:
   ReciterUtility matchSpecialCharacter: $# in: 'AGE' at: 2 direction: 1
   → Returns next position if 'G' is a vowel or 'Y'

4. Debugging:
   ReciterUtility log: 'Matched prefix: STR'
   → Prints: [ReciterUtility >> #someMethod] Matched prefix: STR

Pattern logic handled in `matchSpecialCharacter: in: at:`

- Meaning of the special characters : 
  1. ' ' (space): non-alphabet
  2. '#' : vowel or Y
  3. '&' : diphthong/digraph
  4. ':' : vowel excluding Y
  5. '@', '^', '+', '.' : voiced/consonant flags


"
Class {
	#name : 'ReciterUtility',
	#superclass : 'Object',
	#classVars : [
		'debugger'
	],
	#category : 'PAM-Core-Reciter',
	#package : 'PAM-Core',
	#tag : 'Reciter'
}

{ #category : 'execution' }
ReciterUtility class >> findMatchingRuleIn: text at: position [
    "Find the best matching rule for the text at the given position.
     Returns the matching rule with the longest pattern or nil if no rule matches."
    | char rules matchingRules |

    char := (text at: position ifAbsent: [ ^ nil ]) asUppercase.
    rules := AlphabetUtility rulesFor: char.
    
    "Find all matching rules"
    matchingRules := rules select: [ :rule |
        self matches: rule in: text at: position
    ].
    
    "Return nil if no rules match"
    matchingRules isEmpty ifTrue: [ ^ nil ].

    "Find the rule with the longest pattern: which will represent the correct rule which is to be mapped"
    ^ matchingRules inject: matchingRules first into: [ :longest :rule |
        rule pattern size > longest pattern size ifTrue: [ rule ] ifFalse: [ longest ]
    ]
]

{ #category : 'class initialization' }
ReciterUtility class >> initialize [
	debugger:= true.
]

{ #category : 'mapping' }
ReciterUtility class >> isSpecialCharacter: char [
    "Check if the character is a special pattern character while doing a prefix / suffix check"
    ^ #($  $# $. $& $@ $^ $+ $: $') includes: char
]

{ #category : 'debug' }
ReciterUtility class >> log: message [

    | senderContext className methodName |
    
    "Get the sender context (the method that called log:)"
    senderContext := thisContext sender.
    className := senderContext method methodClass name.
    methodName := senderContext selector.
    
    Transcript
        nextPutAll: '[';
        nextPutAll: className;
        nextPutAll: ' >> #';
        nextPutAll: methodName asString;
        nextPutAll: '] ';
        nextPutAll: message;
        cr.
    Transcript flush
]

{ #category : 'execution' }
ReciterUtility class >> matchSpecialCharacter: char in: text at: position direction: dir [
    "Handle special pattern characters"
    | nextPos currentChar prevChar |
    
    nextPos := position + dir.

	"if ruleChar is a space .. is the textChar a non alphabetic"
    char = $  ifTrue: [  
        ^ (((Flags flagsFor: (text at: position ifAbsent: [ $  ])) anyMask: 128) not)
            ifTrue: [ nextPos ]
            ifFalse: [ nil ]  
    ].


	"if ruleChar is a # .. is the textChar a VowelOrY"
    char = $# ifTrue: [
        ^ ((Flags flagsFor: (text at: position ifAbsent: [ $  ])) anyMask: 64)
            ifTrue: [ nextPos ]
            ifFalse: [ nil ] 
    ].

	"placeholder rule"
    char = $. ifTrue: [ 
        ^ ((Flags flagsFor: (text at: position ifAbsent: [ $  ])) anyMask: 8)
            ifTrue: [ nextPos ]
            ifFalse: [ nil ] 
    ].

	"if ruleChar is a & .. is the textChar a fricative. If there is H .. check if it includes HC / HS"
	char = $& ifTrue: [
 	 	^ (((Flags flagsFor: (text at: position ifAbsent: [ $  ])) anyMask: 16)
  		  	or: [
    	  		position > 1 and: 
			[
     		   	prevChar := text at: position - 1 ifAbsent: [ $  ].
      		  #('HC' 'HS') includes: (prevChar asString , (text at: position) asString)
    	   ]
   	 	])
  	  ifTrue: [ nextPos ]
 	   ifFalse: [ nil ]
	].

	"if ruleChar is a @ .. is the textChar a Voiced but not having H"
    char = $@ ifTrue: [  
        currentChar := text at: position ifAbsent: [ $  ].
        ^ (((Flags flagsFor: currentChar) anyMask: 4)
            and: [ currentChar ~= $H ])
            ifTrue: [ nextPos ]
            ifFalse: [ nil ]
    ].

	"if ruleChar is a ^ .. is the textChar a consonant"
    char = $^ ifTrue: [ 
        ^ ((Flags flagsFor: (text at: position ifAbsent: [ $  ])) anyMask: 32)
            ifTrue: [ nextPos ]
            ifFalse: [ nil ] 
    ].

	"if ruleChar is a + .. is the textChar a voiced"
    char = $+ ifTrue: [  "Voiced"
        ^ ((Flags flagsFor: (text at: position ifAbsent: [ $  ])) anyMask: 4)
            ifTrue: [ nextPos ]
            ifFalse: [ nil ]  "FLAG_VOICED"
    ].

	"if ruleChar is a : .. is the textChar a Vowel excluding Y"
    char = $: ifTrue: [ 
        currentChar := text at: position ifAbsent: [ $  ].
        ^ (((Flags flagsFor: currentChar) anyMask: 64) and: [ currentChar ~= $Y ])
            ifTrue: [ nextPos ]
            ifFalse: [ nil ] 
    ].

	"if ruleChar is a ' .. is the textChar '"
    char = $' ifTrue: [
        ^ ((text at: position ifAbsent: [ $  ]) = $')
            ifTrue: [ nextPos ]
            ifFalse: [ nil ]
    ].

	"Of either rule matches in rule and text -- return next/previous position"
	"else return nill"
    ^ nextPos

]

{ #category : 'execution' }
ReciterUtility class >> matches: rule in: text at: position [
    "Check if the rule matches at the given position"
    | pattern matchStart matchEnd prefix suffix|
    pattern := rule pattern.
    prefix := rule prefix.
    suffix := rule suffix.
    
    "Check prefix"
    (Reciter checkPrefix: prefix in: text at: position - 1) ifFalse: [ ^ false ].
    
    "Check main pattern"
    matchStart := position.
    matchEnd := position + pattern size - 1.
    (matchEnd > text size) ifTrue: [ ^ false ].
    
    (text copyFrom: matchStart to: matchEnd) = pattern ifFalse: [ ^ false ].
    
    "Check suffix"
    ^ Reciter checkSuffix: suffix in: text at: matchEnd + 1
    
]
