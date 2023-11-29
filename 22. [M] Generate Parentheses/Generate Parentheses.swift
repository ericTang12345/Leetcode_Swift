//
//  Generate Parentheses.swift
//  
//
//  Created by Eric Tang on 2023/11/29.
//
/**
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

 Example 1:
 Input: n = 3
 Output: ["((()))","(()())","(())()","()(())","()()()"]
 Example 2:
 Input: n = 1
 Output: ["()"]
  
 Constraints:
 1 <= n <= 8
 */

import Foundation

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result: [String] = []
        generate("", n, n, &result)
        return result
    }
    
    func generate(_ current: String,
                  _ right: Int,
                  _ left: Int,
                  _ result: inout [String]) {
        if left == 0 && right == 0 {
            result.append(current)
            return
        }
        if left != 0 {
            generate(current + "(", right, left-1, &result)
        }
        if right > left {
            generate(current + ")", right-1, left, &result)
        }
    }
}

let solution = Solution()
solution.generateParenthesis(3)
solution.generateParenthesis(1)
