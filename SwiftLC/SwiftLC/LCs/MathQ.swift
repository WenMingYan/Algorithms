//
//  MathQ.swift
//  SwiftLC
//
//  Created by APPLE on 2024/6/27.
//

import Foundation
class MathQ {
    func mySqrt(_ x: Int) -> Int {
        if (x == 0) {
            return 0
        }
        var num = 1
        var count = 0
        while num < x {
            num = num << 1
            count += 1
        }
        count = count / 2 + 1
        var result = 1;
        for _ in 0 ..< count {
            result = 2 * result;
        }
        while result * result > x {
            result -= 1
        }
        return result
    }
    
    
    
    func plusOne(_ digits: [Int]) -> [Int] {
        if digits.count == 0 {
            return []
        }
        var resultList = [Int]()
        let reverse = Array(digits.reversed())
        var num = reverse[0]+1
        var jinwei = 0
        if (num >= 10) {
            num -= 10
            jinwei = 1
        } else {
            jinwei = 0
        }
        resultList.insert(num, at: 0)
        for i in 1 ..< reverse.count {
            var num = reverse[i]+jinwei
            if (num >= 10) {
                num -= 10
                jinwei = 1
            } else {
                jinwei = 0
            }
            resultList.insert(num, at: 0)
        }
        if jinwei != 0 {
            resultList.insert(jinwei, at: 0)
        }
        return resultList
    }
}
