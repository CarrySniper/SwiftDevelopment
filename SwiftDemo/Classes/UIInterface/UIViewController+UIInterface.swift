//
//  UIViewController+UIInterface.swift
//  SwiftDemo
//
//  Created by 炬盈科技 on 2017/8/31.
//  Copyright © 2017年 CJQ. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    public func createTableView(style : UITableViewStyle) -> UITableView {
        let tableView = UITableView.init(frame: UIScreen.main.bounds, style: style)
        
        tableView.rowHeight = ConfigNumber.cellHeight
        tableView.tableHeaderView = UIView.init()
        
        tableView.separatorColor = Color.line
        tableView.backgroundColor = Color.bg
        
        return tableView
    }
}
