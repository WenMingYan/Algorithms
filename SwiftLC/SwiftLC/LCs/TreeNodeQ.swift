//
//  TreeNodeQ.swift
//  SwiftLC
//
//  Created by APPLE on 2024/6/25.
//

import Foundation

class TreeNodeQ {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        let left = root!.left
        let right = root!.right
        
        return root == nil || recur(left, right)
        
    }
    
    func recur(_ left: TreeNode?,_ right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        if left == nil || right == nil || left?.val != right?.val {
            return false
        }
        return recur(left!.left, right!.right) || recur(left!.right, right!.left);
    }
    
    
    
    func rightCenterLeftTree(_ root: TreeNode?,_  list:inout [Int])  {
        if root == nil {
            return
        }
        if root!.right != nil {
            leftCenterRightTree(root!.right, &list)
        } else {
            list.append(0)
        }
        list.append(root!.val)
        
        if root!.left != nil {
            leftCenterRightTree(root?.left,&list)
        } else {
            list.append(0)
        }
    }
    
    func leftCenterRightTree(_ root: TreeNode?,_  list:inout [Int])  {
        if root == nil {
            return
        }
        if root!.left != nil {
            leftCenterRightTree(root?.left,&list)
        } else {
            list.append(0)
        }
        list.append(root!.val)
        if root!.right != nil {
            leftCenterRightTree(root!.right, &list)
        } else {
            list.append(0)
        }
    }
    
    
    
    
    
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        if p == nil && q != nil {
            return false
        }
        if p != nil && q == nil {
            return false
        }
        if p!.val != q!.val {
            return false
        }
        if p!.val == q!.val &&
            q!.left == nil && q!.right == nil &&
            p!.left == nil && p!.right == nil {
            return true
        }
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
    
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        if root!.left == nil {
            return (maxDepth(root!.right) + 1)
        }
        if root!.right == nil {
            return (maxDepth(root!.left) + 1)
        }
        
        return max(maxDepth(root!.left), maxDepth(root!.right)) + 1
    }
}
