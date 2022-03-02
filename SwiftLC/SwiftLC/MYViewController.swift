//
//  MYViewController.swift
//  SwiftLC
//
//  Created by APPLE on 2022/3/2.
//

import UIKit


class MYViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var map = [
        "反转链表": "callReserveList",
        "两数相加": "plus"
    ]
    var list = [
        "反转链表",
        "两数相加",
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
