//
//  Median of Two Sorted Arrays.swift
//  
//
//  Created by ShaoHuan Tang on 2023/2/14.
//

import Foundation

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        if nums1.isEmpty, nums2.isEmpty {
            return 0.0
        }
        
        var mergedArray = nums1 + nums2
        mergedArray.sort()
        
        let medianIndex = mergedArray.count / 2
        
        if mergedArray.count % 2 == 0 {
            let firstDouble = mergedArray[medianIndex]
            let secondDouble = mergedArray[medianIndex - 1]
            return Double(firstDouble + secondDouble) / 2
        } else {
            return Double(mergedArray[medianIndex])
        }
    }
}

let solution = Solution()
solution.findMedianSortedArrays([], [])
solution.findMedianSortedArrays([1], [])
solution.findMedianSortedArrays([], [2,3])
solution.findMedianSortedArrays([1,3], [2])
solution.findMedianSortedArrays([1,2], [3,4])
