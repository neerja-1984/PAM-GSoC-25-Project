Class {
	#name : 'PAMDspUtility',
	#superclass : 'Object',
	#instVars : [
		'samplePlayer',
		'dsp'
	],
	#classInstVars : [
		'samplePlayer',
		'dspInstance'
	],
	#category : 'PAM-Core-Instrument',
	#package : 'PAM-Core',
	#tag : 'Instrument'
}

{ #category : 'execution' }
PAMDspUtility class >> dspInstance [

	^ dspInstance.
]

{ #category : 'execution' }
PAMDspUtility class >> dspInstance: adspInstance [
	dspInstance:= adspInstance.
]

{ #category : 'initialization' }
PAMDspUtility class >> initilizeWithLabel: aLabel folderName: aFolderName [ 

	"a generalised method to set label and folder Name in any OS environment !"
    | path pathSeparator|
	 pathSeparator:= '/'.
	 OSPlatform current isWindows ifTrue: [ pathSeparator:= '\'].
    path := FileLocator imageDirectory asAbsolute pathString , pathSeparator , aFolderName.
    
    samplePlayer := TpSampler new 
        label: aLabel; 
        pathToFolder: path.

    dspInstance := samplePlayer stereo asDsp.
    dspInstance init.
	 "uncomment below if UI is to be made visible "
	 "dspInstance displayUI."
    dspInstance start.

	 ^ dspInstance.
]

{ #category : 'initialization' }
PAMDspUtility class >> numbers [

	^ self initilizeWithLabel: 'Number' folderName: 'numbers'
]

{ #category : 'initialization' }
PAMDspUtility class >> phonemes [

	^ self initilizeWithLabel: 'Phoneme' folderName: 'phoneme'
]

{ #category : 'execution' }
PAMDspUtility class >> samplePlayer [

	^ samplePlayer
]

{ #category : 'execution' }
PAMDspUtility class >> samplePlayer: arg1 [

	samplePlayer := arg1
]
