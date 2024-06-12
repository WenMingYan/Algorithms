//
//  StringQ.swift
//  SwiftLC
//
//  Created by APPLE on 2024/6/7.
//

import Foundation
class StringQ : NSObject {
    
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        if (t.count == 0 && s.count == 0) {
            return true;
        }
        if t.count == 0 || s.count > t.count {
            return false;
        }
        
        let sArray = Array(s);
        let tArray = Array(t);
        var si = 0;
        var ti = 0;
        var eqCount = 0;
        while si < sArray.count && ti < tArray.count {
            let sItem = sArray[si];
            let tItem = tArray[ti];
            if (sItem != tItem) {
                ti+=1;
            } else {
                si += 1;
                ti += 1;
                eqCount+=1;
            }
        }
        if (eqCount == sArray.count) {
            return true;
        }
        
        return false;
    }
    
    func isPalindrome(_ s: String) -> Bool {
        if s.count == 0 {
            return true;
        }
        let array = Array(s);
        var i = 0;
        var j = array.count - 1;
        while i < j && j > 0 && i < array.count - 1 {
            let itemI = array[i];
            let itemJ = array[j];
            
            if !itemI.isLetter && !itemI.isNumber || itemI.isWhitespace {
                i+=1;
                continue;
            }
            if !itemJ.isLetter && !itemJ.isNumber || itemJ.isWhitespace{
                j-=1;
                continue;
            }
            if (itemI.lowercased() == itemJ.lowercased()) {
                i+=1;
                j-=1;
            } else {
                return false;
            }
        }
        
        return true;
    }
    
    
    func strStrKMP(_ haystack: String, _ needle: String) -> [Int] {
        let textArray = Array(haystack)
        let patternArray = Array(needle)
        let textCount = textArray.count
        let patternCount = patternArray.count
        let prefixFunction = computePrefixFunction(pattern: needle)
        var q = 0
        var matches = [Int]()
        
        for i in 0..<textCount {
            while q > 0 && patternArray[q] != textArray[i] {
                q = prefixFunction[q - 1]
            }
            if patternArray[q] == textArray[i] {
                q += 1
            }
            if q == patternCount {
                matches.append(i - patternCount + 1)
                q = prefixFunction[q - 1]
            }
        }
        
        return matches
    }
    
    func computePrefixFunction(pattern: String) -> [Int] {
        // 将模式字符串转换为字符数组
        let array = Array(pattern)
        let count = array.count
        
        // 初始化前缀函数数组，长度为模式字符串的长度，初始值为 0
        var result = [Int](repeating: 0, count: count)
        // 前缀的长度
        var k = 0
        // 遍历模式字符串，从第二个字符开始
        for i in 1..<count {
            // 如果当前字符不匹配前缀字符，则更新前缀长度
            while k > 0 && array[k] != array[i] {
                k = result[k - 1]
            }
            // 如果当前字符匹配前缀字符，则增加前缀长度
            if array[k] == array[i] {
                k += 1
            }
            // 设置前缀函数数组的值
            result[i] = k
        }
        
        return result
    }
    
    
    
    func strStr(_ haystack: String, _ needle: String) -> Int {
        // 空判断
        if (haystack.count == 0 || needle.count == 0) {
            return -1;
        }
        if (haystack.count < needle.count) {
            return -1;
        }
        
        var index:Int = 0;
        while index < haystack.count {
            let startIndex = haystack.index(haystack.startIndex, offsetBy: index);
            if (index + needle.count > haystack.count) {
                return -1;
            }
            let endIndex = haystack.index(startIndex, offsetBy: needle.count);
            let subString = haystack[startIndex..<endIndex];
            if (subString == needle) {
                return index;
            }
            index+=1;
        }
        return -1;
    }
    
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 {
            return "";
        }
        if strs.count == 1 {
            return strs[0];
        }
        let str0:String = strs[0];
        let str1:String = strs[1];
        var i : Int = 0;
        var result:String = "";
        while i < str0.count && i < str1.count {
            let index0 = str0.index(str0.startIndex, offsetBy: i);
            let chatacter0 = str0[index0];
            let index1 = str1.index(str1.startIndex, offsetBy: i);
            let chatacter1 = str1[index1];
            if (chatacter0 == chatacter1) {
                result += String(chatacter0);
                i+=1;
                continue;
            } else {
                break;
            }
        }
        if result != "" {
//            let resultA:String = String(result);
            for i in 2..<strs.count {
                let str:String = strs[i];
                if str.hasPrefix(result) {
                    continue;
                } else {
                    while result.count != 0 {
                        result.removeLast();
                        if str.hasPrefix(result) {
                            break;
                        }
                    }
                    if (result.count == 0) {
                        return "";
                    }
                    continue;
                }
            }
            return result;
        }
        return "";

    }
    
    
    func lengthOfLastWord(_ s: String) -> Int {
        var result : Int = 0;
        for i in stride(from: s.count - 1, to: 0, by: -1) {
            let index = s.index(s.startIndex, offsetBy: i);
            let chatacter = s[index];
            if (chatacter == " ") {
                if (result == 0) {
                    continue;
                }
                break;
            }
            result+=1;
        }
        return result;
    }
}
