//
//  Length of Last Word.swift
//  
//
//  Created by Eric Tang on 2023/11/9.
//

/**
 Given a string s consisting of words and spaces, return the length of the last word in the string.
 
 A word is a maximal
 substring
  consisting of non-space characters only.

 Example 1:
 Input: s = "Hello World"
 Output: 5
 Explanation: The last word is "World" with length 5.
 Example 2:

 Input: s = "   fly me   to   the moon  "
 Output: 4
 Explanation: The last word is "moon" with length 4.
 Example 3:

 Input: s = "luffy is still joyboy"
 Output: 6
 Explanation: The last word is "joyboy" with length 6.
  
 Constraints:
 1 <= s.length <= 104
 s consists of only English letters and spaces ' '.
 There will be at least one word in s.
 */

import Foundation

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var sArray = Array(s)
        sArray.reverse()
        var count = 0
        for i in (0 ... s.count - 1) {
            if String(sArray[i]) == " " && count == .zero {
                continue
            } else if String(sArray[i]) == " " && count != .zero {
                break
            } else {
                count += 1
            }
        }
        return count
    }
}

let solution = Solution()
solution.lengthOfLastWord("Hello World")
solution.lengthOfLastWord("   fly me   to   the moon  ")
solution.lengthOfLastWord("luffy is still joyboy")
