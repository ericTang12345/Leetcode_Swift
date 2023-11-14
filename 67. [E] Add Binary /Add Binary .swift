//
//  Add Binary .swift
//  
//
//  Created by Eric Tang on 2023/11/14.
//
/**
 Given two binary strings a and b, return their sum as a binary string.

 Example 1:
 Input: a = "11", b = "1"
 Output: "100"
 Example 2:

 Input: a = "1010", b = "1011"
 Output: "10101"
  
 Constraints:
 1 <= a.length, b.length <= 104
 a and b consist only of '0' or '1' characters.
 Each string does not contain leading zeros except for the zero itself.
 */

import Foundation

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var aStr: [Int] = a.map({ return Int(String($0)) ?? 0 })
        var bStr: [Int] = b.map({ return Int(String($0)) ?? 0 })
        if a.count > b.count {
            bStr.insert(contentsOf: Array(repeating: 0, count: a.count - b.count),
                        at: 0)
        } else {
            aStr.insert(contentsOf: Array(repeating: 0, count: b.count - a.count),
                        at: 0)
        }
        var result = ""
        var carry = 0
        for i in (0 ..< aStr.count).reversed() {
            let bitSum = aStr[i] + bStr[i] + carry
            if bitSum >= 2 {
                result = String(bitSum - 2) + result
                carry = 1
            } else {
                result = String(bitSum) + result
                carry = 0
            }
        }
        return carry != 0 ? ("1" + result) : result
    }
}

let solution = Solution()
solution.addBinary("11", "1")
solution.addBinary("1010", "1011")
