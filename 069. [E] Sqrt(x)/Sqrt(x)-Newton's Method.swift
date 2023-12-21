//
//  Sqrt(x)-Newton's Method.swift
//  
//
//  Created by Eric Tang on 2023/11/14.
//
/**
 Given a non-negative integer x, return the square root of x rounded down to the nearest integer. The returned integer should be non-negative as well.

 You must not use any built-in exponent function or operator.

 For example, do not use pow(x, 0.5) in c++ or x ** 0.5 in python.
  
 Example 1:
 Input: x = 4
 Output: 2
 Explanation: The square root of 4 is 2, so we return 2.
 Example 2:

 Input: x = 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since we round it down to the nearest integer, 2 is returned.
  
 Constraints:
 0 <= x <= 231 - 1
 */

import Foundation

class Solution {
    func mySqrt(_ x: Int) -> Int {
        if x == 0 {
            return 0
        }
        var guess: Double = Double(x)
        var newGuess: Double = (guess + Double(x) / guess) / 2.0
        
        while Int(newGuess) != Int(guess) {
            guess = newGuess
            newGuess = (guess + Double(x) / guess) / 2.0
        }
        return Int(newGuess)
    }
}

let solution = Solution()
solution.mySqrt(4)
solution.mySqrt(8)
