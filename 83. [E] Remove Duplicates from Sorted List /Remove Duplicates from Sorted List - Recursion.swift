//
//  Remove Duplicates from Sorted List - Recursion.swift
//  
//
//  Created by Eric Tang on 2023/11/17.
//
/**
 Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.
 
 Example 1:
 Input: head = [1,1,2]
 Output: [1,2]
 
 Example 2:
 Input: head = [1,1,2,3,3]
 Output: [1,2,3]
 
 Constraints:
 The number of nodes in the list is in the range [0, 300].
 -100 <= Node.val <= 100
 The list is guaranteed to be sorted in ascending order.
 */

import Foundation

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head?.val != head?.next?.val {
            deleteDuplicates(head?.next)
        } else {
            if let willMoveHead = head?.next?.next {
                head?.next = willMoveHead
                deleteDuplicates(head)
            } else {
                head?.next = nil
            }
        }
        return head
    }
}

let solution = Solution()
solution.deleteDuplicates(.init(1, .init(1, .init(2))))
solution.deleteDuplicates(.init(1, .init(1, .init(2, .init(3, .init(3))))))
solution.deleteDuplicates(.init(1, .init(1, .init(1))))

