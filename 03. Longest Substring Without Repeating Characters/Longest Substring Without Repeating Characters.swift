//
//  Longest Substring Without Repeating Characters.swift
//  
//
//  Created by ShaoHuan Tang on 2023/2/14.
//

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
