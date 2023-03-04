//
//  Palindrome Number.swift
//  
//
//  Created by ShaoHuan Tang on 2023/3/3.
//

import Foundation

class Solution {
    // Runtime: 12ms 99.93%
    // Memory: 13.7MB 98.93%
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        
        var num = x
        var reverse = 0
        while num != 0 {
            let remainder = num % 10
            reverse = reverse * 10 + remainder
            num /= 10
        }
        return x == reverse
    }
    
    // Runtime: 61ms 22.19%
    // Memory: 14.4MB 23.54%
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
             return false
         }
         let numStr = String(x)
         let reversedNumStr = String(numStr.reversed())
         return numStr == reversedNumStr
    }
}

let solution = Solution()
solution.isPalindrome(121)
solution.isPalindrome(10)
