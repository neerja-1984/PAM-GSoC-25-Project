"
""Lists all Constant Flags for Reciter""
"
Class {
	#name : 'Flags',
	#superclass : 'Object',
	#category : 'PAM-Core-Reciter',
	#package : 'PAM-Core',
	#tag : 'Reciter'
}

{ #category : 'constants' }
Flags class >> flagAlphaOrBackTick [
    "Defines all 26 alphabets and back tick : A B C D E F G H I J K L M N O P Q R S T U V W X Y Z `"
    ^ 128
]

{ #category : 'constants' }
Flags class >> flagConsonant [
    "Defines all Consonants and back tick ` : B C D F G H J K L M N P Q R S T V W X Y Z + ` "
    ^ 32
]

{ #category : 'constants' }
Flags class >> flagFricatives [
    "Defines Fricatives : C G J S X Z"
    ^ 16
]

{ #category : 'constants' }
Flags class >> flagNumeric [
    "Defines only numbers : 0 1 2 3 4 5 6 7 8 9"
    ^ 1
]

{ #category : 'constants' }
Flags class >> flagReasonUnknown [
    "Defines some special consonants : B D G J L M N R V W Z"
    ^ 8
]

{ #category : 'constants' }
Flags class >> flagRuleset2 [
    "Defines numbers of flagNumeric and Punctuations : ! . , ; : ? @ ^ # $ % & * - / + ' < > =  "
    ^ 2
]

{ #category : 'constants' }
Flags class >> flagVoiced [
    "Defines all voiced consonants : D J L N R S T Z"
    ^ 4
]

{ #category : 'constants' }
Flags class >> flagVowelOrY [
    "Defines Vowels and Y : A E I O U Y "
    ^ 64
]

{ #category : 'mapping' }
Flags class >> flagsFor: aCharacter [
	"Return the flags for the given character.If character is not found, return 0."
	| allCharFlag|
	allCharFlag := self mappingCharactersToFlag.
   ^ allCharFlag at: aCharacter asUppercase ifAbsent: [ 0 ]
]

{ #category : 'mapping' }
Flags class >> mappingCharactersToFlag [
	|charFlags|
	 charFlags := Dictionary new.
	
	"Characters with Flag Value = 0"
    charFlags at: Character space put: 0.
    charFlags at: $( put: 0.
    charFlags at: $) put: 0.
	 charFlags at: $[ put: 0.
	 charFlags at: $] put: 0.
	 charFlags at: $_ put: 0.
	 charFlags at: $\ put: 0.
    
    "Punctuation with flagRuleset2 ( value = 2 )"
    #($! $" $# $$ $% $& $* $+ $, $- $. $/ $: $; $< $= $> $? $@ $^) do: 
			[ :char | charFlags at: char put: 2 ].

    "Numbers with flagNumeric ( value = 1 ) and flagRuleset2 ( value = 2 )"
    ($0 to: $9) do: 
			[ :digit | charFlags at: digit put: (1|2) ].
    
    "BackTick with flagAlphaOrBackTick ( value = 128 ) and flagRuleset2 ( value = 2 )"
    charFlags at: $` put: (128 | 2).
    
    "A, E, I, O, U, Y with flagVowelOrY ( value = 64 ) and flagAlphaOrBackTick ( value = 128 )"
    #($A $E $I $O $U $Y) do: 
			[ :vowel |charFlags at: vowel put: (128 | 64) ].
    
    "Consonants with flagAlphaOrBackTick ( value = 128 ) and flagConsonant ( value = 32 )"
    ($B to: $Z) do: 
			[ :cons | (charFlags includesKey: cons) ifFalse: [charFlags at: cons put: (128 | 32) ] ].
    
    "Special cases for consonants with additional flags"
    
    "D, J, L, N, R, S, T, Z - adding flagVoiced ( value = 4 )"
    #($D $J $L $N $R $S $T $Z) do: 
			[ :char | charFlags at: char put: ((charFlags at: char) | 4) ].
    
    "B, D, G, J, L, M, N, R, V, W, Z - add flagReasonUnknown ( value = 8 )"
    #($B $D $G $J $L $M $N $R $V $W $Z) do: 
			[ :char | charFlags at: char put: ((charFlags at: char) | 8) ].
    
    "C, G, J, S, X, Z - add flagFricative ( value = 16 )"
    #($C $G $J $S $X $Z) do: 
			[ :char | charFlags at: char put: ((charFlags at: char) | 16) ].
		
	^ charFlags.
]
