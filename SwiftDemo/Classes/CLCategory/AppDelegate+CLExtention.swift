//
//  AppDelegate+CLExtention.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/1.
//  Copyright © 2019 cl. All rights reserved.
//

import Foundation
import UIKit
import AVOSCloud

extension AppDelegate {
	
	
	/// 配置应用
	func configApplication() {
		// 设置输入光标颜色
		UITextView.appearance().tintColor = CLColor.textSelected
		UITextField.appearance().tintColor = CLColor.textSelected
		
		CLToastView.setBackgroundColor(CLColor.red)
		CLToastView.setTextColor(UIColor.white)
		
		NotificationCenter.default.addObserver(self, selector: #selector(notificationToLogin), name: NSNotification.Name(rawValue: ConfigNotification.toLogin), object: nil)
		
		
		
		self.registerApp()
		
		self.setupTabBar()
	}
	
	func setupTabBar() {
		
		tabBarController = CLTabBarController()
		tabBarController?.selectedIndex = 1
		window?.rootViewController = tabBarController
		window?.makeKeyAndVisible()
	}
	
	func registerApp() {
		AVOSCloud.setApplicationId(LeanCloud.appId, clientKey: LeanCloud.appKey)
	}
	
	
	/// 通知去登录页
	class func postNotificationToLoginPage() {
		// 发送通知方法
		NotificationCenter.default.post(name: NSNotification.Name(rawValue: ConfigNotification.toLogin), object: nil)
	}
	
	
	/// 接受到通知后的方法回调
	@objc private func notificationToLogin(notification: Notification) {
		DispatchQueue.main.async(execute: {
			
			//如果已经弹出登录页 则不再弹出
			if self.window?.rootViewController?.presentedViewController != nil {
				let navigationController = self.window?.rootViewController?.presentedViewController as! UINavigationController
				if navigationController.viewControllers.first is CLLoginViewController {
					return
				}
			}
			
			let viewController = CLLoginViewController.init()
			let navigationController = CLBaseNavigationController.init(rootViewController: viewController)
			self.window?.rootViewController?.present(navigationController, animated: true, completion: {
				
			})
		})
	}
}
