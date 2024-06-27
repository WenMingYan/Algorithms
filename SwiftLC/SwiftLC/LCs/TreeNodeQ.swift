//
//  TreeNodeQ.swift
//  SwiftLC
//
//  Created by APPLE on 2024/6/25.
//

import Foundation

class TreeNodeQ {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.count == 0 {
            return nil
        }
        if nums.count == 1 {
            return TreeNode(nums[0],nil,nil)
        }
        let center = nums.count / 2
        let root = TreeNode(nums[center],nil,nil)
        root.left = sortedArrayToBST(Array(nums[0..<center]))
        root.right = sortedArrayToBST(Array(nums[(center+1)...]))
        return root
    }
    
    
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        if (root == nil) {
            return 0
        }
        if (root!.left == nil && root!.right == nil) {
            return 0
        }
        var list = [Int]()
        leftMiddleRight(root, &list)
        var diff = list[1] - list[0]
        var minus = list[0]
        for i in 1 ..< list.count {
            let adiff = list[i] - minus
            if adiff < diff {
                diff = adiff
            }
            minus = list[i]
        }
        return diff
    }
    
    func leftMiddleRight(_ root: TreeNode?,_ list: inout [Int]) {
        if root == nil {
            return
        }
        leftMiddleRight(root!.left, &list)
        list.append(root!.val)
        leftMiddleRight(root!.right, &list)
    }
    
    
    
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        if (root == nil) {
            return []
        }
        var countList = [Int]()
        var sumList = [Double]()
        
        sumOfLevels(root, &countList, &sumList, 0)
        if (sumList.count != sumList.count) {
            return []
        }
        for i in 0 ..< sumList.count {
            var sum = sumList[i]
            let count = countList[i]
            sum = sum / Double(count)
            sumList[i] = sum
        }
        
        return sumList
    }
    
    func sumOfLevels(_ root: TreeNode?,_ countList: inout [Int],_ sumList: inout [Double], _ currentCount: Int) {
        if (root == nil) {
            return
        }
        if countList.count <= currentCount {
            countList.append(1)
        } else {
            var num = countList[currentCount];
            num += 1
            countList[currentCount] = num
        }
        if sumList.count <= currentCount {
            sumList.append(Double(root!.val))
        } else {
            var sum = sumList[currentCount]
            sum += Double(root!.val)
            sumList[currentCount] = sum
        }
        sumOfLevels(root!.left, &countList, &sumList, currentCount+1)
        sumOfLevels(root!.right, &countList, &sumList, currentCount+1)
    }
    
    
    func countNodes(_ root: TreeNode?) -> Int {
        if (root == nil) {
            return 0
        }
        return countNodes(root!.left) + countNodes(root!.right) + 1
        
    }
    func centerLeftRight(_ root: TreeNode?,_ count: inout Int) {
        if root == nil {
            return;
        }
        if root!.left != nil {
            count += 1;
            centerLeftRight(root!.left, &count)
            if (root!.right != nil) {
                count+=1
                centerLeftRight(root!.right, &count)
            }
        }
    }
    
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
    
    func hasPathSum(_ root: TreeNode?, _ aTargetSum: Int) -> Bool {
        if root == nil {
            return false
        }
        if root?.left == nil && root?.right == nil && Int(root!.val) == aTargetSum {
            return true
        }
       return pathSum(root, aTargetSum)
        
    }
    
    func pathSum(_ root: TreeNode?, _ aTargetSum: Int) -> Bool {
        var find = false
        var targetSum = aTargetSum
        if root?.left == nil && root?.right == nil && Int(root!.val) == targetSum {
            return true
        }
        targetSum = targetSum - Int(root!.val)
            
        if root!.left != nil {
            find = pathSum(root?.left,targetSum)
            if !find {
                if root!.right != nil {
                    find = pathSum(root!.right, targetSum)
                }
                return find
            } else {
                return find
            }
        } else {
            if root!.right != nil {
                find = pathSum(root!.right, targetSum)
            }
        }
        return find
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
