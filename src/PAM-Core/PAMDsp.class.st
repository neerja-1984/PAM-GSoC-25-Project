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

{ #category : 'execution' }
PAMDsp >> sayPhoneme: text [
    | sortedIPAarray ipaText idx |

    "Plays the audio of the string we provide"
    self cleanUp.
    self dsp: (PAMDspUtility phonemes). "Get a fresh DSP from utility"
    sortedIPAarray := PAMDspUtility ipaOrder.

    "Convert to IPA characters"
    ipaText := Reciter textToIPAPhonemes: text.

    [
        PAMDspUtility log: '--------------- Starting phoneme playback for "', text, '" -----------------'.

        ipaText do: [:token |
            idx := sortedIPAarray indexOf: token ifAbsent: [ 0 ].
				"PAMDspUtility log: 'Array Index for ', token printString, ' -->  ', idx printString."

            idx > 0 ifTrue: [
                dsp setValue: idx-1 parameter: 'PhonemeIndex'.
                PAMDspUtility log: ('Playing phoneme ' , token , ' at index ' , idx printString).
                dsp trig: 'PhonemeGate' for: 0.05.
                (Delay forSeconds: 1) wait.
            ] ifFalse: [
                PAMDspUtility log: ('Skipping unknown phoneme token: "' , token , '"').
            ].
        ].

        PAMDspUtility log: '--------------- EOD playback for "', text, '" -----------------'.
        self cleanUp.
    ] fork.


]
