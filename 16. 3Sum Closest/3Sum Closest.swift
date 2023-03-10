//
//  3Sum Closest.swift
//  
//
//  Created by ShaoHuan Tang on 2023/3/9.
//

import Foundation

class Solution {
    
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let n = nums.count
        if n < 3 {
            return 0
        }
        
        var diff = Int.max // 三和與目標之差
        var closest = Int() // 最接近目標的三和
        let nums = nums.sorted()
        
        for i in 0 ..< n {
            if i > 0 && nums[i] == nums[i-1] {
                continue
            }
            var l = i + 1
            var r = n - 1
            while l < r {
                let sum = nums[i] + nums[l] + nums[r]
                if sum == target {
                    return target
                } else if sum > target {
                    if sum - target < diff {
                        diff = sum - target
                        closest = sum
                    }
                } else {
                    if target - sum < diff {
                        diff = target - sum
                        closest = sum
                    }
                }
                // 根據 sum 與 target 的大小，決定指針的移動
                sum < target ? (l += 1):(r -= 1)
            }
        }
        return closest
    }
}

let solution = Solution()
solution.threeSumClosest([-1, 2, 1, -4], 1)
solution.threeSumClosest([0, 0, 0], 1)
solution.threeSumClosest([0,1,2], 0)
