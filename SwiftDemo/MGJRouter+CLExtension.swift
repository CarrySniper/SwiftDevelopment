//
//  MGJRouter+CLExtension.swift
//  SwiftDemo
//
//  Created by CJQ on 2020/3/13.
//  Copyright © 2020 cl. All rights reserved.
//

import Foundation
import MGJRouter_Swift

/*
使用方式
MGJRouter.registerWithHandler("mgj://category/travel") { (routerParameters) in
    print("routerParameters:\(routerParameters ?? [:])")
}
        
MGJRouter.open("mgj://category/travel", ["user_id": "1900"], nil)
*/

/// 独立模块
struct MGJApp {
	static let `default`        = "default"
	static let home             = "mgj://app/home"			// 首页
	static let about            = "mgj://app/about"			// 关于我们
	static let feedback         = "mgj://app/feedback"		// 意见反馈
	static let resetPassword    = "mgj://user/resetPassword"// 重置密码
}

/// 朋友圈模块
struct MGJMoments {
	static let `default`        = "default"
	static let home             = "mgj://moments/home"		// 首页
	static let details          = "mgj://moments/details"	// 详情
	static let publish          = "mgj://moments/publish"	// 发布
	static let edit             = "mgj://moments/edit"		// 编辑
}

/// 用户模块
struct MGJUser {
	static let `default`        = "default"
	static let home             = "mgj://user/home"			// 首页
	static let info             = "mgj://user/info"			// 个人信息
	static let edit           	= "mgj://user/edit"			// 编辑
}

extension MGJRouter {
	class func loadRegister() {
		
		let appViewControllers = [
			[MGJApp.about, CLAboutUsViewController.init()],
			[MGJApp.feedback, nil],
			[MGJApp.resetPassword, CLResetPasswordViewController.init()],
			] as! [Array<Any>]
		let userViewControllers = [
			[MGJUser.info, CLUserInfoViewController.init()],
			[MGJUser.edit, CLUserInfoEditViewController.init()],
		] as [Array<Any>]
		
		let viewControllers = appViewControllers + userViewControllers
		
		// 遍历注册路由
		for array in viewControllers {
			let urlPattern = array[0] as! String
			if let viewController = array[1] as? CLBaseViewController {
				MGJRouter.registerWithHandler(urlPattern) { (routerParameters) in
					viewController.routerParameters = routerParameters!
					getCurrentViewController()?.navigationController?.pushViewController(viewController, animated: true)
				}
			}
		}
		
//		/// 关于我们
//		MGJRouter.registerWithHandler(MGJApp.about) { (routerParameters) in
//			let viewController = CLAboutUsViewController.init()
//			viewController.routerParameters = routerParameters!
//			getCurrentViewController()?.navigationController?.pushViewController(viewController, animated: true)
//		}
	}
}
