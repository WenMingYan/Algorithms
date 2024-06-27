//
//  BinaryQ.swift
//  SwiftLC
//
//  Created by APPLE on 2024/6/27.
//

import Foundation

class BinaryQ {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0;
        if nums.count == 0 {
            return 0
        }
        for i in 0 ..< nums.count {
            result ^= nums[i]
        }
        return result
    }
    
    
    func addBinary(_ a: String, _ b: String) -> String {
        if a.count == 0 {
            return b
        }
        if b.count == 0 {
            return a
        }
        var listA = Array(a)
        var listB = Array(b)
        var listResult = [Character]()
        var jinwei = 0
        while (listA.count != 0 || listB.count != 0) {
            var addA  = 0
            var addB  = 0
            if listA.count != 0 {
                addA = listA.last?.wholeNumberValue ?? 0
                listA.removeLast()
            }
            if listB.count != 0 {
                addB = listB.last?.wholeNumberValue ?? 0
                listB.removeLast()
            }
            var result = addA + addB + jinwei
            if result >= 2 {
                jinwei = 1
                result -= 2
            } else {
                jinwei = 0
            }
            listResult.insert(Character("\(result)"), at: 0)
        }
        if jinwei != 0 {
            listResult.insert("1", at: 0)
        }
        return String(listResult)
    }
}
