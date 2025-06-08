"
""This class has method : (mapEnglishVocabularyWithFlags) which assigns all characters of english a unique combination of ReciterFlags"" 
"
Class {
	#name : 'ReciterTable',
	#superclass : 'Object',
	#category : 'PAM-Core-Reciter',
	#package : 'PAM-Core',
	#tag : 'Reciter'
}

{ #category : 'bit manipulation' }
ReciterTable class >> mapEnglishVocabularyWithFlags [
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
    charFlags at: $' put: (128 | 2).
    
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
