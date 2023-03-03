//
//  6. Zigzag Conversion.swift
//  
//
//  Created by ShaoHuan Tang on 2023/3/2.
//

import Foundation

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        // 例外處理
        if numRows == 1 {
            return s
        }
        // 建立一個與 numRows 相同的空白文字陣列
        var rows = [String](repeating: "", count: numRows)
        // 字串要加入第幾行的索引
        var index = 0
        // 方向 1 = 往上, -1 = 往下
        var direction = -1
        // 遍歷每個字串
        for char in s {
            rows[index].append(char)
            // 等於 0 (代表第一個字) || numRows - 1 等於到底
            if index == 0 || index == numRows - 1 {
                // 改變方向
                direction = -direction
            }
            // 調整下一個字串要加入的行別
            index += direction
        }
        return rows.joined()
    }
}

let solution = Solution()
solution.convert("PAYPALISHIRING", 3)
"""
0   0   0   0   index 0
1 1 1 1 1 1 1   index 1
2   2   2       index 2
"""
solution.convert("PAYPALISHIRING", 4)
"""
0    0    0   0 index 0
1  1 1  1 1  1  index 1
2 2  2 2  2 2   index 2
3    3    3     index 3
"""
