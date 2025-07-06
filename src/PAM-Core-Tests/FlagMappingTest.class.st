Class {
	#name : 'FlagMappingTest',
	#superclass : 'TestCase',
	#category : 'PAM-Core-Tests-Reciter',
	#package : 'PAM-Core-Tests',
	#tag : 'Reciter'
}

{ #category : 'tests' }
FlagMappingTest >> testBacktickMapsTo130 [
    | map |
    map := Flags mappingCharactersToFlag.
    self assert: (map at: $') equals: (128 bitOr: 2).
]

{ #category : 'tests' }
FlagMappingTest >> testConsonantsValues [

	| map |
	map := Flags mappingCharactersToFlag.
	($B to: $Z) do: [ :char |
		(#( $A $E $I $O $U $Y ) includes: char) ifFalse: [
			self assert: ((map at: char) bitAnd: 128) equals: 128.
			self assert: ((map at: char) bitAnd: 32) equals: 32 ] ]
]

{ #category : 'tests' }
FlagMappingTest >> testFricativeConsonantValues [

	| map |
	map := Flags mappingCharactersToFlag.
	#( $C $G $J $S $X $Z ) do: [ :char |
		self assert: ((map at: char) bitAnd: 16) equals: 16 ]
]

{ #category : 'tests' }
FlagMappingTest >> testNumbersMapTo3 [
    | map |
    map := Flags mappingCharactersToFlag.
    ($0 to: $9) do: 
		[ :digit | self assert: (map at: digit) equals: (1 bitOr: 2) ].
]

{ #category : 'tests' }
FlagMappingTest >> testPunctuationMapsTo2 [
    | map |
    map := Flags mappingCharactersToFlag.
    #($! $" $# $$ $% $& $* $+ $, $- $. $/ $: $; $< $= $> $? $@ $^) do: 
			[ :char | self assert: (map at: char) equals: 2 ].
]

{ #category : 'tests' }
FlagMappingTest >> testSpaceAndBracketsMapTo0 [
    | map |
    map := Flags mappingCharactersToFlag.
    self assert: (map at: Character space) equals: 0.
    self assert: (map at: $() equals: 0.
    self assert: (map at: $)) equals: 0.
    self assert: (map at: $[) equals: 0.
    self assert: (map at: $]) equals: 0.
    self assert: (map at: $_) equals: 0.
    self assert: (map at: $\) equals: 0.
]

{ #category : 'tests' }
FlagMappingTest >> testVoicedConsonantValues [

	| map |
	map := Flags mappingCharactersToFlag.
	#( $D $Z $T ) do: [ :char |
		self assert: ((map at: char) bitAnd: 4) equals: 4 ]
]

{ #category : 'tests' }
FlagMappingTest >> testVowelsMapTo192 [
    | map |
    map := Flags mappingCharactersToFlag.
    #($A $E $I $O $U $Y) do: 
		[ :char | self assert: (map at: char) equals: (128 bitOr: 64) ].
]
