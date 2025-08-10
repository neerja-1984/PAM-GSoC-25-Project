Class {
	#name : 'PAMDspExamples',
	#superclass : 'Object',
	#category : 'PAM-Core-Instrument',
	#package : 'PAM-Core',
	#tag : 'Instrument'
}

{ #category : 'execution' }
PAMDspExamples class >> sayNumbers0to9 [
"pragma for the above method"
	<script: 'self sayNumbers0to9'>
	
	|player|	
	player := PAMDsp new.
	player sayNumbers0to9.
 
]
