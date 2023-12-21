//
//  Integer to Roman.swift
//  
//
//  Created by ShaoHuan Tang on 2023/3/7.
//

import Foundation

class Solution {
    
    func intToRoman(_ num: Int) -> String {
        let romanChars = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        let romanVals = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        var currentNum = num
        var str = ""
        var index = 0
        
        while currentNum != 0 {
            if currentNum >= romanVals[index] {
                print("if, v:\(romanVals[index])")
                str += romanChars[index]
                currentNum -= romanVals[index]
            } else {
                index += 1
            }
        }
        
        return str
    }
}

let solution = Solution()
solution.intToRoman(4000)
solution.intToRoman(3)
solution.intToRoman(58)
solution.intToRoman(1994)
