"
Reciter is the core class responsible for converting input text to phonemes using rule-based matching.

Responsibilities:
- Traverses the input character by character
- Applies context-sensitive rules based on prefix, pattern, and suffix
- Filters out unknown or irrelevant characters
- Produces a phoneme sequence as output

Main Methods:

1. checkPrefix:in:at:
   Checks whether the prefix portion of a rule matches before the current position in the text.
   Example:
     (Reciter checkPrefix: 'ST' in: 'STRING' at: 3) → true
     (prefix 'ST' matches text before 'R' in 'STRING')

2. checkSuffix:in:at:
   Checks whether the suffix portion of a rule matches after the current position.
   Example:
     (Reciter checkSuffix: 'NG' in: 'SING' at: 3) → true
     (suffix 'NG' matches text after 'I')

3. textToPhonemes:
   The main driver method. Converts input text into its phoneme representation.
   - Skips punctuation and unsupported characters -> this will change in later version of code , where we can consider punctuation rules as well
   - Looks for best matching rule at each position
   - Applies replacement from matched rule
   - Outputs the phoneme string
   Example:
     (Reciter textToPhonemes: 'SING') → 'SIH4NG'

Design Notes:
- Uses `ReciterUtility>>#log:` for logging and rule matching
- Character classification is handled via Flags

"
Class {
	#name : 'Reciter',
	#superclass : 'Object',
	#category : 'PAM-Core-Reciter',
	#package : 'PAM-Core',
	#tag : 'Reciter'
}

{ #category : 'execution' }
Reciter class >> checkPrefix: prefix in: text at: position [
    "Check if the prefix matches before the current position"
    | pos rulePos |
    pos := position.
    rulePos := prefix size.
    
    [rulePos > 0 and: [pos > 0]] whileTrue: [
        | ruleChar textChar |
        ruleChar := prefix at: rulePos.
        textChar := text at: pos.
        
        (ReciterUtility isSpecialCharacter: ruleChar) 
            ifTrue: [ 
                | result |
                result := ReciterUtility matchSpecialCharacter: ruleChar 
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

{ #category : 'execution' }
Reciter class >> checkSuffix: suffix in: text at: position [
    "Check if the suffix matches after the current position"
    | pos rulePos |
    pos := position.
    rulePos := 1.
    
    [rulePos <= suffix size and: [pos <= text size]] whileTrue: [
        | ruleChar textChar |
        ruleChar := suffix at: rulePos.
        textChar := text at: pos ifAbsent: [ $  ].
        
        (ReciterUtility isSpecialCharacter: ruleChar)
            ifTrue: [ 
                | result |
                result := ReciterUtility matchSpecialCharacter: ruleChar 
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

{ #category : 'execution' }
Reciter class >> textToPhonemes: input [
    "Convert input text to phonemes"
    | text output pos charFlags rule currentChar |
    text := '   ',input asUppercase. "Pad with space to justify start of a word"
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

    "Remove leading and trailing spaces"
    output := output trimBoth.

    ^ output
]
