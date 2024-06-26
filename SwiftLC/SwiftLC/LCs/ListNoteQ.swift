//
//  ListNoteQ.swift
//  SwiftLC
//
//  Created by APPLE on 2024/6/25.
//

import Foundation

class ListNoteQ {    
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil {
            return list2
        }
        
        if list2 == nil {
            return list1
        }
        
        var i1 = list1
        var i2 = list2
        let result = i1!.val < i2!.val ? list1 : list2
        if (i1!.val < i2!.val) {
            i1!.next = mergeTwoLists(i1?.next, i2)
        } else {
            i2!.next = mergeTwoLists(i1, i2?.next)
        }
        return result
    }
    
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil {
            return true
        }
            
        var slow:ListNode! = head
        var fast:ListNode! = head
        repeat {
            slow = slow.next
            fast = fast.next
            if (fast != nil) {
                fast = fast.next
            } else {
                break
            }
            
        } while(fast != nil && slow != nil && slow !== fast)
        if (fast == nil || slow == nil) {
            return false
        }
        return true
    }
}
