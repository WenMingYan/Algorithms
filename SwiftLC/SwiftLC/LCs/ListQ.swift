//
//  ListQ.swift
//  SwiftLC
//
//  Created by APPLE on 2024/6/24.
//

import Foundation

class ListQ {
    
    func rotate(_ nums: inout [Int], _ k: Int) {
        if nums.count == 0 || nums.count == 1 || k == 0 || k % nums.count == 0 {
            return;
        }
        let count = nums.count - k % nums.count
        let list = Array(nums[...count])
        var index = 0
        for i in count ..< nums.count {
            nums[index] = nums[i]
            index+=1
        }
        index = 0
        for i in (nums.count - count) ..< nums.count {
            if index < list.count {
                nums[i] = list[index]
                index+=1
            }
            
        }
    }
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 {
            return 1
        }
        var j = 1
        var i = 1
        var count = 1
        while i < nums.count && j < nums.count {
            if (nums[j] != nums[j-1]) {
                nums[i] = nums[j]
                i+=1
                count=1
            } else {
                count+=1
                // 和前一个一样，i不能动
                if count >= 3 {
                } else {
                    nums[i] = nums[j]
                    i+=1
                }
            }
            j+=1
            
        }
        nums[i-1] = nums[j-1]
        return i
        
    }
    
    
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
