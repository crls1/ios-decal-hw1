//: # Homework 1 - Debugging and Swift Intro

//: To see markup format, go to Editor -> Show Rendered Markup


import UIKit


//: ## Q1: Optionals
//: The compiler is yelling at us. Why isn't this the correct way to unwrap optionals?

class Foo {
    
    var wordA : String?
    var wordB : String?
    
    init (words: [String?]) {
        wordA = words[0]!
        wordB = words[1]!
    }
    
//: I changed the type of the wordA and wordB to be optinals since words is an array of optinal Stirngs. And to unwrap the optional I changed the
//: question mark to an exclaimation mark.
    

    
//: ## Q2: Variable Types and Function Types
//: Why does the compiler dislike the for loop? Also, what should we return?
    
    class func arePalindromes(words: [String]) -> Bool! {
        let reversedWords = words.map() {String($0.characters.reverse())}
        let numElements = words.count
        
        for var i = 0; i < numElements; i++ {
            if words[i] != reversedWords[i] {
                return false
            }
        }
        
        return true
    }
    
//: - The for loop did not compile because i was set to be a constant, but should be a variable since it changes.
//: - The return value should be true once we know the words are palindromes
//: - Since `arePalindromes()` is a type method it should have class before func.
//: - Minor changes: since the count of the array will not change, we can set `numElements` to be a constant

    
    
    
//: ## Q3: More functions, and object initialization
//: The method should be returning true or false -- what's wrong?
//: Are we initializing the dictionary correctly?
    class func isAnagram(wordA: String, wordB: String) -> Bool? {
        var countLetters = [Character : Int]()
        let lenA = wordA.characters.count
        let lenB = wordB.characters.count
        
        if lenA != lenB {
            return false
        }
        var arrA = Array(wordA.characters)
        var arrB = Array(wordB.characters)
        
        for i in 0...lenA-1 {
            let letter = arrA[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val + 1
            } else {
                countLetters[letter] = 1
            }
        }
        
        for i in 0...lenB-1 {
            let letter = arrB[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val - 1
            } else {
                return false
            }
        }
        
        for (_, count) in countLetters {
            if count != 0 {
                return false
            }
        }
        
        return true
    }
}

//: - The dictionary countLetters was not being initialized just described.
//: - Once we know that the words are anagrams the function should return true.
//: - Also the method is a type method so it should be prefixed with class
//: - Minor changes: changed the len variables to be constants also since letter was not used in for loop, I set it to an underscore


//: **Do not** change anything below.
//: You should be able to call the methods as is.

Foo.isAnagram("anagram", wordB: "managra")
Foo.isAnagram("hello", wordB: "what")

var palindromes = ["hih", "racecar", "mom", "wow"]
var notPalindromes = ["gene", "shawn", "hello"]
Foo.arePalindromes(palindromes)
Foo.arePalindromes(notPalindromes)

