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

///
struct MGJUser {
	static let `default`        = "default"
	static let home             = "mgj://user/home"
	static let info             = "mgj://user/info"
	static let profile          = "mgj://user/profile"
	static let edit           	= "mgj://user/edit"
}

extension MGJRouter {
	class func loadRegister() {
		/// 用户信息
		MGJRouter.registerWithHandler(MGJUser.info) { (routerParameters) in
			let viewController = CLUserInfoViewController.init() 
			viewController.routerParameters = routerParameters!
			getCurrentViewController()?.navigationController?.pushViewController(viewController, animated: true)
		}
		/// 用户信息编辑
		MGJRouter.registerWithHandler(MGJUser.edit) { (routerParameters) in
			let viewController = CLUserInfoEditViewController.init()
			viewController.routerParameters = routerParameters!
			getCurrentViewController()?.navigationController?.pushViewController(viewController, animated: true)
		}
		
	}
}
