//
//  Merge k Sorted Lists .swift
//  
//
//  Created by Eric Tang on 2023/12/1.
//
/**
 You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.
 Merge all the linked-lists into one sorted linked-list and return it.

 Example 1:
 Input: lists = [[1,4,5],[1,3,4],[2,6]]
 Output: [1,1,2,3,4,4,5,6]
 Explanation: The linked-lists are:
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 merging them into one sorted list:
 1->1->2->3->4->4->5->6
 
 Example 2:
 Input: lists = []
 Output: []
 
 Example 3:
 Input: lists = [[]]
 Output: []
  
 Constraints:
 k == lists.length
 0 <= k <= 104
 0 <= lists[i].length <= 500
 -104 <= lists[i][j] <= 104
 lists[i] is sorted in ascending order.
 The sum of lists[i].length will not exceed 104.
 */

import Foundation

class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

extension ListNode {
    func show() {
        var vals: [Int] = []
        var currNode: ListNode? = self
        while currNode?.next != nil || currNode?.val != nil {
            if let val = currNode?.val {
                vals.append(val)
            }
            currNode = currNode?.next
        }
        if vals.isEmpty {
            print("[]")
        } else {
            print(vals)
        }
    }
    
    static func createBy(array: [Int]) -> ListNode? {
        guard !array.isEmpty else {
            return nil
        }
        var head: ListNode? = ListNode(array[0])
        var current = head
        for i in 1..<array.count {
            let newNode = ListNode(array[i])
            current?.next = newNode
            current = newNode
        }
        return head
    }
}


class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.isEmpty {
            return nil
        }
        var values = [Int]()
        for list in lists {
            var currList: ListNode? = list
            while currList?.next != nil || currList?.val != nil {
                if let val = currList?.val {
                    values.append(val)
                }
                currList = currList?.next
            }
        }
        if values.isEmpty {
            return nil
        }
        values.sort()
        var result = ListNode(values[0])
        var curr: ListNode? = result
        for i in 1 ..< values.count {
            curr?.next = ListNode(values[i])
            curr = curr?.next
        }
        return result
    }
}

let solution = Solution()
solution.mergeKLists([.createBy(array: [1,4,5]),
                      .createBy(array: [1,3,5]),
                      .createBy(array: [2,6])])?.show()
solution.mergeKLists([.createBy(array: [])])

let emptylistNode: ListNode? = nil
let lists: [ListNode?] = [emptylistNode]
solution.mergeKLists(lists)
