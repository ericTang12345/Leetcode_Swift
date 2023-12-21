//
//  Longest Substring Without Repeating Characters.swift
//  
//
//  Created by ShaoHuan Tang on 2023/2/14.
//
/**
 Given a string s, find the length of the longest substring without repeating characters.

 Example 1:

 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:

 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
  
 Constraints:

 0 <= s.length <= 5 * 104
 s consists of English letters, digits, symbols and spaces.
 */

import Foundation

class Solution {

    func lengthOfLongestSubstring(_ s: String) -> Int {
        var count = 0
        var characters : [Character] = []

        for c in s {
            if let index = characters.firstIndex(of: c) {
                characters.removeFirst(index + 1)
            }
            characters.append(c)
            count = max(count , characters.count)
        }
        return count
    }
}
