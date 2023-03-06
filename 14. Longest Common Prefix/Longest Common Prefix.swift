//
//  Longest Common Prefix.swift
//  
//
//  Created by ShaoHuan Tang on 2023/3/6.
//

import Foundation

class Solution {
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty {
            return ""
        }
        // 將最短的字串擺到第一位
        var sortedStrs = strs.sorted(by: {$0.count < $1.count})
        var prefix = sortedStrs[0]
        for i in 1 ..< sortedStrs.count {
            let str = sortedStrs[i]
            // 檢查 str 前輟是否包含 prefix
            while !str.hasPrefix(prefix) {
                // 刪除最後一個 char
                prefix.removeLast()
                if prefix.isEmpty {
                    return ""
                }
            }
        }
        return prefix
    }
}

let solution = Solution()
solution.longestCommonPrefix(["flower","flow","flight"])
solution.longestCommonPrefix(["dog","racecar","car"])
solution.longestCommonPrefix(["flow", "reflower","flight"])
