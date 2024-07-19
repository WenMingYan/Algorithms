//
//  DynamicProgrammingQ.swift
//  SwiftLC
//
//  Created by APPLE on 2024/6/27.
//

import Foundation


class DynamicProgrammingQ {
    func canJump(_ nums: [Int]) -> Bool {
        var lastMax = 0;// 能走到最远的地方
        for i in 0 ..< nums.count {
            if lastMax < i {
                return false
            }
            lastMax = max(i+nums[i], lastMax)
        }
        return true
    }
        
    func canJump1(_ nums: [Int]) -> Bool {
        if nums.count == 0 {
            return false
        }
        if nums.count == 1 {
            return true
        }
        if nums.count == 2 {
            let num = nums[0]
            if num == 0 {
                return false
            } else {
                return true
            }
        }
        
        let num = nums[nums.count - 2]
        if num > 0 {
            return canJump1(Array(nums[0 ..< nums.count - 1]))
        } else {
            if nums.count >= 3 {
                return cancanJump(Array(nums[0 ..< nums.count - 1]), 2);
                
            }
            return false
        }
    }
    
    func cancanJump(_ nums: [Int],_ jumpCount:Int ) -> Bool {
        if nums.count == 0 {
            return false
        }
        if nums.count == 1 {
            let num = nums[0]
            if num == 0 {
                return false
            }
            if num >= jumpCount {
                return true
            } else {
                return false
            }
            
        }
        let num1 = nums[nums.count - 2]
        if num1 >= jumpCount {
            return canJump1(Array(nums[0 ..< nums.count - 1]))
        } else {
            return cancanJump(Array(nums[0 ..< nums.count - 1]),jumpCount+1)
        }
    }
    
    func climbStairs(_ n: Int) -> Int {
        if n <= 0 {
            return 0
        }
        if n == 1 {
            return 1
        }
        if n == 2 {
            return 2
        }
        var lastNum = 2;
        var lastlastNum = 1;
        var result = 0;
        for _ in 2 ..< n {
            result = lastNum + lastlastNum;
            lastlastNum = lastNum
            lastNum = result
        }
        return result;
    }
    
    func _climbStairs(_ n:Int) -> Int {
        var count = 0
        if n <= 0 {
            return 0
        }
        if n == 1 {
            return 1
        }
        
        if n - 2 > 0 {
            count = _climbStairs(n - 2)
        }
        return count
    }
}
