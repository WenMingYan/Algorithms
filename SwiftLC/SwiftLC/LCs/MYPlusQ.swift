//
//  MYPlusQ.swift
//  SwiftLC
//
//  Created by APPLE on 2022/3/2.
//

import UIKit

/*
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

 请你将两个数相加，并以相同形式返回一个表示和的链表。

 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 
 */
class MYPlusQ: NSObject {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return nil
        }
        var curL1 = l1
        var curL2 = l2
        var result: ListNode = ListNode()
        let first = result
        var needAdd: Int = 0
        while curL1 != nil && curL2 != nil {
            
            let num = curL1!.val + curL2!.val + needAdd
            if num / 10 >= 1 {
                needAdd = num / 10
            } else {
                needAdd = 0
            }
            
            result.next = ListNode()
            result = result.next!
            
            result.val = num % 10
            curL1 = curL1?.next
            curL2 = curL2?.next
        }
        if curL1 == nil && curL2 != nil {
            while curL2 != nil {
                let num = curL2!.val + needAdd
                if num / 10 >= 1 {
                    needAdd = num / 10
                } else {
                    needAdd = 0
                }
                result.next = ListNode(num % 10)
                curL2 = curL2!.next
                result = result.next!
            }
        }
        if curL2 == nil && curL1 != nil {
            while curL1 != nil {
                let num = curL1!.val + needAdd
                if num / 10 >= 1 {
                    needAdd = num / 10
                } else {
                    needAdd = 0
                }
                result.next = ListNode(num % 10)
                curL1 = curL1!.next
                result = result.next!
            }
        }
        if needAdd >= 1 {
            result.next = ListNode(needAdd)
        }
        
        return first.next
    }
}
