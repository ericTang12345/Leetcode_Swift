//
//  Letter Combinations of a Phone Number.swift
//  
//
//  Created by ShaoHuan Tang on 2023/3/11.
//

import Foundation

class Solution {
    
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty {
            return []
        }
        let dict: [Character: [String]] = [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"]
        ]
        var result: [String] = [""] // 應對只有一位 digits 時
        
        for digit in digits {
            guard let letters = dict[digit] else {
                continue
            }
            var temp: [String] = []
            for letter in letters {
                for value in result {
                    temp.append(value + letter)
                }
            }
            result = temp
        }
        return result
    }
}

let solution = Solution()
solution.letterCombinations("23")
solution.letterCombinations("2345")
solution.letterCombinations("0")
