//
//  DynamicProgrammingQ.swift
//  SwiftLC
//
//  Created by APPLE on 2024/6/27.
//

import Foundation


class DynamicProgrammingQ {
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
