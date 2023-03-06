//
//  Two Sum.swift
//  
//
//  Created by ShaoHuan Tang on 2023/2/14.
//

import Foundation

class Solution {
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
        var map = [Int: Int]()
        
        for (index, num) in nums.enumerated() {
            let diff = target - num
            if let findValue = map[diff] {
                return [index, findValue]
            }
            map[num] = index
        }
        return []
    }
}
