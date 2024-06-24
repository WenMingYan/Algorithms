//
//  HashQ.swift
//  SwiftLC
//
//  Created by APPLE on 2024/6/12.
//

import Foundation

class HashQ : NSObject {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        if k == 0 {
            return false
        }
        var map:[Int:Int] = [:]
        for i in 0 ..< nums.count {
            let num = nums[i]
            if (map[num] != nil) {
                let lastI = map[num]!
                if (abs(lastI - i) <= k) {
                    return true
                } else {
                    map[num] = i
                }
                
            } else {
                map[num] = i
            }
        }

        return false;
        
        
        
    }
    
    
    // 202 快乐数 可以整理到册子上，用快慢指针来做
    
    
    func _bitSquareSum(_ n: Int) -> Int {
        var sum = 0
        var num = n;
        while(num > 0) {
            let bit = num % 10;
            sum += bit * bit;
            num = num/10;
        }
        return sum;
    }
    
    func isHappy(_ n: Int) -> Bool {
        var slow = n
        var fast = n
        repeat {
            slow = _bitSquareSum(slow);
            fast = _bitSquareSum(fast);
            fast = _bitSquareSum(fast);

        } while (slow != fast)
        return slow == 1;
    }
    
    
    
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let sArray = Array(s)
        let tArray = Array(t)
        if (sArray.count == 0 || t.count == 0) {
            return false
        }
        
        if (sArray.count != tArray.count) {
            return false
        }

        var mapS:[Character:[Int]] = [:]
        var mapT:[Character:[Int]] = [:]
        
        for i in 0 ..< sArray.count {
            let itemS = sArray[i]
            let itemT = tArray[i]
            if mapS[itemS] == nil {
                var list = [Int]()
                list.append(i)
               mapS[itemS] = list
            } else {
                var list = mapS[itemS];
                list!.append(i)
                mapS[itemS] = list
            }
            
            if mapT[itemT] == nil {
                var list = [Int]()
                list.append(i)
               mapT[itemT] = list
            } else {
                var list = mapT[itemT];
                list!.append(i)
                mapT[itemT] = list
            }
        }// end of for
        
        if (mapS.keys.count != mapT.keys.count) {
            return false
        }
        
        for (key,valueS) in mapS {
            let valueT = mapT[key]
            if (valueT == nil) {
                return false
            }
            if (valueS.count != valueT!.count) {
                return false
            }
        }
        
        
        return true
    }
    
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        let pArray = Array(pattern)
        let sArray = s.components(separatedBy: .whitespaces)
        if (pArray.count == 0 || sArray.count == 0) {
            return false
        }
        if (pArray.count != sArray.count) {
            return false
        }
        var map:[Character:String] = [:]
        for i in 0 ..< pArray.count {
            let pC = pArray[i]
            let sC = sArray[i]
            if map[pC] != nil {
                
                let result = map[pC]
                if (result != sC) {
                    return false
                }
            } else {
                if (map.values.count != 0 && map.values.contains(sC))  {
                    return false;
                }
                map[pC] = sC
            }
        }
        
        return true

    }
    
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        if s.count == 0 || t.count == 0 {
            return true
        }
        if s.count != t.count {
            return false
        }
        let sArray = Array(s)
        let tArray = Array(t)
        var mapStr: [Character:Character] = [:]
        
        for i in 0 ..< sArray.count {
            let itemS = sArray[i]
            let itemT = tArray[i]
            if mapStr[itemS] == nil && !mapStr.values.contains(itemT) {
                mapStr[itemS] = itemT
            } else {
                if itemT != mapStr[itemS] {
                    return false
                }
            }
        }
        return true
    }
    
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        if magazine.count == 0 {
            return false;
        }
        if (ransomNote.count == 0) {
            return true;
        }
        let magazineArray = Array(magazine);
        var map: [Character:Int] = [:];
        for i in 0 ..< magazineArray.count {
            let itemM = magazineArray[i];
            if (map[itemM] == nil) {
                map[itemM] = 1;
            } else {
                var number:Int? = map[itemM];
                number! += 1;
                map[itemM] = number;
            }
        }
        
        let ransomNoteArray = Array(ransomNote);
        for i in 0 ..< ransomNoteArray.count {
            let itemR = ransomNoteArray[i];
            var number:Int? = map[itemR];
            if number == nil {
                return false;
            } else {
                number! -= 1;
                if (number == 0) {
                    map.removeValue(forKey: itemR);
                } else {
                    map[itemR] = number;
                }
            }
        }
        
        
        return true;
    }
}
