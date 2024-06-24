//
//  ListQ.swift
//  SwiftLC
//
//  Created by APPLE on 2024/6/24.
//

import Foundation

class ListQ {
    func summaryRanges(_ nums: [Int]) -> [String] {
        if nums.count == 0 {
            return []
        }
        var lastI = 0
        var topI = 0
        var results = [String]()
        for i in 1 ..< nums.count {
            let num = nums[i]
            let lastNum = nums[lastI]
            let topNum = nums[topI]
           
            if (lastNum + 1 == num) {
                lastI = i
                continue
            } else {
                if topNum == lastNum {
                    results.append(String(lastNum))
                } else {
                    let str = "\(String(topNum))->\(String(lastNum))"
                    results.append(str)
                }
                topI = i
                lastI = i
            }
            
        }
        let lastNum = nums[lastI]
        let topNum = nums[topI]
        if topNum == lastNum {
            results.append(String(lastNum))
        } else {
            let str = "\(String(topNum))->\(String(lastNum))"
            results.append(str)
        }
        
     return results
    }
}
