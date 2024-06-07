//
//  StringQ.swift
//  SwiftLC
//
//  Created by APPLE on 2024/6/7.
//

import Foundation
class StringQ : NSObject {
    
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        return 0;
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
                var str:String = strs[i];
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
