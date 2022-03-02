//
//  MYReserseListQ.swift
//  SwiftLC
//
//  Created by APPLE on 2022/3/2.
//

import UIKit


/*
 给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。
 输入：head = [1,2,3,4,5]
 输出：[5,4,3,2,1]
 
 输入：head = []
 输出：[]
 
 提示：
 
 链表中节点的数目范围是 [0, 5000]
 -5000 <= Node.val <= 5000
 
 */

class MYReserseListQ: NSObject {
        func reverseList(_ head: ListNode?) -> ListNode? {
            if head == nil {
                return nil
            }
            if head!.next == nil {
                return head
            }
            var preNode = head
            var currentNode = head!.next
            preNode!.next = nil
            while currentNode != nil {
                let nextNode = currentNode!.next
                currentNode!.next = preNode
                preNode = currentNode
                currentNode = nextNode
            }
    
            return preNode
        }
    
    func reverseList1(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        if head!.next == nil {
            return head
        }
        let currentNode = head
        let tmpNode = head!.next
        let nextNode = reverseList(head!.next)
        
        currentNode!.next = nil
        if tmpNode != nil {
            tmpNode!.next = currentNode
        } else {
            return currentNode
        }
        return nextNode
        
    }
    
    func printNode(_ head: ListNode?) {
        var node = head
        if node == nil {
            print("nil")
        }
        while node != nil {
            print("\(node!.val) --> ")
            node = node!.next
        }
        
    }
}
