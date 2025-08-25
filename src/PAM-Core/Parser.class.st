"
## Overview
`Parser` provides helpers for adding **prosody** (stress, loudness, duration) to phoneme sequences.  
It translates numeric stress tokens into amplitude/duration values, and pairs IPA phonemes with stress levels.

---

## Usage

### Amplitude for stress
Stress => [4..6] → amplitude => [0.5..1.0].

```language=Pharo
Parser amplitudeForStress: 4.   ""0.5 (soft)""
Parser amplitudeForStress: 5.   ""0.75""
Parser amplitudeForStress: 6.   ""1.0 (strong)""
```

### Duration for stress
```language=Pharo
""Stress => [4..6] → duration => [0.1..0.4] seconds.""
Parser durationForStress: 4.   ""0.1 (short/fast)""
Parser durationForStress: 5.   ""0.25""
Parser durationForStress: 6.   ""0.4 (long/slow)""
```

### Pair IPA phonemes with stress
```language=Pharo
""Matches phonemes with corresponding stress tokens.
Pads missing stress values with default (=5).""

""paste below in playground to understand""
| ipa stress pairs |
ipa := #('n' 'i_colon' 'r' 'dʒ' 'æ').
stress := #('N' 'IY4' 'R' 'J' 'AE').
pairs := Parser pairIPAPhoneme: ipa withStress: stress.

""returns => #(#('n' 5) #('i_colon' 4) #('r' 5) #('dʒ' 5) #('æ' 5))""
```
"
Class {
	#name : 'Parser',
	#superclass : 'Object',
	#category : 'PAM-Core-Parser',
	#package : 'PAM-Core',
	#tag : 'Parser'
}

{ #category : 'helper methods' }
Parser class >> amplitudeForStress: stress [
    "Map stress in range [4..6] with amplitude in range [0.5..1.0].

  		----- INDEX ----   
	  4 = soft (0.5), 6 = strong (1.0)."
    ^ 0.5 + (((stress - 4) / 2.0) * 0.5)
]

{ #category : 'helper methods' }
Parser class >> durationForStress: stress [
    "Map stress in range [4..6] with duration in range [0.1..0.4].

		----- INDEX ----   
     4 = short/fast (0.1s), 6 = long/slow (0.4s)."
    ^ 0.1 + (((stress - 4) / 2.0) * 0.3)
]

{ #category : 'mapping' }
Parser class >> pairIPAPhoneme: ipaText withStress: stressTokens [
	"Pair each IPA phoneme with its numeric stress value.
	
	--- Example ---
	stressToken :  #('N' 'IY4' 'R' 'J' 'AE')
	ipaText : #('n' 'i_colon' 'r' 'dʒ' 'æ')
	[ ipatext. stress ] : [ 'n.5' 'i_colon.4' 'r.5' 'dʒ.5' 'æ.5' ]
	
    - If stressTokens array is shorter than ipaText array, pad with default stress -> 5.
    - If stressTokens is longer than ipaText array , extra stresstokens are ignored.
    - Always returns an array of (phoneme -> stress) pairs.
    - with length equal to ipaText length"

	| default lenIPA lenStress result |
	default := 5.
	lenIPA := ipaText size.
	lenStress := stressTokens size.
	result := OrderedCollection new.

	1 to: lenIPA do: [ :i |
		| phoneme stressToken stress |
		phoneme := ipaText at: i.
		stressToken := i <= lenStress
			               ifTrue: [ stressTokens at: i ]
			               ifFalse: [ nil ].

		stress := stressToken
			          ifNil: [ default ] "no stress → use default" 
			          ifNotNil: [
				          stressToken last isDigit
					          ifTrue: [ stressToken last digitValue ]
					          ifFalse: [ default ] ].

		PAMDspUtility log: ('[pairIPAPhoneme] phoneme="{1}"  stress={2}' format: { phoneme. stress }).
			
		result add: { phoneme. stress } ].

	^ result asArray
]
