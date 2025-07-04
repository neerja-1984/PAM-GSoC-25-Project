"
AlphabetUtility is a utility class which maintains a central dictionary in which it maps each letter (A, B, etc.) to its corresponding rule collection. This enables quick lookup of rules during phoneme conversion.

Responsibilities:

• Initialize and maintain a dictionary of rules grouped by starting character
• Register rule classes corresponding to each alphabet letter
• Provide an interface to retrieve rules for a specific letter

Main Methods:

1. `initializeDictionary`
Initializes the RulesDictionaryByLetter class variable as an empty dictionary and registers rules for letters.
Example:
AlphabetUtility initializeDictionary
(After calling this, the dictionary will contain mappings like $A → all letter A rules)

2. `registerLetterRules:for:`
Associates a given rule class with a specific character and stores its rules in the dictionary.
Example:
AlphabetUtility registerLetterRules: A for: $A
(Stores all rules from `LetterRules>>A` under key $A in RulesDictionaryByLetter)

3. `rulesFor:`
Retrieves the list of rules for a specified character from the dictionary.
Returns an empty collection if no rules exist for the letter.
Example:
AlphabetUtility rulesFor: $B
→ Returns all rules beginning with B as an OrderedCollection

Design Notes:

• AlphabetUtility decouples rule storage from processing logic, keeping rule definitions organized by their starting letter
• Useful during the phoneme conversion process for quickly finding applicable rules
• Uses class variable RulesDictionaryByLetter to map characters (A–Z) to their respective rule sets
• To add new letters add the method `registerLetterRules:for:` with the appropriate rule class in `initializeDictionary`
"
Class {
	#name : 'AlphabetUtility',
	#superclass : 'Object',
	#classVars : [
		'RulesDictionaryByLetter'
	],
	#category : 'PAM-Core-Reciter',
	#package : 'PAM-Core',
	#tag : 'Reciter'
}

{ #category : 'initialization - data' }
AlphabetUtility class >> initializeDictionary [
    "Initialize the rule utility"
    RulesDictionaryByLetter := Dictionary new.
    
	"Register all letter rule classes"
	self registerLetterRules: A for: $A.
	self registerLetterRules: B for: $B.
	self registerLetterRules: C for: $C.
	self registerLetterRules: D for: $D.
	self registerLetterRules: E for: $E.
	self registerLetterRules: F for: $F.
	self registerLetterRules: G for: $G.
	self registerLetterRules: H for: $H.
	self registerLetterRules: I for: $I.
	self registerLetterRules: J for: $J.
	self registerLetterRules: K for: $K.
	self registerLetterRules: L for: $L.
	self registerLetterRules: M for: $M.
	self registerLetterRules: N for: $N.
	self registerLetterRules: O for: $O.
	self registerLetterRules: P for: $P.
	self registerLetterRules: Q for: $Q.
	self registerLetterRules: R for: $R.
	self registerLetterRules: S for: $S.
	self registerLetterRules: T for: $T.
	self registerLetterRules: U for: $U.
	self registerLetterRules: V for: $V.
	self registerLetterRules: W for: $W.
	self registerLetterRules: X for: $X.
	self registerLetterRules: Y for: $Y.
	self registerLetterRules: Z for: $Z.
]

{ #category : 'initialization - data' }
AlphabetUtility class >> registerLetterRules: ruleClass for: letter [
    "Register a letter's rules"
    RulesDictionaryByLetter at: letter asUppercase put: ruleClass getAllRules.
]

{ #category : 'accessing' }
AlphabetUtility class >> rulesFor: aCharacter [
    "Get all rules for a specific character"
    ^ (RulesDictionaryByLetter at: aCharacter asUppercase ifAbsent: [ #() ]) asOrderedCollection
]
