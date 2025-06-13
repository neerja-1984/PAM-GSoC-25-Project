Class {
	#name : 'CharacterToFlagMappingTest',
	#superclass : 'TestCase',
	#category : 'PAM-Core-Tests-Reciter',
	#package : 'PAM-Core-Tests',
	#tag : 'Reciter'
}

{ #category : 'tests' }
CharacterToFlagMappingTest >> testBacktickMapsTo130 [
    | map |
    map := Flags mappingCharacterToFlag.
    self assert: (map at: $') equals: (128 bitOr: 2).
]

{ #category : 'tests' }
CharacterToFlagMappingTest >> testConsonantsValues [

	| map |
	map := Flags mappingCharacterToFlag.
	($B to: $Z) do: [ :char |
		(#( $A $E $I $O $U $Y ) includes: char) ifFalse: [
			self assert: ((map at: char) bitAnd: 128) equals: 128.
			self assert: ((map at: char) bitAnd: 32) equals: 32 ] ]
]

{ #category : 'tests' }
CharacterToFlagMappingTest >> testFricativeConsonantValues [

	| map |
	map := Flags mappingCharacterToFlag.
	#( $C $G $J $S $X $Z ) do: [ :char |
		self assert: ((map at: char) bitAnd: 16) equals: 16 ]
]

{ #category : 'tests' }
CharacterToFlagMappingTest >> testNumbersMapTo3 [
    | map |
    map := Flags mappingCharacterToFlag.
    ($0 to: $9) do: 
		[ :digit | self assert: (map at: digit) equals: (1 bitOr: 2) ].
]

{ #category : 'tests' }
CharacterToFlagMappingTest >> testPunctuationMapsTo2 [
    | map |
    map := Flags mappingCharacterToFlag.
    #($! $" $# $$ $% $& $* $+ $, $- $. $/ $: $; $< $= $> $? $@ $^) do: 
			[ :char | self assert: (map at: char) equals: 2 ].
]

{ #category : 'tests' }
CharacterToFlagMappingTest >> testSpaceAndBracketsMapTo0 [
    | map |
    map := Flags mappingCharacterToFlag.
    self assert: (map at: Character space) equals: 0.
    self assert: (map at: $() equals: 0.
    self assert: (map at: $)) equals: 0.
    self assert: (map at: $[) equals: 0.
    self assert: (map at: $]) equals: 0.
    self assert: (map at: $_) equals: 0.
    self assert: (map at: $\) equals: 0.
]

{ #category : 'tests' }
CharacterToFlagMappingTest >> testVoicedConsonantValues [

	| map |
	map := Flags mappingCharacterToFlag.
	#( $D $Z $T ) do: [ :char |
		self assert: ((map at: char) bitAnd: 4) equals: 4 ]
]

{ #category : 'tests' }
CharacterToFlagMappingTest >> testVowelsMapTo192 [
    | map |
    map := Flags mappingCharacterToFlag.
    #($A $E $I $O $U $Y) do: 
		[ :char | self assert: (map at: char) equals: (128 bitOr: 64) ].
]
