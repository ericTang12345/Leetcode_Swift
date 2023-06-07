//
//  Vaild Parentheses.swift
//  
//
//  Created by Eric Tang on 2023/6/7.
//

import Foundation

/**
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Every close bracket has a corresponding open bracket of the same type.
  
 Example 1:
 Input: s = "()"
 Output: true
 
 Example 2:
 Input: s = "()[]{}"
 Output: true
 
 Example 3:
 Input: s = "(]"
 Output: false
  
 Constraints:
 
 1 <= s.length <= 104
 s consists of parentheses only '()[]{}'.
 */

class Solution {
    func isValid(_ s: String) -> Bool {
        if s.count % 2 != 0 {
            return false
        }
    
        var dict: [Character: Character] = ["(" : ")",
                                            "[" : "]",
                                            "{" : "}"]
        var stack = [Character]()
        
        for char in s {
            if dict.keys.contains(char) {
                stack.append(char)
            } else {
                guard !stack.isEmpty else {
                    return false
                }
                let last = stack.removeLast()
                if dict[last] != char {
                    return false
                }
            }
        }

        return stack.isEmpty
    }
}

Solution().isValid("()")
Solution().isValid("()[]{}")
Solution().isValid("(]")
Solution().isValid("{[]}")
Solution().isValid("){")
