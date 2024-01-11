//
//  Swap Nodes in Pairs .swift
//  
//
//  Created by Eric Tang on 2023/12/1.
//
/**
 Given a linked list, swap every two adjacent nodes and return its head. You must solve the problem without modifying the values in the list's nodes (i.e., only nodes themselves may be changed.)

 Example 1:
 Input: head = [1,2,3,4]
 Output: [2,1,4,3]
 
 Example 2:
 Input: head = []
 Output: []
 
 Example 3:
 Input: head = [1]
 Output: [1]
  
 Constraints:
 The number of nodes in the list is in the range [0, 100].
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
        guard let head = head else {
            return nil
        }
        
        var needSwap: Bool = true
        var currNode: ListNode? = head
        
        while currNode?.next != nil || currNode?.val != nil {
            if needSwap,
               let nextVal = currNode?.next?.val {
                currNode?.next?.val = currNode!.val
                currNode?.val = nextVal
            }
            currNode = currNode?.next
            needSwap.toggle()
            
        }
        
        return head
    }
}

let solution = Solution()
solution.swapPairs(.createBy(array: [1,2,3,4]))?.show()
solution.swapPairs(.createBy(array: []))
solution.swapPairs(.createBy(array: [1]))

