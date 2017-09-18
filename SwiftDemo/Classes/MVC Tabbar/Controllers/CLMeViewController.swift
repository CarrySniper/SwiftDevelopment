//
//  CLMeViewController.swift
//  SwiftDemo
//
//  Created by 炬盈科技 on 2017/8/31.
//  Copyright © 2017年 CJQ. All rights reserved.
//

import UIKit

class CLMeViewController: CommonViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView()
    var dataSource = Array<Array<Array<Any>>>()
    
    var navigationView = CLNavigationView()
    var headerView = CLMeHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.initObject()
        self.setProperties()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.delegate = nil
    }
    
    // MARK: - UITableViewDelegate
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let sectionArray = dataSource[indexPath.section]
        let rowArray = sectionArray[indexPath.row] as Array
        
        let viewController = rowArray.last as? UIViewController
        if viewController?.isEqual(nil) == false {
            AppDelegate.instance().pushViewController(viewController: viewController!)
        }
        
    }
    // MARK: - UITableViewDataSource
    // MARK: 行数
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionArray = dataSource[section]
        return sectionArray.count
    }
    // MARK: 组数 optional 可选
    public func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    // MARK: 单元格展示
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "CLMeTableViewCell"
        let cell = CLMeTableViewCell.dequeueReusable(tableView, identifier) as! CLMeTableViewCell
        
        let sectionArray = dataSource[indexPath.section]
        let rowArray = sectionArray[indexPath.row] as Array
        
        cell.nameLabel.text = rowArray[0] as? String
        
        return cell
    }
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let hfView = UITableViewHeaderFooterView.init()
        hfView.contentView.backgroundColor = Color.spaceColor
        
        let topLine = self.createLineView()
        hfView.addSubview(topLine)
        
        let bottomLine = self.createLineView()
        bottomLine.makeBottom = 16;
        hfView.addSubview(bottomLine)
        
        return hfView
    }
    
    /// 实例化对象
    private func initObject() {
        // MARK: UITableView
        self.tableView = self.createTableView(style: UITableViewStyle.plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
        // MARK: 头部，跳转到个人信息页
        headerView = CLMeHeaderView.loadXib() as! CLMeHeaderView
        self.tableView.tableHeaderView = headerView;
        headerView.toPersonalInfoPage {
            let viewController = CLPersonalViewController.init()
            AppDelegate.instance().pushViewController(viewController: viewController)
        }        
        
        // MARK: 自定义透明导航栏，其他导航依然使用系统自带的
        navigationView = CLNavigationView.init()
        navigationView.titleLabel.text = "个人中心"
        self.view.addSubview(navigationView)
        
    }
    
    /// 设置属性
    private func setProperties() {
        self.navigationController?.delegate = self;
        self.tableView.sectionHeaderHeight = 16.0;
        self.tableView.showsVerticalScrollIndicator = false
        
        // 嵌套二维数组，内数组元素：0:名称 1:图标 2:类名
        let sectionOne = [["我的栏目1", "", ""],
                          ["我的栏目2", "", ""],
                          ["我的栏目3", "", ""],
                          ["我的栏目4", "", ""],
                          ["我的栏目5", "", ""],
                          ["我的栏目6", "", ""],
                          ["我的栏目7", "", ""],
                          ["我的栏目8", "", ""],

        ]
        
        let sectionTwo = [["意见反馈", "", ""],
                          ["关于我们", "", "AboutVC"],
                          ["设置", "", CLSettingsViewController.init()]
        ]
        
        dataSource = [sectionOne, sectionTwo]
        self.tableView.reloadData()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offset = scrollView.contentOffset.y;
        // 透明效果
        let minAlphaOffset: CGFloat = 0.0;
        let maxAlphaOffset = headerView.makeHeight - 64.0 - 16.0;// 导航栏+间隔区
        let alpha = (offset - minAlphaOffset) / (maxAlphaOffset - minAlphaOffset);
            
        navigationView.alpha = alpha > 1 ? 1 : alpha;
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        if self.isEqual(viewController) {
            navigationController.setNavigationBarHidden(true, animated: true)
        }else{
            navigationController.setNavigationBarHidden(false, animated: true)
        }
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
