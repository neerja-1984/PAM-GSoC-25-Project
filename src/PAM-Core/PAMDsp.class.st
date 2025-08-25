"
## Overview
`PAMDsp` manages a DSP (Digital Signal Processor) instance used for text-to-speech and number playback.  
It provides convenience methods to:
- load intilized DSP (`numbers`, `phonemes`) from `PAMDspUtility`,
- play digits or arbitrary text,
- add prosody (stress, duration, amplitude) to speech,
- ensure cleanup of the DSP instance after playback.

Each call runs asynchronously (`fork`) so the Pharo remains responsive.

---

## Usage

```language=Pharo&anchor=Example1
| dsp |
dsp := PAMDsp new.

""use any 1 from below""

dsp sayNumbers0to9.
dsp sayNumbers: #(3 1 4 1 5 9).
dsp sayText: 'dog'.
dsp sayTextWithProsody: 'dog' asChild: false. ""false = adult preset. Toggle it to true to see the difference""


"
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

{ #category : 'instance variables' }
PAMDsp >> dsp [ 
	^ dsp.
]

{ #category : 'instance variables' }
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
PAMDsp >> sayText: text [
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

{ #category : 'execution' }
PAMDsp >> sayTextWithProsody: text asChild: isChild [
    | sortedIPAarray ipaText stressTokens ipaAndStress idx phoneme stress amplitude duration note|

    self cleanUp.
    self dsp: (PAMDspUtility phonemes).

	 "get note value based on flag"
	 note := PAMDspUtility notePresetForChild: isChild.
	 dsp setValue: note parameter: 'PhonemeNote'.	
		
    sortedIPAarray := PAMDspUtility ipaOrder.

    ipaText := Reciter textToIPAPhonemes: text.
    stressTokens := Reciter textToPhonemes: text.

    "give a collection of pair's of {ipaPhoneme . SAM-Phonem}"
    ipaAndStress := Parser pairIPAPhoneme: ipaText withStress: stressTokens.

    [
        PAMDspUtility log: '--------------- Starting phoneme playback for "', text, '" -----------------'.

        ipaAndStress do: [:pair |
            phoneme := pair first.
            stress  := pair second.

            amplitude := Parser amplitudeForStress: stress.
            duration  := Parser durationForStress: stress.

            idx := sortedIPAarray indexOf: phoneme ifAbsent: [ 0 ].

            idx > 0 ifTrue: [
                dsp setValue: idx - 1 parameter: 'PhonemeIndex'.
                dsp setValue: amplitude parameter: 'PhonemeULevel'.

                PAMDspUtility log: ('Playing phoneme ', phoneme,
                    ' (stress=', stress printString,
                    ', amp=', amplitude printString,
                    ', dur=', duration printString,
						 ', note=', note printString,
                    ') at index ', idx printString).

                dsp trig: 'PhonemeGate' for: duration.
                (Delay forSeconds: 0.2) wait.
            ] ifFalse: [
                PAMDspUtility log: ('Skipping unknown phoneme token: "', phoneme, '"').
            ].
        ].

        PAMDspUtility log: '--------------- EOD playback for "', text, '" -----------------'.
        self cleanUp.
    ] fork.
]
