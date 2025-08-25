"
## Overview
`PAMDspExamples` provides ready-to-run demos for the `PAMDsp` speech engine.  
Each method has a `<script: …>` pragma, so you can **click the run-script button** (the small notepad icon in the class-side browser next to each method) to execute it instantly.

This class is intended for:
- **Testing** basic playback (numbers, text, prosody)  
- **Showcasing** `PAMDsp` features  
- **Quick experiments** without writing boilerplate in Playground

"
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
