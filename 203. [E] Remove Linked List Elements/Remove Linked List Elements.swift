////  Remove Linked List Elements.swift//////  Created by Eric Tang on 2024/01/17.///**Given the head of a linked list and an integer val, remove all the nodes of the linked list that has Node.val == val, and return the new head. Example 1:￼Input: head = [1,2,6,3,4,5,6], val = 6Output: [1,2,3,4,5]Example 2:Input: head = [], val = 1Output: []Example 3:Input: head = [7,7,7,7], val = 7Output: [] Constraints:The number of nodes in the list is in the range [0, 104].1 <= Node.val <= 500 <= val <= 50*/import Foundationpublic class ListNode {    public var val: Int    public var next: ListNode?    public init() { self.val = 0; self.next = nil; }    public init(_ val: Int) { self.val = val; self.next = nil; }    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }}class Solution {    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {        var head = head        var curr = head        while curr?.val != nil || curr?.next != nil {            if curr?.val == val {                head = curr?.next                curr = head            } else if curr?.next?.val == val {                curr?.next = curr?.next?.next            } else {                curr = curr?.next            }        }        return head    }}let solution = Solution()var head: ListNode? = ListNode(1, .init(2, .init(6, .init(3, .init(4, .init(5, .init(6)))))))solution.removeElements(head, 6)head = nilsolution.removeElements(head, 1)head = ListNode(7, .init(7, .init(7, .init(7, nil))))solution.removeElements(head, 7)head = ListNode(7, .init(1, .init(2, .init(3, nil))))solution.removeElements(head, 7)head = ListNode(1, .init(2, .init(2, .init(1, nil))))solution.removeElements(head, 2)