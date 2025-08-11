Class {
	#name : 'PAMDsp',
	#superclass : 'Object',
	#instVars : [
		'dsp'
	],
	#category : 'PAM-Core-Instrument',
	#package : 'PAM-Core',
	#tag : 'Instrument'
}

{ #category : 'cleanup' }
PAMDsp >> cleanUp [
    dsp ifNotNil: [
        dsp stop.
        dsp destroy.
        dsp := nil.
		PAMDspUtility log: 'DSP destroyed succesfully !'
    ].
]

{ #category : 'execution' }
PAMDsp >> dsp [ 
	^ dsp.
]

{ #category : 'execution' }
PAMDsp >> dsp: aDsp [
	dsp:= aDsp.
]

{ #category : 'execution' }
PAMDsp >> sayNumbers0to9 [ 
    "Plays all numbers sequentially with 1 second delay"
	 self cleanUp.
    self dsp: (PAMDspUtility numbers). "Get a fresh DSP from utility"

    [
		PAMDspUtility log: '------ Starting phoneme playback for numbers0to9 -------------'.
        0 to: 9 do: [ :i |
            dsp setValue: i parameter: 'NumberIndex'.
            dsp trig: 'NumberGate'.
            (Delay forSeconds: 1) wait.
        ].
	 PAMDspUtility log: '--------------- EOD playback for numbers0to9  -----------------'.
	 self cleanUp.
    ] fork.
]

{ #category : 'execution' }
PAMDsp >> sayNumbers: aCollection [
    "Plays a collection of numbers asynchronously"
	 self cleanUp.
    self dsp: (PAMDspUtility numbers). "Get a fresh DSP from utility"

    [
		PAMDspUtility log: '------ Starting phoneme playback for ' , aCollection printString , ' -------------'.
        aCollection do: [ :i |
            dsp setValue: i parameter: 'NumberIndex'.
				PAMDspUtility log: ('Playing phoneme ' , i printString).
            dsp trig: 'NumberGate'.
            (Delay forSeconds: 1) wait.
        ].
	 PAMDspUtility log: '--------------- EOD playback for ', aCollection printString , ' -----------------'.
	 self cleanUp.
    ] fork.
]
