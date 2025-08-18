Class {
	#name : 'PAMDspUtility',
	#superclass : 'Object',
	#instVars : [
		'samplePlayer',
		'dsp'
	],
	#classInstVars : [
		'samplePlayer',
		'dspInstance',
		'childPreset',
		'adultPreset'
	],
	#category : 'PAM-Core-Instrument',
	#package : 'PAM-Core',
	#tag : 'Instrument'
}

{ #category : 'initialization' }
PAMDspUtility class >> dspInstance [

	^ dspInstance
]

{ #category : 'initialization' }
PAMDspUtility class >> dspInstance: arg1 [

	dspInstance := arg1
]

{ #category : 'initialization' }
PAMDspUtility class >> initializeWithLabel: aLabel folderName: aFolderName [

	| folderPath sampler |
	
	"genelized way to configure path which works wrt to any OS"
	folderPath := FileLocator documents / aFolderName.
	
	sampler := TpSampler new.
	sampler label: aLabel.
	
	samplePlayer := sampler pathToFolder: folderPath.
	dspInstance := samplePlayer stereo asDsp.
	dspInstance
		init;
		start.
		"displayUI"
	^ dspInstance

]

{ #category : 'accessing - array' }
PAMDspUtility class >> ipaOrder [

	^ #( 'a_colon' 'aɪ' 'aʊ' 'b' 'd' 'dʒ' 'e' 'eə' 'eɪ' 'f' 'g' 'h' 'i'
	     'i_colon' 'j' 'k' 'l' 'm' 'n' 'p' 'r' 's' 't' 'u_colon'
	     'v' 'w' 'z' 'æ' 'ð' 'ŋ' 'ɒ' 'ɔ_colon' 'ɔɪ' 'ə' 'əʊ' 'ɜ_colon'
	     'ɪə' 'ʃ' 'ʈʃ' 'ʊ' 'ʊə' 'ʌ' 'ʒ' 'θ' )
]

{ #category : 'execution' }
PAMDspUtility class >> log: message [

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

{ #category : 'directories' }
PAMDspUtility class >> numbers [

	^ self initializeWithLabel: 'Number' folderName: 'numbers'
]

{ #category : 'directories' }
PAMDspUtility class >> phonemes [

	^ self initializeWithLabel: 'Phoneme' folderName: 'phoneme'
]

{ #category : 'initialization' }
PAMDspUtility class >> samplePlayer [

	^ samplePlayer
]

{ #category : 'initialization' }
PAMDspUtility class >> samplePlayer: arg1 [

	samplePlayer := arg1
]
