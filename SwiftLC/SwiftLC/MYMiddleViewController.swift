//
//  MYMiddleViewController.swift
//  SwiftLC
//
//  Created by APPLE on 2024/6/28.
//

import Foundation
import UIKit

class MYMiddleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var map = [
        "轮转数组":"rotate",
        "删除有序数组中的重复项II":"removeDuplicates"
    ]
    var list = [
        "轮转数组",
       "删除有序数组中的重复项II"
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
    
    @objc func rotate() {
        var list = [1,2,3,4,5,6,7]
        ListQ.init().rotate(&list,3)
        print("")
    }
    @objc func removeDuplicates() {
        var list = [1,1,1,1,2,2,3]
        let result = ListQ.init().removeDuplicates(&list)
        print(result)
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
