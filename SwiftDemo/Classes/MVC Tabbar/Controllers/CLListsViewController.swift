//
//  CLListsViewController.swift
//  SwiftDemo
//
//  Created by 炬盈科技 on 2017/8/31.
//  Copyright © 2017年 CJQ. All rights reserved.
//

import UIKit

class CLListsViewController: CommonViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView = UITableView()
    var dataSource = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView = self.createTableView(style: UITableViewStyle.plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
        
        let model = CommonModel.init()
        self.dataSource.add(model)
        
        self.tableView.reloadData()
        
     
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDataSource
    // MARK: 行数
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    // MARK: 组数 optional 可选
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    // MARK: 单元格展示
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "CLListsTableViewCell"
        let cell = CLListsTableViewCell.dequeueReusable(tableView, identifier)
        
        let model = dataSource[indexPath.row] as! CommonModel
        model.Name = String(arc4random())
        
        tableView.rowHeight = cell .setModel(model: model)
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String.init(format: "第%d组", section)
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let hfView = UITableViewHeaderFooterView.init()
        hfView.contentView.backgroundColor = Color.lineColor
        return hfView
    }
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let hfView = UITableViewHeaderFooterView.init()
        hfView.contentView.backgroundColor = UIColor.yellow
        return hfView
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
