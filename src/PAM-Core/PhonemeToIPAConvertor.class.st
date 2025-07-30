Class {
	#name : 'PhonemeToIPAConvertor',
	#superclass : 'Object',
	#classVars : [
		'IPAConversionDictionary'
	],
	#category : 'PAM-Core-Instrument',
	#package : 'PAM-Core',
	#tag : 'Instrument'
}

{ #category : 'initialization' }
PhonemeToIPAConvertor class >> initializeDictionary [
    "Initialize with the 44 phonemes we are using"
   IPAConversionDictionary := Dictionary new.

	self addRule: 'IY' ipa: 'i_colon'.
	self addRule: 'IH' ipa: 'i'.
	self addRule: 'EY' ipa: 'eɪ'.
	self addRule: 'EH' ipa: 'e'.
	self addRule: 'AE' ipa: 'æ'.
	self addRule: 'AA' ipa: 'a_colon'.
	self addRule: 'AH' ipa: 'ʌ'.
	self addRule: 'AO' ipa: 'ɔ_colon'.
	self addRule: 'UH' ipa: 'ʊ'.
	self addRule: 'UW' ipa: 'u_colon'.
	self addRule: 'AY' ipa: 'aɪ'.
	self addRule: 'OW' ipa: 'əʊ'.
	self addRule: 'AW' ipa: 'aʊ'.
	self addRule: 'OY' ipa: 'ɔɪ'.
	self addRule: 'ER' ipa: 'ɜ_colon'.
	self addRule: 'AX' ipa: 'ə'.
	self addRule: 'IX' ipa: 'ɪ'.
	self addRule: 'EH4' ipa: 'e'.

	"Consonants"
	self addRule: 'P' ipa: 'p'.
	self addRule: 'B' ipa: 'b'.
	self addRule: 'T' ipa: 't'.
	self addRule: 'D' ipa: 'd'.
	self addRule: 'CH' ipa: 'tʃ'.
	self addRule: 'JH' ipa: 'dʒ'.
	self addRule: 'K' ipa: 'k'.
	self addRule: 'G' ipa: 'g'.
	self addRule: 'F' ipa: 'f'.
	self addRule: 'V' ipa: 'v'.
	self addRule: 'TH' ipa: 'θ'.
	self addRule: 'DH' ipa: 'ð'.
	self addRule: 'S' ipa: 's'.
	self addRule: 'Z' ipa: 'z'.
	self addRule: 'SH' ipa: 'ʃ'.
	self addRule: 'ZH' ipa: 'ʒ'.
	self addRule: 'M' ipa: 'm'.
	self addRule: 'N' ipa: 'n'.
	self addRule: 'NG' ipa: 'ŋ'.
	self addRule: 'L' ipa: 'l'.
	self addRule: 'R' ipa: 'r'.
	self addRule: 'Y' ipa: 'j'.
	self addRule: 'W' ipa: 'w'.
]

{ #category : 'initialization' }
PhonemeToIPAConvertor class >> stripStressMarkersInPhoneme: phoneme [
	"Remove digits (stress markers) from phoneme"
	^ phoneme reject: [ :char | char isDigit ]
]
