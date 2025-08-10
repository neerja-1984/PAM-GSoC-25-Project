Class {
	#name : 'PAMDspTest',
	#superclass : 'TestCase',
	#category : 'PAM-Core-Tests-Instrument',
	#package : 'PAM-Core-Tests',
	#tag : 'Instrument'
}

{ #category : 'tests' }
PAMDspTest >> testStereoOutputNotNull [
    | player |

    "Test that stereo output is not null"
    player := PAMDsp new.
    player sayNumbers0to9.
    self deny: player dsp isNull.
]
