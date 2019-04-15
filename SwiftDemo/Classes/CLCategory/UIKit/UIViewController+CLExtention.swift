//
//  UIViewController+CLExtention.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/9.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit


// MARK: - 扩展方法
extension UIViewController {
	class func loadViewControllerFromName(_ className: String) -> UIViewController? {
		// 1.获取命名空间
		guard let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
			print("命名空间不存在")
			return nil
		}
		// 2.通过命名空间和类名转换成类
		let NewClass : AnyClass? = NSClassFromString((namespace as! String) + "." + className)
		
		// 3.Swift中通过Class创建一个对象,必须告诉系统Class的类型
		guard let classType = NewClass as? UIViewController.Type else {
			print("无法转换成UIViewController")
			return nil
		}
		
		// 4.通过Class创建对象
		let viewController = classType.init()
		return viewController
	}
}
