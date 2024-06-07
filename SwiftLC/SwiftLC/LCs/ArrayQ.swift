//
//  ArrayQ.swift
//  SwiftLC
//
//  Created by APPLE on 2024/5/27.
//

import Foundation
class ArrayQ :NSObject {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        if (nums.count == 0) {
            return 0;
        }
        var writeI : Int = 0;
        for index in 0 ... nums.count - 1 {
            let value = nums[index];
            if (value != val) {
                nums[writeI] = value;
                writeI += 1;
                
            }
        }
        
        return writeI;
    }
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        if (m == 0 && n == 0) {
            return;
        }
        if(n == 0) {
            return;
        }
        if (m == 0) {
            for num in 0 ... n-1 {
                nums1[num] = nums2[num];
            }
            return;
        }
        let nums1Copy = nums1;
        var i:Int = 0,j:Int = 0,index:Int = 0;
        while(index < (m + n)) {
            
            let num1 = nums1Copy[i];
            let num2 = nums2[j];
            if (num1 <= num2) {
                nums1[index] = num1;
                i = i + 1;
                index = index+1;
            } else {
                nums1[index] = num2;
                j = j + 1;
                index = index+1;
            }
            
            if (i == m) {
                if (j < n) {
                    for num in j ... n-1 {
                        nums1[index] = nums2[num];
                        index = index+1;
                    }
                }
                break;
            }
            if (j == n) {
                if (i < m) {
                    for num in i ... m-1 {
                        nums1[index] = nums1Copy[num];
                        index = index+1;
                    }
                }
                break;
            }
        }
        print(nums1);
    }
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        // 如果数组只有1个或者0个元素，则直接返回数组的数量
        if (nums.count == 0 || nums.count == 1) {
            return nums.count;
        }
        var count : Int = 1;
        var i : Int = 0;
        var k : Int = i + 1;
        while k < nums.count {
            if (nums[k] == nums[k - 1]) {
                k+=1;
            } else {
                i+=1;
                nums[i] = nums[k];
                k+=1;
                count+=1;
            }
        }
        return count;
    }
    func majorityElement(_ nums: [Int]) -> Int {
        
        var numDict : [NSNumber: Int] = [:];
        for num in nums {
            let number = num as NSNumber;
            var value : Int? = numDict[number];
            if (value != nil) {
                value!+=1;
                numDict[number] = value;
            } else {
                numDict[number] = 1;
            }
        }
        var maxCount:Int = 0;
        var maxNumber:Int = 0;
        for numKey in numDict.keys {
            let value:Int! = numDict[numKey];
            if (value > maxCount) {
                maxCount = value;
                maxNumber = numKey.intValue;
            }
        }
        return maxNumber;
    }
    
    /// Boyer-Moore 算法
    func majorityElement1(_ nums: [Int]) -> Int {
        var result:Int = 0;
        var count: Int = 0;
        for num in nums {
            if (count == 0) {
                result = num;
            }
            if (num==result) {
                count+=1;
            } else {
                count-=1;
            }
        }
        return result;
    }
    
    func maxProfit(_ prices: [Int]) -> Int {
        var minPrice : Int = prices[0];
        var max : Int = 0;
        for price in prices {
            if (minPrice > price ) {
                minPrice = price;
            }
            let diff: Int = price - minPrice;
            if (diff > 0 && max < diff) {
                max = diff;
            }
        }
        if (max < 0) {
            max = 0;
        }
        return max;
    }
}
