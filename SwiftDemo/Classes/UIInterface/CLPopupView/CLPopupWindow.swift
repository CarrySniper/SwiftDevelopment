//
//  CLPopupWindow.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/10.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit
import Foundation

/// 这个UIWindow有点魔性呀，不用addSubview，只要管理好isHidden属性就可以直接显示了
class CLPopupWindow: UIWindow, UIGestureRecognizerDelegate {
	
	/// 附件视图
//	var attachedView: UIView {
//		return self.rootViewController!.view
//	}
	// lazy var get
	lazy var attachedView: UIView = {
		let view = UIView.init(frame: UIScreen.main.bounds)
		view.backgroundColor = UIColor.init(white: 0, alpha: 0.5)
		return view
	}()
	
	/// 单例
	class func sharedInstance() -> CLPopupWindow {
		struct Single {
			static let instance: CLPopupWindow = CLPopupWindow()
		}
		_ = Single.instance.setup_oncesAction
		return Single.instance
	}
	
	/// 懒加载-只执行一次的代码
	lazy var setup_oncesAction: Void = {
		// 写下想要执行一次的代码
		
		// 设rootViewController，才能保证状态栏颜色保持一致
		self.rootViewController = UIApplication.shared.keyWindow!.rootViewController
		
		// 显示级别alert或statusBar
		self.windowLevel = UIWindow.Level.alert
		
		self.backgroundColor = UIColor.clear
		self.makeKeyAndVisible()
		
		self.addSubview(attachedView)
	}()
	
	func reloadView()  {
		if attachedView.subviews.count == 0 {
			attachedView.isHidden = true
			self.isHidden = true
			UIApplication.shared.keyWindow?.makeKeyAndVisible()
		} else {
			attachedView.isHidden = false
			self.isHidden = false
			self.makeKeyAndVisible()
		}
	}
	
}
