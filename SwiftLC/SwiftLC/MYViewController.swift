//
//  MYViewController.swift
//  SwiftLC
//
//  Created by APPLE on 2022/3/2.
// @

import UIKit


class MYViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var map = [
        "赎金信":"canConstruct",
        "判断子序列":"isSubsequence",
        "反转链表": "callReserveList",
        "两数相加": "plus",
        "合并数组": "mergeArray",
        "移除元素": "removeElement",
        "删除有序数组中的重复项": "removeDuplicates",
        "多数元素": "majorityElement",
        "买卖股票最佳时机":"maxProfit",
        "最后一个单词的长度":"lengthOfLastWord",
        "最长公共前缀":"longestCommonPrefix",
        "找出字符串中第一个匹配项的下标":"strStr",
        "验证回文串":"isPalindrome"
    ]
    var list = [
        "赎金信",
        "判断子序列",
        "反转链表",
        "两数相加",
        "合并数组",
        "移除元素",
        "删除有序数组中的重复项",
        "多数元素",
        "买卖股票最佳时机",
        "最后一个单词的长度",
        "最长公共前缀",
        "找出字符串中第一个匹配项的下标",
        "验证回文串",
    ]
    
    var tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: UITableView.Style.grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view .addSubview(tableView);
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { (make) -> Void in
            make.left.right.top.bottom.equalTo(self.view)
        }
        
        
    }
    
    @objc
    func canConstruct() {
        let ransom = "a";
        let magazine = "b";
        let result = HashQ.init().canConstruct(ransom, magazine);
        print(result);
    }
    
    @objc
    func isSubsequence()  {
        let str = "abc";
        let str1 = "ahbgdc";
        let result = StringQ.init().isSubsequence(str, str1);
        print(result);
    }
    
    @objc
    func isPalindrome() {
        let str = "0p";
        let result = StringQ.init().isPalindrome(str);
        print(result);
    }
    
    @objc
    func strStr() {
        let hayStack = "aabaaabaaac";
        let needle = "aabaaac";
        let result = StringQ.init().strStrKMP(hayStack, needle);
        let result1 = StringQ.init().computePrefixFunction(pattern: needle);
        print(result);
        print(result1);
    }
    
    @objc
    func mergeArray() {
//        var nums1:[Int] = [1,2,3,0,0,0];
////        var nums2:[Int] = [2,5,6];
//        ArrayQ.init().merge(&nums1,
//                                3,
//                                [2,5,6],
//                                3);
        var nums1:[Int] = [1];
//        var nums2:[Int] = [2,5,6];
        ArrayQ.init().merge(&nums1,
                                3,
                                [],
                                0);
    }
    
    @objc
    func removeElement() {
        var nums1 : [Int] = [3,2,2,3];
        let val: Int = 2;
        let k:Int = ArrayQ.init().removeElement(&nums1, val);
        print(k);
    }
    
    @objc
    func removeDuplicates() {
        var nums:[Int] = [0,0,1,1,1,2,2,3,3,4];
        let k:Int = ArrayQ.init().removeDuplicates(&nums);
        print(k);
    }
    @objc
    func majorityElement() {
        let nums:[Int] = [1,1,1,1,1,1,2,3,3,4];
        let k:Int = ArrayQ.init().majorityElement1(nums);
        print(k);
    }
    
    @objc
    func maxProfit()  {
        
    }
    
    @objc
    func lengthOfLastWord() {
        let result = StringQ.init().lengthOfLastWord("   fly me   to   the moon  ");
        print(result);
    }
    
    @objc
    func longestCommonPrefix() {
        let strs = ["flower","flow","flight"];
        let result = StringQ.init().longestCommonPrefix(strs);
        print(result);
    }
    
    @objc
    func callReserveList() {
        
        let nodeList = MYReserseListQ.init().reverseList(ListNode(1,ListNode(2,ListNode(3,nil))))
        MYReserseListQ.init().printNode(nodeList)
    }
    
    @objc
    func plus() {
//        let nodeList = MYPlusQ.init().addTwoNumbers(ListNode(1,ListNode(2,ListNode(3))), ListNode(1,ListNode(2,ListNode(3))))
//        let nodeList = MYPlusQ.init().addTwoNumbers(ListNode(0), ListNode(5,ListNode(6,ListNode(4))))
        let nodeList = MYPlusQ.init().addTwoNumbers(ListNode(9,ListNode(9,ListNode(9,ListNode(9)))), ListNode(9,ListNode(9,ListNode(9,ListNode(9,ListNode(9,ListNode(9,ListNode(9))))))))
        MYReserseListQ.init().printNode(nodeList)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vcStr = list[indexPath.row]
        guard let selectorStr = map[vcStr] else { return }
        let selector = NSSelectorFromString(selectorStr)
        if self.responds(to: selector) {
            self.perform(selector)
        }
        
    }
}
