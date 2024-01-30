////  Remove Duplicates from Sorted List.swift//////  Created by Eric Tang on 2024/01/30.///**Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well. Example 1:￼Input: head = [1,1,2]Output: [1,2]Example 2:￼Input: head = [1,1,2,3,3]Output: [1,2,3] Constraints:The number of nodes in the list is in the range [0, 300].-100 <= Node.val <= 100The list is guaranteed to be sorted in ascending order.*/import Foundationpublic class ListNode {    public var val: Int    public var next: ListNode?    public init() { self.val = 0; self.next = nil; }    public init(_ val: Int) { self.val = val; self.next = nil; }    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }}class Solution {    func deleteDuplicates(_ head: ListNode?) -> ListNode? {        var curr = head        while curr != nil || curr?.next != nil {            if curr?.val == curr?.next?.val {                curr?.next = curr?.next?.next            } else {                curr = curr?.next            }        }        dump(head)        return head    }}let solution = Solution()solution.deleteDuplicates(.init(1, .init(1, .init(2, nil))))solution.deleteDuplicates(.init(1, .init(1, .init(2, .init(3, .init(3, nil))))))