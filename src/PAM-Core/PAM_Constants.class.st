"
""Lists all Constant Flags for Reciter""
"
Class {
	#name : 'PAM_Constants',
	#superclass : 'Object',
	#category : 'PAM-Core',
	#package : 'PAM-Core'
}

{ #category : 'Flags for Constant purpose' }
PAM_Constants class >> flagAlphaOrBackTick [
    "Defines all 26 alphabets and back tick : A B C D E F G H I J K L M N O P Q R S T U V W X Y Z `"
    ^ 128
]

{ #category : 'Flags for Constant purpose' }
PAM_Constants class >> flagConsonant [
    "Defines all Consonants and back tick ` : B C D F G H J K L M N P Q R S T V W X Y Z + ` "
    ^ 32
]

{ #category : 'Flags for Constant purpose' }
PAM_Constants class >> flagFricatives [
    "Defines Fricatives : C G J S X Z"
    ^ 16
]

{ #category : 'Flags for Constant purpose' }
PAM_Constants class >> flagNumeric [
    "Defines only numbers : 0 1 2 3 4 5 6 7 8 9"
    ^ 1
]

{ #category : 'Flags for Constant purpose' }
PAM_Constants class >> flagReasonUnknown [
    "Defines some special consonants : B D G J L M N R V W Z"
    ^ 8
]

{ #category : 'Flags for Constant purpose' }
PAM_Constants class >> flagRuleset2 [
    "Defines numbers of flagNumeric and Punctuations : ! . , ; : ? @ ^ # $ % & * - / + ' < > =  "
    ^ 2
]

{ #category : 'Flags for Constant purpose' }
PAM_Constants class >> flagVoiced [
    "Defines all voiced consonants : D J L N R S T Z"
    ^ 4
]

{ #category : 'Flags for Constant purpose' }
PAM_Constants class >> flagVowelOrY [
    "Defines Vowels and Y : A E I O U Y "
    ^ 64
]
