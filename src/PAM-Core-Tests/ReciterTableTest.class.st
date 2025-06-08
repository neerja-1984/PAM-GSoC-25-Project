Class {
	#name : 'ReciterTableTest',
	#superclass : 'TestCase',
	#category : 'PAM-Core-Tests-Reciter',
	#package : 'PAM-Core-Tests',
	#tag : 'Reciter'
}

{ #category : 'tests' }
ReciterTableTest >> testBacktickMapsTo130 [
    | map |
    map := ReciterTable mapEnglishVocabularyWithFlags.
    self assert: (map at: $') equals: (128 bitOr: 2).
]

{ #category : 'tests' }
ReciterTableTest >> testConsonantsValues [

	| map |
	map := ReciterTable mapEnglishVocabularyWithFlags.
	($B to: $Z) do: [ :char |
		(#( $A $E $I $O $U $Y ) includes: char) ifFalse: [
			self assert: ((map at: char) bitAnd: 128) equals: 128.
			self assert: ((map at: char) bitAnd: 32) equals: 32 ] ]
]

{ #category : 'tests' }
ReciterTableTest >> testFricativeConsonantValues [

	| map |
	map := ReciterTable mapEnglishVocabularyWithFlags.
	#( $C $G $J $S $X $Z ) do: [ :char |
		self assert: ((map at: char) bitAnd: 16) equals: 16 ]
]

{ #category : 'tests' }
ReciterTableTest >> testNumbersMapTo3 [
    | map |
    map := ReciterTable mapEnglishVocabularyWithFlags.
    ($0 to: $9) do: 
		[ :digit | self assert: (map at: digit) equals: (1 bitOr: 2) ].
]

{ #category : 'tests' }
ReciterTableTest >> testPunctuationMapsTo2 [
    | map |
    map := ReciterTable mapEnglishVocabularyWithFlags.
    #($! $" $# $$ $% $& $* $+ $, $- $. $/ $: $; $< $= $> $? $@ $^) do: 
			[ :char | self assert: (map at: char) equals: 2 ].
]

{ #category : 'tests' }
ReciterTableTest >> testSpaceAndBracketsMapTo0 [
    | map |
    map := ReciterTable mapEnglishVocabularyWithFlags.
    self assert: (map at: Character space) equals: 0.
    self assert: (map at: $() equals: 0.
    self assert: (map at: $)) equals: 0.
    self assert: (map at: $[) equals: 0.
    self assert: (map at: $]) equals: 0.
    self assert: (map at: $_) equals: 0.
    self assert: (map at: $\) equals: 0.
]

{ #category : 'tests' }
ReciterTableTest >> testVoicedConsonantValues [

	| map |
	map := ReciterTable mapEnglishVocabularyWithFlags.
	#( $D $Z $T ) do: [ :char |
		self assert: ((map at: char) bitAnd: 4) equals: 4 ]
]

{ #category : 'tests' }
ReciterTableTest >> testVowelsMapTo192 [
    | map |
    map := ReciterTable mapEnglishVocabularyWithFlags.
    #($A $E $I $O $U $Y) do: 
		[ :char | self assert: (map at: char) equals: (128 bitOr: 64) ].
]
