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
        dsp := nil
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
PAMDsp >> playAllAlphabetsWithDelay [
	"plays all numbers in a linear fashion asynchronusly"
	[(0 to: 43) do: [ :eachPhoneme |
			Transcript show: 'Index: ', eachPhoneme printString; cr.
			dsp setValue: eachPhoneme parameter: 'AlphabetIndex'.
			dsp trig: 'AlphabetGate'.
			(Delay forSeconds: 1) wait ] ] fork
]

{ #category : 'execution' }
PAMDsp >> sayNumbers0to9 [ 
    "Plays all numbers sequentially with 1 second delay"
	 self cleanUp.
    self dsp: PAMDspUtility numbers. "Get a fresh DSP from utility"

    [
        0 to: 9 do: [ :i |
            dsp setValue: i parameter: 'NumberIndex'.
            dsp trig: 'NumberGate'.
            (Delay forSeconds: 1) wait.
        ].
	 self cleanUp.
    ] fork.
]

{ #category : 'execution' }
PAMDsp >> sayNumbers: aCollection [
    "Plays a collection of numbers asynchronously"
	 self cleanUp.
    self dsp: (PAMDspUtility numbers). "Get a fresh DSP from utility"

    [
        aCollection do: [ :i |
            dsp setValue: i parameter: 'NumberIndex'.
            dsp trig: 'NumberGate'.
            (Delay forSeconds: 1) wait.
        ].
	 self cleanUp.
    ] fork.
]
