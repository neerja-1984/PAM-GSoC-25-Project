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
	#name : 'PunctuationUtility',
	#superclass : 'Object',
	#classVars : [
		'RulesDictionaryByLetter'
	],
	#category : 'PAM-Core-Reciter',
	#package : 'PAM-Core',
	#tag : 'Reciter'
}

{ #category : 'initialization - data' }
PunctuationUtility class >> initializeDictionary [
    "Initialize the rule utility"
	 RulesDictionaryByLetter := PunctuationRules getAllRules.
	 ^RulesDictionaryByLetter.
]
