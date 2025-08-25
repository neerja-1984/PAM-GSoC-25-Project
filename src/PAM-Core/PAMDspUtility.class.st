"
## Overview
`PAMDspUtility` is the backbone of the PAM system.  
It sets up DSP instances, manages sample players, and provides helper methods for phoneme order, logging, and presets (child/adult voice).  

Most `PAMDsp` methods delegate to here.  
Use this class when you want to directly configure or inspect DSP resources.

The chain of Usage : `PAMDspUtility → PAMDsp → PAMDspExamples`

---

## Usage

### Presets
```language=Pharo
PAMDspUtility adultPreset.   ""275 Hz (adult voice)""
PAMDspUtility childPreset.   ""500 Hz (child voice)""
PAMDspUtility notePresetForChild: true.  ""Logs + returns 500""
```

### DSP lifecycle
```language=Pharo
PAMDspUtility dspInstance.            ""Current dsp, if any""
PAMDspUtility dspInstance: nil.       ""Reset""
```

### Initialize with samples
```language=Pharo
""1. Looks for the folder in Documents/phoneme

2. Creates TpSampler

3. Starts the DSP""
""make sure the respective folder ( value of argument foldername is present in the Documents path""
PAMDspUtility initializeWithLabel: 'Phoneme' folderName: 'phoneme'. 
```

### DSP intilize
```language=Pharo
PAMDspUtility numbers.   ""DSP for numbers""
PAMDspUtility phonemes.  ""DSP for phonemes""
```

### IPA ordering
```language=Pharo
PAMDspUtility ipaOrder first: 5.
""defined dictionary that returns #('a_colon' 'aɪ' 'aʊ' 'b' 'd')""
```
"
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
PAMDspUtility class >> adultPreset [
	"returns the Note value of DSP --> which makes the DSP sound like a adult"
	^ 275.
]

{ #category : 'initialization' }
PAMDspUtility class >> childPreset [
	"returns the Note value of DSP --> which makes the DSP sound like a child"
	^ 500
]

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

{ #category : 'initialization' }
PAMDspUtility class >> notePresetForChild: isChild [
    "Return preset note value depending on child/adult flag and log the choice"
    | note |
    note := isChild ifTrue: [self childPreset] ifFalse: [self adultPreset].
    self log: 'Preset selected: ', 
        (isChild ifTrue: ['Child'] ifFalse: ['Adult']), 
        ' (note=', note printString, ')'.
    ^note.
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
