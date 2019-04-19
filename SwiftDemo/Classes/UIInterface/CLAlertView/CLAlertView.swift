//
//  CLAlertView.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/11.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit


/// 可以仿照本方法自定义
func SHOW_ALERT(_ title: String,
				_ content: String,
				_ actionName: String,
				_ actionHandler: @escaping CLViodHandler
	) {
	CLAlertView.show(title, content, actionName, "取消", CLColor.textSelected, CLColor.red, actionHandler, {})
}


class CLAlertView: CLPopupView {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var contentLabel: UILabel!
	@IBOutlet weak var leftItemButton: UIButton!
	@IBOutlet weak var rightItemButton: UIButton!
	
	typealias CLViodHandler = () -> Void
	var leftActionHandler: CLViodHandler!
	var rightActionHandler: CLViodHandler!
	
	/// 显示方法
	///
	/// - Parameters:
	///   - title: 标题
	///   - content: 内容
	///   - leftItemName: 左侧按钮标题名称
	///   - rightItemName: 右侧按钮标题名称
	///   - leftItemColor: 左侧按钮字体颜色
	///   - rightItemColor: 右侧按钮字体颜色
	///   - leftActionHandler: 左侧按钮事件回调
	///   - rightActionHandler: 右侧按钮事件回调
	class func show(_ title: String,
					_ content: String,
					_ leftItemName: String,
					_ rightItemName: String,
					_ leftItemColor: UIColor,
					_ rightItemColor: UIColor,
					_ leftActionHandler: @escaping CLViodHandler,
					_ rightActionHandler: @escaping CLViodHandler) {
		let view: CLAlertView = CLAlertView.loadViewFromNib() as! CLAlertView
		view.layer.cornerRadius = 10.0
		view.layer.masksToBounds = true
		
		view.type = .alert
		view.hideWhenTouchOutside = false
		
		view.titleLabel.text = title
		view.contentLabel.text = content
		
		view.leftItemButton.setTitle(leftItemName, for: .normal)
		view.leftItemButton.setTitleColor(leftItemColor, for: .normal)
		
		view.rightItemButton.setTitle(rightItemName, for: .normal)
		view.rightItemButton.setTitleColor(rightItemColor, for: .normal)
		
		view.leftActionHandler = leftActionHandler
		view.rightActionHandler = rightActionHandler
		
		view.show()
	}

	override func show() {
		super.show()
		
		self.snp.makeConstraints { (make) in
			make.width.equalTo(300)
			make.height.equalTo(172)
		}
	}
	@IBAction func leftItemAction(_ sender: Any) {
		self.hide()
		if leftActionHandler != nil {
			leftActionHandler()
		}
	}
	@IBAction func rightItemAction(_ sender: Any) {
		self.hide()
		if rightActionHandler != nil {
			rightActionHandler()
		}
	}
}
