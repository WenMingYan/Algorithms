//
//  ViewController.swift
//  SwiftLC
//
//  Created by APPLE on 2022/3/2.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: UITableView.Style.grouped)
    var list = ["MYViewController","MYViewController"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view .addSubview(tableView);
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { (make) -> Void in
            make.left.right.top.bottom.equalTo(self.view)
        }
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
        let clazz = NSClassFromString("SwiftLC.\(vcStr)") as! UIViewController.Type
        self.navigationController?.pushViewController(clazz.init(), animated: true)
    }
}

