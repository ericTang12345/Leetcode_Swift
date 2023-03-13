//
//  Find the Index of the First Occurrence in a String.swift
//  
//
//  Created by ShaoHuan Tang on 2023/3/13.
//

import Foundation

class Solution {
    
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.count > haystack.count {
            return -1
        }
        
        var hIndex = 0
        var nIndex = 0
        let hArray = Array(haystack)
        let nArray = Array(needle)
        var isOccur = false
        var occurIndex = -1
        
        while nIndex != nArray.count, hIndex != hArray.count {
            if hArray.count - hIndex < nArray.count - nIndex {
                occurIndex = -1
                break
            }
            
            if hArray[hIndex] == nArray[nIndex] {
                if isOccur == false {
                    isOccur = true
                    occurIndex = hIndex
                }
                hIndex += 1
                nIndex += 1
            } else {
                if isOccur {
                    nIndex = 0
                    isOccur = false
                    hIndex = occurIndex
                    occurIndex = -1
                }
                hIndex += 1
            }
        }
        
        return occurIndex
    }
}

let solution = Solution()
solution.strStr("mississippi", "issip")
solution.strStr("mississippi", "issipi")
