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
 
	"see for logs :)"
	Transcript open.
]

{ #category : 'execution' }
PAMDspExamples class >> sayText [
"pragma for the above method"
	<script: 'self sayText'>
	
	|player text|	
	text := 'DOG'.	
	player := PAMDsp new.
	player sayText: text.
	
	"See for logs :)"
	Transcript open.
 
]

{ #category : 'execution' }
PAMDspExamples class >> sayTextWithProsody: string asChild: bool [
"pragma for the above method"
	<script: 'self sayTextWithProsody: ''dog'' asChild: false'>
	
	|player text|	
	text := 'DOG'.	
	player := PAMDsp new.
	player sayTextWithProsody: text asChild: false.
	
	"See for logs :)"
	Transcript open.
 
]
