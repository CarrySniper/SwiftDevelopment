//
//  Config.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/1.
//  Copyright © 2019 cl. All rights reserved.
//

import Foundation
import UIKit

/// LeanCloud相关
struct LeanCloud {
	static let appId: String          = "gcB1d0kP6vyUCtyIpeEaXUEq-gzGzoHsz"
	static let appKey: String         = "3tkTIsfIhNEtCpE9KLJ9NmUx"
}

typealias CLViodHandler = () -> Void
typealias CLBoolHandler = (_ success: Bool) -> Void

/// 数值
struct ConfigNumber {
	static let cellHeight: CGFloat          = 50.0
	static let spaceHeight: CGFloat         = 8.0
	static let cornerRadius: CGFloat        = 5.0
}

/// API字段
struct ConfigAPIField {
	
	static let Id                           = "Id"
	static let Name                         = "Name"
	static let Status                       = "Status"
}

/// 文本
struct ConfigText {
	
	static let `default`                    = "default"
	static let loading                		= "数据加载中"
	
}

/// 通知
struct ConfigNotification {
	
	static let `default`                    = "default"
	static let toLogin                      = "ConfigNotification.toLogin"
}

/// 图片
struct ConfigImage {
	
	static let `default`                    = UIImage.init(named: "default")
	static let appIcon                      = UIImage.init(named: "appIcon")
	static let avatar                       = UIImage.init(named: "avatar")
}

