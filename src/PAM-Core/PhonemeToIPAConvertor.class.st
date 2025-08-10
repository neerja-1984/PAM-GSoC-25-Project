Class {
	#name : 'PhonemeToIPAConvertor',
	#superclass : 'Object',
	#classVars : [
		'IPAConversionDictionary'
	],
	#category : 'PAM-Core-Reciter',
	#package : 'PAM-Core',
	#tag : 'Reciter'
}

{ #category : 'initialization' }
PhonemeToIPAConvertor class >> addRule: PAMPhoneme ipa: ipaSymbol [
	IPAConversionDictionary at: PAMPhoneme asUppercase put: ipaSymbol.

]

{ #category : 'initialization' }
PhonemeToIPAConvertor class >> convertPAMPhonemeToIPAFormat: PAMPhonemeString [
    "Convert a list of PAM phonemes into IPA format"

    | ipaList stripped parts ipaSymbol |
    ipaList := OrderedCollection new.

    self initializeDictionary.

    PAMPhonemeString do: [ :eachPhoneme |
        (self isAtomicPhoneme: eachPhoneme)
            ifTrue: [
                stripped := self stripStressMarkersInPhoneme: eachPhoneme.
                ipaSymbol := IPAConversionDictionary at: stripped ifAbsent: [ '?' ].
                ipaList add: ipaSymbol.
                ReciterUtility log: 'Mapped phoneme ' , eachPhoneme , ' -> ' , ipaSymbol.
            ]
            ifFalse: [
                parts := self splitCompoundPhoneme: eachPhoneme.
                parts do: [ :p |
                    ipaSymbol := IPAConversionDictionary at: p ifAbsent: [ '?' ].
                    ipaList add: ipaSymbol.
                    ReciterUtility log: 'Mapped compound phoneme part ' , p , ' -> ' , ipaSymbol.
                ].
            ].
    ].

    ReciterUtility log: '--------------- EOD IPA conversion for ' , PAMPhonemeString printString , ' -----------------'.

    ^ ipaList asArray
]

{ #category : 'initialization' }
PhonemeToIPAConvertor class >> initializeDictionary [
    "Initialize with the 44 phonemes we are using"
   IPAConversionDictionary := Dictionary new.

	"Vowels"
    self addRule: 'IY' ipa: 'i_colon'.  "iː"
    self addRule: 'IH' ipa: 'ɪ'.
    self addRule: 'EY' ipa: 'eɪ'.
    self addRule: 'EH' ipa: 'e'.
    self addRule: 'AE' ipa: 'æ'.
    self addRule: 'AA' ipa: 'ɒ'.
    self addRule: 'AH' ipa: 'ʌ'.
    self addRule: 'AO' ipa: 'ɔ_colon'.  "ɔː"
    self addRule: 'UH' ipa: 'ʊ'.
    self addRule: 'UW' ipa: 'u_colon'.  "uː"
    self addRule: 'AY' ipa: 'aɪ'.
    self addRule: 'OW' ipa: 'əʊ'.
    self addRule: 'AW' ipa: 'aʊ'.
    self addRule: 'OY' ipa: 'ɔɪ'.
    self addRule: 'ER' ipa: 'ɜ_colon'.  "ɜː"
    self addRule: 'AX' ipa: 'ə'.
    self addRule: 'IX' ipa: 'ɪ'.

    "Nasal consonants"
    self addRule: 'M' ipa: 'm'.
    self addRule: 'N' ipa: 'n'.
    self addRule: 'NG' ipa: 'ŋ'.

    "Stops & Affricates"
    self addRule: 'P' ipa: 'p'.
    self addRule: 'B' ipa: 'b'.
    self addRule: 'T' ipa: 't'.
    self addRule: 'D' ipa: 'd'.
    self addRule: 'K' ipa: 'k'.
    self addRule: 'G' ipa: 'g'.
    self addRule: 'CH' ipa: 'ʈʃ'.  "retroflex affricate"
    self addRule: 'JH' ipa: 'dʒ'.
	 self addRule: 'J' ipa: 'dʒ'.

    "Fricatives"
    self addRule: 'F' ipa: 'f'.
    self addRule: 'V' ipa: 'v'.
    self addRule: 'TH' ipa: 'θ'.
    self addRule: 'DH' ipa: 'ð'.
    self addRule: 'S' ipa: 's'.
    self addRule: 'Z' ipa: 'z'.
    self addRule: 'SH' ipa: 'ʃ'.
    self addRule: 'ZH' ipa: 'ʒ'.
    self addRule: 'HH' ipa: 'h'.

    "Liquids & Glides"
    self addRule: 'L' ipa: 'l'.
    self addRule: 'R' ipa: 'r'. 
    self addRule: 'Y' ipa: 'j'.
    self addRule: 'W' ipa: 'w'.

    "Special markers"
    self addRule: 'Q' ipa: 'ʔ'. 
    self addRule: '' ipa: ''.
]

{ #category : 'initialization' }
PhonemeToIPAConvertor class >> isAtomicPhoneme: PAMPhoneme [
	"Check if stripped PAMphoneme is present in a dictionary ( ie. not a compound phoneme )"
	| stripped |
	stripped := self stripStressMarkersInPhoneme: PAMPhoneme.
	^ IPAConversionDictionary includesKey: stripped

]

{ #category : 'initialization' }
PhonemeToIPAConvertor class >> splitCompoundPhoneme: PAMPhoneme [
	"Split compound phoneme into known phonemes using a greedy approach --> ie longest first"
	| stripped size result pos found |
	stripped := self stripStressMarkersInPhoneme: PAMPhoneme.
	size := stripped size.
	result := OrderedCollection new.
	pos := 1.

	[ pos <= size ] whileTrue: [
		found := false.
		(size to: pos by: -1) do: [ :end |
			| slice |
			slice := (stripped copyFrom: pos to: end).
			(IPAConversionDictionary includesKey: slice) ifTrue: [
				result add: slice.
				pos := end + 1.
				found := true.
				^ result , (self splitCompoundPhoneme: (stripped copyFrom: pos to: size)) "recurse on the rest"
			]
		].
		found ifFalse: [
			result add: (stripped copyFrom: pos to: pos).
			pos := pos + 1.
		]
	].

	^ result

]

{ #category : 'initialization' }
PhonemeToIPAConvertor class >> stripStressMarkersInPhoneme: phoneme [ 
   "Remove digits (stress markers) and special markers like / and ' "
    ^ phoneme reject: [ :char | char isDigit or: [ '/''' includes: char ] ]
]
