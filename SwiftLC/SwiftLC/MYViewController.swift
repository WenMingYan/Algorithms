//
//  MYViewController.swift
//  SwiftLC
//
//  Created by APPLE on 2022/3/2.
// @

import UIKit


class MYViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var map = [
        "路径总和":"hasPathSum",
        "对称二叉树":"isSymmetric",
        "想同的树":"isSameTree",
        "合并两个有序链表":"mergeTwoLists",
        "汇总区间":"summaryRanges",
        "存在重复元素II":"containsNearbyDuplicate",
        "快乐数":"isHappy",
        "有效的字母异位词":"isAnagram",
        "单词规律":"wordPattern",
        "同构字符串":"isIsomorphic",
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
        "路径总和",
        "对称二叉树",
        "想同的树",
        "合并两个有序链表",
        "汇总区间",
        "存在重复元素II",
        "快乐数",
        "有效的字母异位词",
        "单词规律",
        "同构字符串",
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
    
    @objc func hasPathSum () {
        let list1 = TreeNode(0, TreeNode(2,TreeNode(-2,nil,nil),nil),
                                TreeNode(8,nil,nil))
        let result = TreeNodeQ.init().hasPathSum(list1,0)
        print(result);
    }
    
    @objc func isSameTree () {
        let list1 = TreeNode(1, nil, nil)
        let list2 = TreeNode(1,nil,TreeNode(2,nil,nil))
        let result = TreeNodeQ.init().isSameTree(list1,list2)
        print(result);
    }
    
    @objc
    func mergeTwoLists()  {
        let list1 = ListNode(5, nil)
        let list2 = ListNode(1, ListNode(2,ListNode(4,nil)))
        _ = ListNoteQ.init().mergeTwoLists(list1, list2)
        print("");
    }
    
    @objc func summaryRanges() {
        let nums = [0,2,3,4,6,8,9];
        let result = ListQ.init().summaryRanges(nums);
        print(result);
    }
    
    @objc func containsNearbyDuplicate() {
        let nums = [1,2,3,1];
        let k = 3;
        let result = HashQ.init().containsNearbyDuplicate(nums,k);
        print(result);
    }
    
    @objc func isHappy() {
        let ransom = 19;
        let result = HashQ.init().isHappy(ransom);
        print(result);
    }
    
    @objc func isAnagram() {
        let ransom = "rat";
        let magazine = "car";
        let result = HashQ.init().isAnagram(ransom, magazine);
        print(result);
    }

    
    @objc func wordPattern() {
        let ransom = "abba";
        let magazine = "dog dog dog dog";
        let result = HashQ.init().wordPattern(ransom, magazine);
        print(result);
    }
    
    @objc
    func isIsomorphic() {
        let ransom = "foo";
        let magazine = "bar";
        let result = HashQ.init().isIsomorphic(ransom, magazine);
        print(result);
    }
    
    @objc
    func canConstruct() {
        let ransom = "fihjjjjei";
        let magazine = "hjibagacbhadfaefdjaeaebgi";
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
