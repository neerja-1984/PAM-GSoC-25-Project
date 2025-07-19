Class {
	#name : 'PAMDspExamples',
	#superclass : 'Object',
	#category : 'PAM-Core-Instrument',
	#package : 'PAM-Core',
	#tag : 'Instrument'
}

{ #category : 'execution' }
PAMDspExamples class >> playAllNumbersWithDelay [
"pragma for the above method"
	<script: 'PAMDsp new'>
	
|player|	
player := PAMDsp new.
player initializeNumbersFolder.
player playAllNumbersWithDelay.
 
]
