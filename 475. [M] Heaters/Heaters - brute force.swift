
//
//  Heaters.swift
//
//
//  Created by Eric Tang on 2023/12/13.
//
/**
Winter is coming! During the contest, your first job is to design a standard heater with a fixed warm radius to warm all the houses.
Every house can be warmed, as long as the house is within the heater's warm radius range. 
Given the positions of houses and heaters on a horizontal line, return the minimum radius standard of heaters so that those heaters could cover all houses.
Notice that all the heaters follow your radius standard, and the warm radius will the same.
 

Example 1:
Input: houses = [1,2,3], heaters = [2]
Output: 1
Explanation: The only heater was placed in the position 2, and if we use the radius 1 standard, then all the houses can be warmed.

Example 2:
Input: houses = [1,2,3,4], heaters = [1,4]
Output: 1
Explanation: The two heaters were placed at positions 1 and 4. We need to use a radius 1 standard, then all the houses can be warmed.

Example 3:
Input: houses = [1,5], heaters = [2]
Output: 3
 
Constraints:
1 <= houses.length, heaters.length <= 3 * 104
1 <= houses[i], heaters[i] <= 109
*/

import Foundation

class Solution {
    func findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {
        var maxDist = Int()
        for house in houses {
            var minDist = Int.max
            for heater in heaters {
                minDist = min(minDist, abs(house - heater))
            }
            maxDist = max(maxDist, minDist)
        }
        return maxDist
    }
}

let solution = Solution()

var houses = [1,2,3,5,15], heaters = [2,30]
solution.findRadius(houses, heaters)

houses = [1,2,3]
heaters = [2]
solution.findRadius(houses, heaters)

houses = [1,2,3,4]
heaters = [1,4]
solution.findRadius(houses, heaters)

houses = [1,5]
heaters = [2]
solution.findRadius(houses, heaters)

