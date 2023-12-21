
//
//  Max Consecutive Ones.swift
//
//
//  Created by Eric Tang on 2023/12/11.
//
/**
Given a binary array nums, return the maximum number of consecutive 1's in the array.
 

Example 1:
Input: nums = [1,1,0,1,1,1]
Output: 3
Explanation: The first two digits or the last three digits are consecutive 1s. The maximum number of consecutive 1s is 3.

Example 2:
Input: nums = [1,0,1,1,0,1]
Output: 2
 
Constraints:
1 <= nums.length <= 105
nums[i] is either 0 or 1.
*/

import Foundation

class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        return nums.split(separator: 0).max(by: { $0.count < $1.count })?.count ?? 0
    }
}


let solution = Solution()
var nums = [1,1,0,1,1,1]
solution.findMaxConsecutiveOnes(nums)
nums = [1,0,1,1,0,1]
solution.findMaxConsecutiveOnes(nums)
