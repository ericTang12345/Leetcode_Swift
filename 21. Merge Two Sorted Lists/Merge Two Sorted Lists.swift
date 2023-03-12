//
//  Merge Two Sorted Lists.swift
//  
//
//  Created by ShaoHuan Tang on 2023/3/12.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let mergedList = (listNodeToArray(list1) + listNodeToArray(list2)).sorted()
        guard mergedList.isEmpty == false,
              let firstNum = mergedList.first else { return nil }
        
        let listNode = ListNode(firstNum)
        var current = listNode
        for i in 1 ..< mergedList.count {
            current.next = .init(mergedList[i])
            current = current.next!
        }
        
        return listNode
    }
    
    func listNodeToArray(_ list: ListNode?) -> [Int] {
        var firstNode = list
        var firstArray: [Int] = []
        
        while firstNode != nil {
            if let val = firstNode?.val {
                firstArray.append(val)
            }
            firstNode = firstNode?.next
        }
        return firstArray
    }
}

let solution = Solution()
solution.mergeTwoLists(.init(1, .init(2, .init(4, nil))),
                       .init(1, .init(3, .init(4, nil))))
