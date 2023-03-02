//
//  Reverse_Interger.swift
//  
//
//  Created by ShaoHuan Tang on 2023/3/2.
//

import Foundation

func reverse(_ x: Int) -> Int {
    // 因需要操作，使用變數
    var num = x
    // 反轉數字
    var reversed = 0
    while num != 0 {
        let remainder = num % 10 // 透過餘數取得最低位數字
        reversed = reversed * 10 + remainder // 將最低位數字加入反轉數字的最高位
        num /= 10 // 刪除最低位數字
    }
    // 應題目 Int32 條件
    if reversed > Int32.max || reversed < Int32.min {
        return 0
    } else {
        return reversed
    }
}

func reverse(_ x: Int) -> Int {
    // 是否為負數
    let isNegative = x < 0
    // 絕對值
    let absNumStr = String(abs(x))
    // 字串反轉
    var reversedString = String(absNumStr.reversed())
    // 負數處理
    if isNegative {
        reversedString = "-" + reversedString
    }
    // 轉回 Int
    let reversedNum = Int(reversedString) ?? 0
    // 應題目 Int32 條件
    if reversedNum > Int32.max || reversedNum < Int32.min {
        return 0
    } else {
        return reversedNum
    }
}

let solution = Solution()
solution.reverse(123)
solution.reverse(-123)
solution.reverse(120)
solution.reverse(1534236469)
