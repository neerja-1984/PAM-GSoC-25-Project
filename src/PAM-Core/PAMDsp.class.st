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

{ #category : 'initialization' }
PAMDsp >> initialize [
    | pathToNumbers |
    pathToNumbers := FileLocator imageDirectory asAbsolute pathString , '\numbers'.
    samplePlayer := TpSampler new label: 'Number'; pathToFolder: pathToNumbers.
    dsp := samplePlayer stereo asDsp.
    dsp init.
    dsp start.
]

{ #category : 'execution' }
PAMDsp >> playAllNumbersWithDelay [
	"plays all numbers in a linear fashion"
    (0 to: 9) do: [:i |
        dsp setValue: i parameter: 'NumberIndex'.
        dsp trig: 'NumberGate'.
        (Delay forSeconds: 1) wait.
    ].
]

{ #category : 'execution' }
PAMDsp >> playNumbers: aCollection [

	"plays a collection of numbers !"
    aCollection do: [:i |
        dsp setValue: i parameter: 'NumberIndex'.
        dsp trig: 'NumberGate'.
        (Delay forSeconds: 1) wait.
    ].
]
