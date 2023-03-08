//
//  15. 3Sum.swift
//  
//
//  Created by ShaoHuan Tang on 2023/3/9.
//

import Foundation

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let n = nums.count
        var ans = [[Int]]()
        var nums = nums.sorted()
        print(nums)
        for i in 0 ..< n {
            // 跳過重複的元素，避免重複計算
            if i > 0 && nums[i] == nums[i-1] {
                continue
            }
            var l = i + 1
            var r = n - 1
            while l < r {
                let sum = nums[i] + nums[l] + nums[r]
                print("指針: i: \(i), l: \(l), r: \(r)")
                print("結果: \(nums[i]) + \(nums[l]) + \(nums[r]) = \(sum)")
                if sum == 0 {
                    ans.append([nums[i], nums[l], nums[r]])
                    // 跳過重複的元素，避免重複計算
                    while l < r && nums[l] == nums[l+1] {
                        l += 1
                    }
                    while l < r && nums[r] == nums[r-1] {
                        r -= 1
                    }
                    l += 1
                    r -= 1
                    print("ans: \(ans)")
                } else if sum < 0 {
                    l += 1
                } else {
                    r -= 1
                }
                print("")
            }
        }
        return ans
    }
}

let solution = Solution()
solution.threeSum([-1,0,1,2,-1,-4])
solution.threeSum([0,1,1])
solution.threeSum([0,0,0])
solution.threeSum([0,0,0,0])
solution.threeSum([-2,0,1,1,2])
solution.threeSum([-2,10,-14,11,5,-4,2,0,-10,-10,5,7,-11,10,-2,-5,2,12,-5,14,-11,-15,-5,12,0,13,8,7,10,6,-9,-15,1,14,11,-9,-13,-10,6,-8,-5,-11,6,-9,14,11,-7,-6,8,3,-7,5,-5,3,2,10,-6,-12,3,11,1,1,12,10,-8,0,8,-5,6,-8,-6,8,-12,-14,7,9,12,-15,-12,-2,-4,-4,-12,6,7,-3,-6,-14,-8,4,4,9,-10,-7,-4,-3,1,11,-1,-8,-12,9,7,-9,10,-1,-14,-1,-8,11,12,-5,-7])
