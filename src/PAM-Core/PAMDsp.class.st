Class {
	#name : 'PAMDsp',
	#superclass : 'Object',
	#instVars : [
		'samplePlayer',
		'dsp'
	],
	#category : 'PAM-Core-Instrument',
	#package : 'PAM-Core',
	#tag : 'Instrument'
}

{ #category : 'cleanup' }
PAMDsp >> cleanup [
    dsp stop.
    dsp destroy.
]

{ #category : 'execution' }
PAMDsp >> dsp [
    ^ dsp
]

{ #category : 'execution' }
PAMDsp >> dsp: aDsp [
    dsp := aDsp
]

{ #category : 'initialization' }
PAMDsp >> initializeAlphabetFolder [
	"pre requisite --> have the numbers audion folder in image directory"
	self initilizeWithLabel: 'Alphabet' folderName: 'alphabets'.

]

{ #category : 'initialization' }
PAMDsp >> initializeNumbersFolder [
	"pre requisite --> have the numbers audion folder in image directory"
	self initilizeWithLabel: 'Number' folderName: 'numbers'.

]

{ #category : 'initialization' }
PAMDsp >> initilizeWithLabel: aLabel folderName: aFolderName [ 
	"a generalised method to set label and folder Name in any OS environment !"
    | path pathSeparator|
	 pathSeparator:= '/'.
	 OSPlatform current isWindows ifTrue: [ pathSeparator:= '\'].
    path := FileLocator imageDirectory asAbsolute pathString , pathSeparator , aFolderName.
    
    samplePlayer := TpSampler new 
        label: aLabel; 
        pathToFolder: path.

    dsp := samplePlayer stereo asDsp.
    dsp init.
	 "uncomment below if UI is to be made visible "
	 "dsp displayUI."
    dsp start.
]

{ #category : 'execution' }
PAMDsp >> playAllAlphabetsWithDelay [
	"plays all numbers in a linear fashion asynchronusly"
	[(0 to: 43) do: [ :eachPhoneme |
			dsp setValue: eachPhoneme parameter: 'AlphabetIndex'.
			dsp trig: 'AlphabetGate'.
			(Delay forSeconds: 1) wait ] ] fork
]

{ #category : 'execution' }
PAMDsp >> playAllNumbersWithDelay [
	"plays all numbers in a linear fashion asynchronusly"
	[(0 to: 9) do: [ :i |
			dsp setValue: i parameter: 'NumberIndex'.
			dsp trig: 'NumberGate'.
			(Delay forSeconds: 1) wait ] ] fork
]

{ #category : 'execution' }
PAMDsp >> playNumbers: aCollection [

	"plays a collection of numbers asynchroously !"
    [
        aCollection do: [:i |
            dsp setValue: i parameter: 'NumberIndex'.
            dsp trig: 'NumberGate'.
            (Delay forSeconds: 1) wait.
        ]
    ] fork.
]

{ #category : 'execution' }
PAMDsp >> samplePlayer [
    ^ samplePlayer

]

{ #category : 'execution' }
PAMDsp >> samplePlayer: aSampler [
    samplePlayer := aSampler
]
