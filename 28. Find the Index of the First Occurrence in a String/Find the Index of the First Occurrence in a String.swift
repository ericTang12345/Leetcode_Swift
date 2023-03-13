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
        
        var hPtr = 0
        var nPtr = 0
        let hArray = Array(haystack)
        let nArray = Array(needle)
        var isOccur = false // 搜尋到第一個字時為 true
        var occurIndex = -1 // 搜尋到第一個字時的 index
        
        while nPtr != nArray.count, hPtr != hArray.count {
            // haystack 中如果已經檢查過的字段已經小於 needle 的字段量，即可判斷失敗
            if hArray.count - hPtr < nArray.count - nPtr {
                occurIndex = -1
                break
            }
            
            if hArray[hPtr] == nArray[nPtr] {
                if isOccur == false {
                    // 修改為已搜尋到字串並記錄位置
                    isOccur = true
                    occurIndex = hPtr
                }
                hPtr += 1
                nPtr += 1
            } else {
                if isOccur {
                    // 將 haystack 的指標回到前一個紀錄搜尋到字串的位置
                    hPtr = occurIndex
                    // 字串檢查到某一個字時不相同，將參數重置
                    nPtr = 0
                    isOccur = false
                    occurIndex = -1
                }
                hPtr += 1
            }
            
        }
        return occurIndex
    }
}

let solution = Solution()
solution.strStr("mississippi", "issip")
solution.strStr("mississippi", "issipi")
