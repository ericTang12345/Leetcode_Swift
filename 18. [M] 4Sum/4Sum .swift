//
//  4Sum .swift
//  
//
//  Created by Eric Tang on 2023/11/21.
//
/**
 Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:

 0 <= a, b, c, d < n
 a, b, c, and d are distinct.
 nums[a] + nums[b] + nums[c] + nums[d] == target
 You may return the answer in any order.

 Example 1:
 Input: nums = [1,0,-1,0,-2,2], target = 0
 Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
 
 Example 2:
 Input: nums = [2,2,2,2,2], target = 8
 Output: [[2,2,2,2]]
  
 Constraints:
 1 <= nums.length <= 200
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 
 Reference:
 https://www.youtube.com/watch?v=X4wlKGja0Uc
 */
import Foundation

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        if nums.count < 4 {
            return []
        }
        var result = [[Int]]()
        var sortedNums = nums.sorted()
        for i in 0 ..< (sortedNums.count - 3) {
            if i > 0 && sortedNums[i] == sortedNums[i - 1] {
                continue
            }
            for j in i+1 ..< (sortedNums.count - 2) {
                if j > i+1 && sortedNums[j] == sortedNums[j - 1] {
                    continue
                }
                var left = j + 1
                var right = sortedNums.count - 1
                
                while left < right {
                    var currentSum = sortedNums[i] + sortedNums[j] + sortedNums[left] + sortedNums[right]
                    if currentSum == target {
                        result.append([sortedNums[i], sortedNums[j], sortedNums[left], sortedNums[right]])
                        while left < right && sortedNums[left] == sortedNums[left + 1] {
                            left += 1
                        }
                        while left < right && sortedNums[right] == sortedNums[right - 1] {
                            right -= 1
                        }
                        left += 1
                        right -= 1
                    } else if currentSum < target {
                        left += 1
                    } else {
                        right -= 1
                    }
                }
            }
        }
        return result
    }
}

let solution = Solution()
solution.fourSum([1,0,-1,0,-2,2], 0)
solution.fourSum([2,2,2,2,2], 8)
solution.fourSum([-2,-1,-1,1,1,2,2], 0)
solution.fourSum([4,-9,-2,-2,-7,9,9,5,10,-10,4,5,2,-4,-2,4,-9,5], -13)
