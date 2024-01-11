
//
//  Swap Nodes in Pairs.swift
//
//
//  Created by Eric Tang on 2024/01/11.
//
/**
Given a linked list, swap every two adjacent nodes and return its head. You must solve the problem without modifying the values in the list's nodes (i.e., only nodes themselves may be changed.)
 

Example 1:
￼
Input: head = [1,2,3,4]
Output: [2,1,4,3]

Example 2:
Input: head = []
Output: []

Example 3:
Input: head = [1]
Output: [1]
 
Constraints:
The number of nodes in the list is in the range [0, 100].
0 <= Node.val <= 100
*/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var curr: ListNode? = head
        var dumy = ListNode(-1, nil)
        var tail: ListNode? = dumy
        while curr != nil || curr?.next != nil {
            if curr?.next == nil {
                tail?.next = curr
                break
            }
        
            var temp = curr!.next!
            var left = curr?.next?.next
            curr?.next = nil
            temp.next = curr
            tail?.next = temp
            tail = temp.next
            curr = left

        }
        return dumy.next
    }
}

let solution = Solution()
var head: ListNode? = ListNode(1, .init(2, .init(3, .init(4))))
solution.swapPairs(head)

solution.swapPairs(nil)

head = ListNode(1, nil)
solution.swapPairs(head)

head = ListNode(1, .init(2, .init(3, nil)))
solution.swapPairs(head)
