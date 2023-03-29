//
//  Longest Valid Parentheses.swift
//  
//
//  Created by ShaoHuan Tang on 2023/3/30.
//

/**
 Given a string containing just the characters '(' and ')', return the length of the longest valid (well-formed) parentheses substring.
 
 Example 1:

 Input: s = "(()"
 Output: 2
 Explanation: The longest valid parentheses substring is "()".
 Example 2:

 Input: s = ")()())"
 Output: 4
 Explanation: The longest valid parentheses substring is "()()".
 Example 3:

 Input: s = ""
 Output: 0
  

 Constraints:

 0 <= s.length <= 3 * 104
 s[i] is '(', or ')'.
 */

class Solution {
    
    // Runtime 8 ms beats 40.68%, Memory 14.5 MB beats 37.29
    func longestValidParentheses(_ s: String) -> Int {
        var stack: [Int] = [-1]
        var maxLan = 0
        
        for (i, c) in s.enumerated() {
            if c == "(" {
                stack.append(i)
            } else {
                if stack.isEmpty {
                    stack.append(i)
                } else {
                    maxLan = max(maxLan, i - stack.last!)
                }
            }
        }
        return maxLan
    }
    
    // Runtime 12 ms beats 8,47%, Memory 14.3 MB beats 79.66
    func longestValidParentheses(_ s: String) -> Int {
        var maxLen = 0
        var left = 0
        var right = 0
        
        for c in s {
            if c == "(" {
                left += 1
            } else {
                right += 1
            }
            if left == right {
                maxLen = max(maxLen, left + right)
            } else if left < right {
                left = 0
                right = 0
            }
        }
        
        left = 0
        right = 0
        
        for c in s.reversed() {
            if c == ")" {
                right += 1
            } else {
                left += 1
            }
            if left == right {
                maxLen = max(maxLen, left + right)
            } else if left > right {
                left = 0
                right = 0
            }
        }
        return maxLen
        
    }
}
