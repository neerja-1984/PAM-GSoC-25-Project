Class {
	#name : 'BaselineOfPAM',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfPAM',
	#package : 'BaselineOfPAM'
}

{ #category : 'baselines' }
BaselineOfPAM >> baseline: spec [
	<baseline>
	spec
		for: #common
			do: [
				
				"Dependencies"
				 self coypuIDE: spec.
				
				"Packages"
				spec
					package: 'PAM-Core' with: [ spec requires: #('CoypuIDE') ];
					package: 'PAM-Core-Tests' with: [ spec requires: #('PAM-Core' ) ]
					
					].
]

{ #category : 'baselines' }
BaselineOfPAM >> coypuIDE: spec [
	spec
		baseline: 'CoypuIDE'
		with: [
			spec  
				repository: 'github://lucretiomsp/CoypuIDE'
		]
]
