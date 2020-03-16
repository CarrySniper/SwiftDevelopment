//
//  CLPopupWindow.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/10.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit
import Foundation

/// 这个UIWindow有点魔性呀，不用addSubview，只要管理好isHidden属性就可以直接显示了,why?
class CLPopupWindow: UIWindow {
	
	/// 单例
	class func sharedInstance() -> CLPopupWindow {
		struct Single {
			static let instance: CLPopupWindow = CLPopupWindow.init(frame: UIScreen.main.bounds)
		}
		_ = Single.instance.setup_oncesAction
		return Single.instance
	}
	
	/// 懒加载-只执行一次的代码
	lazy var setup_oncesAction: Void = {
		
		// 显示级别statusBar以上
		self.windowLevel = UIWindow.Level.statusBar + 1
		
		// 设置背景颜色透明
		self.backgroundColor = UIColor.clear
		
		// 设rootViewController
		self.rootViewController = UIViewController.init()
		
		// 设主键并可视化，
		self.makeKeyAndVisible()
		
		// 添加遮盖层
		self.addSubview(attachedView)
	}()
	
	func updateTheView()  {
		/// 隐藏和显示
		if attachedView.subviews.count == 0 {
			attachedView.isHidden = true
			self.isHidden = true
			self.resignKey()
		} else {
			attachedView.isHidden = false
			self.isHidden = false
			self.makeKeyAndVisible()
		}
	}
	
	// MARK: - 懒加载
	// MARK: lazy var get 透明层
	lazy var attachedView: UIView = {
		let view = UIView.init(frame: UIScreen.main.bounds)
		view.backgroundColor = UIColor.init(white: 0, alpha: 0.3)
		return view
	}()
}
