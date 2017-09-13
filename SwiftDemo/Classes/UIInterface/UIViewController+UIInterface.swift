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
    
    /// 创建TableView
    ///
    /// - Parameter style: 样式
    /// - Returns: UITableView
    public func createTableView(style: UITableViewStyle) -> UITableView {
        let tableView = UITableView.init(frame: UIScreen.main.bounds, style: style)
        
        tableView.rowHeight = ConfigNumber.cellHeight
        tableView.tableHeaderView = UIView.init()
        
        tableView.separatorColor = Color.lineColor
        tableView.backgroundColor = Color.viewColor
        
        return tableView
    }
    
    // MARK: - UILabel
    
    /// 创建Label 默认配置
    ///
    /// - Returns: UILabel
    public func createLabel() -> UILabel {
        return self.createLabel(fontSize: 15.0)
    }
    
    /// 创建Label 默认配置，字体大小可设置
    ///
    /// - Parameter fontSize: 字体大小
    /// - Returns: UILabel
    public func createLabel(fontSize: CGFloat) -> UILabel {
        return self.createLabel(textAlignment: NSTextAlignment.left, fontSize: fontSize)
    }
    
    /// 创建Label 默认配置，字体大小／文本对齐方式可设置
    ///
    /// - Parameters:
    ///   - textAlignment: 文本对齐方式
    ///   - fontSize: 字体大小
    /// - Returns: UILabel
    public func createLabel(textAlignment: NSTextAlignment, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.textColor = Color.text
        label.textAlignment = textAlignment;
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.numberOfLines = 0
        return label
    }
    
    /// 标签式Label，只有一行，字体大小自适应
    ///
    /// - Returns: UILabel
    public func labellingOfLabel() -> UILabel {
        let label = self.createLabel()
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        return label
    }
    
    /// 创建Button 默认配置
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - action: 动作，必须实现里面的方法
    /// - Returns: UIButton
    public func createButton(title: String, action: Selector) -> UIButton {
        return self.createButton(title: title, image: UIImage(), action: action)
    }
    
    /// 创建Button 默认配置，字体可设置
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - image: 图标
    ///   - action: 动作，必须实现里面的方法
    /// - Returns: UIButton
    public func createButton(title: String, image: UIImage, action: Selector) -> UIButton {
        return self.createButton(title: title, image: image, fontSize: 15.0, action: action)
    }
    
    
    /// 创建Button 默认配置，字体/图标可设置
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - image: 图标
    ///   - fontSize: 字体大小
    ///   - action: 动作，必须实现里面的方法
    /// - Returns: UIButton
    public func createButton(title: String, image: UIImage, fontSize: CGFloat, action: Selector) -> UIButton {
        let button = UIButton.init(type: UIButtonType.custom)
        button.backgroundColor = Color.navigationColor
        button.layer.cornerRadius = ConfigNumber.cornerRadius
        button.layer.masksToBounds = true
        button.setTitle(title, for: UIControlState.normal)
        button.setTitleColor(Color.textNormal, for: UIControlState.normal)
        button.setTitleColor(Color.textSelect, for: UIControlState.selected)
        button.setImage(image, for: UIControlState.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        button.addTarget(self, action: action, for: UIControlEvents.touchUpInside)
        return button
    }
   
}
