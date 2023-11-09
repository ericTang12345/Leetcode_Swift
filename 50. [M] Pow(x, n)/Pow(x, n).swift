//
//  Pow(x, n).swift
//  
//
//  Created by Eric Tang on 2023/8/7.
//
/**
 Implement pow(x, n), which calculates x raised to the power n (i.e., xn).

 Example 1:
 Input: x = 2.00000, n = 10
 Output: 1024.00000
 
 Example 2:
 Input: x = 2.10000, n = 3
 Output: 9.26100
 
 Example 3:
 Input: x = 2.00000, n = -2
 Output: 0.25000
 Explanation: 2-2 = 1/22 = 1/4 = 0.25

 Constraints:
 -100.0 < x < 100.0
 -231 <= n <= 231-1
 n is an integer.
 Either x is not zero or n > 0.
 -104 <= xn <= 104
 */

import Foundation

class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if x == 1 || n == 0 {
            return 1
        }
        
        var result = 1.0
        var exponent = n < 0 ? abs(n) : n
        var base = x
        
        while exponent != 0 {
            if exponent % 2 == 1 {
                result = result * base
            }
            base = base * base
            exponent = exponent / 2
        }
        
        return n < 0 ? 1/result : result
    }
}

let solution = Solution()
solution.myPow(2.00000, 10)
solution.myPow(2.10000, 3)
solution.myPow(2.00000, -2)
solution.myPow(1.1, 3)


