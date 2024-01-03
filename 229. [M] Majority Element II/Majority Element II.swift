
//
//  Majority Element II.swift
//
//
//  Created by Eric Tang on 2023/12/23.
//
/**
Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times.
 

Example 1:
Input: nums = [3,2,3]
Output: [3]

Example 2:
Input: nums = [1]
Output: [1]

Example 3:
Input: nums = [1,2]
Output: [1,2]
 
Constraints:
1 <= nums.length <= 5 * 104
-109 <= nums[i] <= 109
 
Follow up: Could you solve the problem in linear time and in O(1) space?
*/

import Foundation

class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        var appearTimes = nums.count / 3
        var result = [Int]()
        var dict: [Int: Int] = [:]
        for num in nums where result.contains(num) == false {
            dict[num] = (dict[num] ?? 0) + 1
            if dict[num] ?? 0 > appearTimes {
                result.append(num)
            }
        }
        return result
    }
}

let solution = Solution()
solution.majorityElement([3,2,3,3,2,2,1,1])
solution.majorityElement([1])
solution.majorityElement([1,2])
