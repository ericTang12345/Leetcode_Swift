//
//  Remove Nth Node From End of List .swift
//  
//
//  Created by Eric Tang on 2023/11/22.
//
/**
 Given the head of a linked list, remove the nth node from the end of the list and return its head.
 
 Example 1:
 Input: head = [1,2,3,4,5], n = 2
 Output: [1,2,3,5]
 
 Example 2:
 Input: head = [1], n = 1
 Output: []
 
 Example 3:
 Input: head = [1,2], n = 1
 Output: [1]
  
 Constraints:
 The number of nodes in the list is sz.
 1 <= sz <= 30
 0 <= Node.val <= 100
 1 <= n <= sz
 
 Reference:
 https://www.youtube.com/watch?v=WpTFFV9LsbM
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode()
        dummy.next = head
        
        var totalNum = 0
        var currNode: ListNode? = dummy
        while currNode?.next != nil {
            totalNum += 1
            currNode = currNode?.next
        }
        
        currNode = dummy
        for _ in 0 ..< totalNum - n {
            currNode = currNode?.next
        }
        currNode?.next = currNode?.next?.next
        return dummy.next
    }
}

func listNodeTransformArray(listNode: ListNode?) -> [Int] {
    var vals: [Int] = []
    var currNode: ListNode? = listNode
    while currNode?.next != nil {
        if let val = currNode?.val {
            vals.append(val)
        }
        currNode = currNode?.next
    }
    if let val = currNode?.val {
        vals.append(val)
    }
    return vals
}

let solution = Solution()
let result = solution.removeNthFromEnd(.init(1, .init(2, .init(3, .init(4, .init(5))))), 2)
let result = solution.removeNthFromEnd(.init(1), 1)
let result = solution.removeNthFromEnd(.init(1, .init(2)), 1)

print(listNodeTransformArray(listNode: result))
