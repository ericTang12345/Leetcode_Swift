//
//  Next Permutation .swift
//  
//
//  Created by Eric Tang on 2023/12/2.
//
/**
 A permutation of an array of integers is an arrangement of its members into a sequence or linear order.

 For example, for arr = [1,2,3], the following are all the permutations of arr: [1,2,3], [1,3,2], [2, 1, 3], [2, 3, 1], [3,1,2], [3,2,1].
 The next permutation of an array of integers is the next lexicographically greater permutation of its integer. More formally, if all the permutations of the array are sorted in one container according to their lexicographical order, then the next permutation of that array is the permutation that follows it in the sorted container. If such arrangement is not possible, the array must be rearranged as the lowest possible order (i.e., sorted in ascending order).

 For example, the next permutation of arr = [1,2,3] is [1,3,2].
 Similarly, the next permutation of arr = [2,3,1] is [3,1,2].
 While the next permutation of arr = [3,2,1] is [1,2,3] because [3,2,1] does not have a lexicographical larger rearrangement.
 Given an array of integers nums, find the next permutation of nums.

 The replacement must be in place and use only constant extra memory.

 Example 1:
 Input: nums = [1,2,3]
 Output: [1,3,2]
 
 Example 2:
 Input: nums = [3,2,1]
 Output: [1,2,3]

 Example 3:
 Input: nums = [1,1,5]
 Output: [1,5,1]
  
 Constraints:
 1 <= nums.length <= 100
 0 <= nums[i] <= 100
 
 Note:
 Q: 1 2 7 4 3 1
 1. 從右到左，找出開始降序的數字位置，稱為 i
    => 1 "2"  7  4  3  1, i = 1
 2. 找出後，再從右到左，找出第一個比 i 還大的數字位置，稱為 j
    => 1 2 7 4 "3" 1, j = 4
 3. i 的數字與 j 數字交換
    => 1 2 7 4 3 1 -> 1 3 7 4 2 1
 4. 再將 i 之前的數字整個顛倒
    => 1 3 7 4 2 1 -> 1 3 1 2 4 7
 
 如果 nums 整個陣列為降序，直接顛倒數字即可
    => 3 2 1 -> 1 2 3
 
 Reference:
 https://www.cnblogs.com/grandyang/p/4428207.html
 */

import Foundation

class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        var i: Int?
        // step 1
        for n in stride(from: nums.count, to: 1, by: -1) {
            if nums[n-2] < nums[n-1] {
                i = n-2
                break
            }
        }
        // if descending order, i = nil
        guard let i = i else {
            nums.reverse()
            return
        }
        // step 2
        for n in stride(from: nums.count, to: i, by: -1) {
            if nums[n-1] > nums[i] {
                let j = n-1
                // step 3
                nums.swapAt(i, j)
                break
            }
        }
        // step 4
        var r = nums.count - 1
        var l = i + 1
        while l < r {
            nums.swapAt(r, l)
            r -= 1
            l += 1
        }
    }
}

let solution = Solution()
var nums = [1,2,3,4]

nums = [1,2,7,4,3,1]
solution.nextPermutation(&nums)
print(nums)

nums = [3,2,1]
solution.nextPermutation(&nums)
print(nums)

nums = [1,1,5]
solution.nextPermutation(&nums)
print(nums)

nums = [1,3,2]
solution.nextPermutation(&nums)
print(nums)
