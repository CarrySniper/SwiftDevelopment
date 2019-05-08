//
//  UIAlertController+CLExtention.swift
//  SwiftDemo
//
//  Created by CL on 2019/5/8.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit

/*
//Custom Title,使用富文本来改变title的字体大小
[alertController setValue:NSMutableAttributedString forKey:@"attributedTitle"];
[alertController setValue:NSMutableAttributedString forKey:@"attributedMessage"];
alertController.view.layer.cornerRadius = 15;
alertController.view.backgroundColor = [UIColor redColor] ;

//Custom Action,改变按钮属性
[cancelAction setValue:COLOR_GRAY forKey:@"_titleTextColor"];
[cancelAction setValue:[NSNumber numberWithInteger:NSTextAlignmentLeft] forKey:@"titleTextAlignment"];
*/

// MARK: - 扩展方法
extension UIAlertController {

	/// 警告框，默认只有一个确认键
	///
	/// - Parameters:
	///   - title: 标题
	///   - message: 描述信息
	///   - actionHander: 处理事件回调
	class func showAlert(title: String?, message: String?, actionHander: ((UIAlertAction) -> Void)?) {
		let alertController = UIAlertController.init(title: title, message: message
			, preferredStyle: UIAlertController.Style.alert)
		
		let cancelAction = UIAlertAction.init(title: "确认", style: UIAlertAction.Style.cancel, handler: actionHander)
		cancelAction.setValue(CLColor.gray, forKey: "titleTextColor")
		alertController.addAction(cancelAction)
		
		UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
	}
	
	/// 警告框，默认左侧取消
	///
	/// - Parameters:
	///   - title: 标题
	///   - message: 描述信息
	///   - handerName: 事件显示名称
	///   - actionHander: 处理事件回调
	class func showAlert(title: String?, message: String?, handerName: String?, actionHander: ((UIAlertAction) -> Void)?) {
		let alertController = UIAlertController.init(title: title, message: message
			, preferredStyle: UIAlertController.Style.alert)
		if (handerName != nil) {
			let optionAction = UIAlertAction.init(title: handerName, style: UIAlertAction.Style.default, handler: actionHander)
			optionAction.setValue(CLColor.red, forKey: "titleTextColor")
			alertController.addAction(optionAction)
		}
		let cancelAction = UIAlertAction.init(title: "取消", style: UIAlertAction.Style.cancel, handler:nil)
		cancelAction.setValue(CLColor.gray, forKey: "titleTextColor")
		alertController.addAction(cancelAction)
		
		UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
	}

	/// 菜单框，默认底部取消
	///
	/// - Parameters:
	///   - title: 标题
	///   - message: 描述信息
	///   - handerNameArray: 事件显示名称数组
	///   - actionHander: 处理事件回调
	class func showSheet(title: String?, message: String?, handerNameArray: [String]?, actionHander: ((UIAlertAction, Int) -> Void)?) {
		let alertController = UIAlertController.init(title: title, message: message
			, preferredStyle: UIAlertController.Style.actionSheet)
		
		for handerName in handerNameArray! {
			let optionAction = UIAlertAction.init(title: handerName, style: UIAlertAction.Style.default) { (alertAction) in
				if (actionHander != nil) {
					let array: NSArray = handerNameArray! as NSArray
					actionHander!(alertAction, array.index(of: alertAction.title as Any))
				}
			}
			optionAction.setValue(CLColor.red, forKey: "titleTextColor")
			alertController.addAction(optionAction)
		}
		let cancelAction = UIAlertAction.init(title: "取消", style: UIAlertAction.Style.cancel, handler:nil)
		cancelAction.setValue(CLColor.gray, forKey: "titleTextColor")
		alertController.addAction(cancelAction)

		UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
	}
}
