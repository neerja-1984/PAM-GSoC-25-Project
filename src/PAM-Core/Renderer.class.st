Class {
	#name : 'Renderer',
	#superclass : 'Object',
	#category : 'PAM-Core-Renderer',
	#package : 'PAM-Core',
	#tag : 'Renderer'
}

{ #category : 'pragmas' }
Renderer >> fly [
	<script: 'self new fly'>
    ^ Transcript open; show: 'Fly Pragma Works'.
]
