//
//  ListVC.swift
//  SwiftDemo
//
//  Created by 思久科技 on 2017/1/16.
//  Copyright © 2017年 思久科技. All rights reserved.
//

import UIKit
import HandyJSON

class ListVC: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView = UITableView()
    var dataSource = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableView = self.createTableView(style: UITableViewStyle.plain)
        self.tableView.frame = CGRect.init(x: 0, y: 64, width: self.view.frame.width, height: self.view.frame.height-64-49)
        self.view.addSubview(self.tableView)
        
        let parameters: NSDictionary = ["page": "1", "pageSize":"20"]
        
        NetWork.request(url: ServerAPI.advertisement, method: .get, parameters: parameters) { (data) in
            print("%@", data)
        }
        
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
        return 2
    }
    // MARK: 单元格展示
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "UITableViewCell"
        let cell = ListTC.dequeueReusable(tableView, identifier)
        
        let model = dataSource[indexPath.row] as! BaseModel
        
        tableView.rowHeight = cell .setModel(model: model)
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String.init(format: "第%d组", section)
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let hfView = UITableViewHeaderFooterView.init()
        hfView.contentView.backgroundColor = Color.line
        return hfView
    }
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let hfView = UITableViewHeaderFooterView.init()
        hfView.contentView.backgroundColor = UIColor.yellow
        return hfView
    }
    
    func createTableView(style : UITableViewStyle) -> UITableView {
        let tableView = UITableView.init(frame: self.view.bounds, style: style)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 44.0
        tableView.sectionHeaderHeight = 40.0
        tableView.sectionFooterHeight = 8.0
        
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
