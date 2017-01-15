//
//  ViewController1.swift
//  SwiftDemo
//
//  Created by 思久科技 on 2017/1/13.
//  Copyright © 2017年 思久科技. All rights reserved.
//

import UIKit

class ViewController1: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableView = self.createTableView(style: UITableViewStyle.grouped)
        self.view.addSubview(self.tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDataSource
    // MARK: 行数
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    // MARK: 组数 optional 可选
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    // MARK: 单元格展示
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "UITableViewCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier);
        
        if(cell == nil){//因为是纯代码实现，没有对行里的cell做注册，这里是 做注册， 注册一次后，下次会继续使用这个缓存
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier);
            //以上使用了系统默认的一个cell样式
        }
        
        cell?.textLabel?.text = "UITableViewCell"
        
        return cell!
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String.init(format: "第%d组", section)
    }
    func createTableView(style : UITableViewStyle) -> UITableView {
        let tableView = UITableView.init(frame: self.view.frame, style: style)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 44.0
        tableView.sectionHeaderHeight = 40.0
        tableView.sectionFooterHeight = 0.001
        
        tableView.separatorColor = Color.line
        tableView.backgroundColor = Color.bg
        return tableView
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
