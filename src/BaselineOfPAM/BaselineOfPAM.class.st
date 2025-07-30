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
				 self phausto: spec.
				 self coypu: spec.
				 self coypuIDE: spec.
				
				"Packages"
				spec
					package: 'PAM-Core' with: [ spec requires: #('Phausto' 'Coypu' 'CoypuIDE') ];
					package: 'PAM-Core-Tests' with: [ spec requires: #('PAM-Core' ) ]
					
					].
]

{ #category : 'baselines' }
BaselineOfPAM >> coypu: spec [
	spec
		baseline: 'Coypu'
		with: [
			spec  
				repository: 'github://RedwaneEngels/Coypu'
		]
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

{ #category : 'baselines' }
BaselineOfPAM >> phausto: spec [
	spec
		baseline: 'Phausto'
		with: [
			spec  
				repository: 'github://lucretiomsp/phausto:main'
		]
]
