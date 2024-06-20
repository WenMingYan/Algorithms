//
//  HashQ.swift
//  SwiftLC
//
//  Created by APPLE on 2024/6/12.
//

import Foundation

class HashQ : NSObject {
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
                }
            }
        }
        
        
        return true;
    }
}
