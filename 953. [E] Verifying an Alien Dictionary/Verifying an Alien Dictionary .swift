//
//  953. Verifying an Alien Dictionary .swift
//  
//
//  Created by Eric Tang on 2023/12/5.
//
/**
 In an alien language, surprisingly, they also use English lowercase letters, but possibly in a different order. The order of the alphabet is some permutation of lowercase letters.

 Given a sequence of words written in the alien language, and the order of the alphabet, return true if and only if the given words are sorted lexicographically in this alien language.

 Example 1:
 Input: words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
 Output: true
 Explanation: As 'h' comes before 'l' in this language, then the sequence is sorted.
 
 Example 2:
 Input: words = ["word","world","row"], order = "worldabcefghijkmnpqstuvxyz"
 Output: false
 Explanation: As 'd' comes after 'l' in this language, then words[0] > words[1], hence the sequence is unsorted.
 
 Example 3:
 Input: words = ["apple","app"], order = "abcdefghijklmnopqrstuvwxyz"
 Output: false
 Explanation: The first three characters "app" match, and the second string is shorter (in size.) According to lexicographical rules "apple" > "app", because 'l' > '∅', where '∅' is defined as the blank character which is less than any other character (More info).
  
 Constraints:
 1 <= words.length <= 100
 1 <= words[i].length <= 20
 order.length == 26
 All characters in words[i] and order are English lowercase letters.
 */

import Foundation

class Solution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        if words.isEmpty {
            return false
        }
        let orderDict = Dictionary(uniqueKeysWithValues: order.enumerated().map({ ($1, $0) }))
        for i in 0 ..< words.count-1 {
            let currWord = Array(words[i])
            let nextWord = Array(words[i+1])
            var j = 0
            
            while j < min(currWord.count, nextWord.count) {
                let currChar = currWord[j]
                let nextChar = nextWord[j]
                
                if currChar == nextChar {
                    j += 1
                    continue
                }
                
                if orderDict[currChar]! > orderDict[nextChar]! {
                    return false
                } else {
                    break
                }
            }
            
            if j == nextWord.count && currWord.count > nextWord.count {
                return false
            }
        }
        
        return true
    }
}

let solution = Solution()
var words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
solution.isAlienSorted(words, order)

words = ["word","world","row"]
order = "worldabcefghijkmnpqstuvxyz"
solution.isAlienSorted(words, order)

words = ["apple","app"]
order = "abcdefghijklmnopqrstuvwxyz"
solution.isAlienSorted(words, order)
