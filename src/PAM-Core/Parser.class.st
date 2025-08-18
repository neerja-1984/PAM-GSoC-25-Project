Class {
	#name : 'Parser',
	#superclass : 'Object',
	#category : 'PAM-Core-Parser',
	#package : 'PAM-Core',
	#tag : 'Parser'
}

{ #category : 'as yet unclassified' }
Parser class >> amplitudeForStress: stress [
    "Map stress in range [4..6] with amplitude in range [0.5..1.0].

  		----- INDEX ----   
	  4 = soft (0.5), 6 = strong (1.0)."
    ^ 0.5 + (((stress - 4) / 2.0) * 0.5)
]
