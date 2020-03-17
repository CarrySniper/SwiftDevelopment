//
//  Config.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/1.
//  Copyright © 2019 cl. All rights reserved.
//

import Foundation
import UIKit

//Objective-C一直以来令人诟病的地方就是没有命名空间，在应用开发时，所有的代码和引用的静态库最终都会被编译到同一个域和二进制中。这样的后果是一旦我们有重复的类名的话，就会导致编译出错和冲突。为了避免这种情况，Objective-C的类型一般都会加上两到三个字母的前缀，比如Apple保留的NS和UI前缀，各个系统框架的前缀SK(StoreKit),CG(CoreGraphic)等。
//在Swift中，由于可以使用命名空间了，即使是名字相同的类型，只要是来自不同的命名空间的话，都是可以和平共处的。

/// APP多地方都要用的第三方库，每个地方都去导入又非常麻烦
@_exported import MGJRouter_Swift
@_exported import AVOSCloud

var CLAppDelegate = UIApplication.shared.delegate as! AppDelegate

/// APP固定信息
struct AppStore {
	// 这个用大写开头吧，规则也有例外，Apple、AppStore
	static let AppleID: String          = "1008611"
	static let AppStoreUrl: String		= "https://itunes.apple.com/cn/lookup?id="
	static let protocolUrl: String      = "https://github.com/CarrySniper"
}

struct  AppInfo {
    static let infoDictionary = Bundle.main.infoDictionary
    
    static let appDisplayName: String = Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String //App 名称（要确保info.plist文件有Bundle display name项，否则获取失败）
    
    static let bundleIdentifier:String = Bundle.main.bundleIdentifier! // Bundle Identifier
    
    static let appVersion:String = Bundle.main.infoDictionary! ["CFBundleShortVersionString"] as! String// App 版本号
    
    static let buildVersion : String = Bundle.main.infoDictionary! ["CFBundleVersion"] as! String //Bulid 版本号
    
    static let iOSVersion:String = UIDevice.current.systemVersion //ios 版本
    
    static let identifierNumber = UIDevice.current.identifierForVendor //设备 udid
    
    static let systemName = UIDevice.current.systemName //设备名称
    
    static let model = UIDevice.current.model // 设备型号
    
    static let localizedModel = UIDevice.current.localizedModel  //设备区域化型号
}

/// LeanCloud相关
struct LeanCloud {
	static let appId: String          = "N8EhB1MGy4Qk4bpLU938qrIm-gzGzoHsz"
	static let appKey: String         = "viLlETQ2VxwRnEFFWlrBhOXg"
	static let serverURL: String         = "https://n8ehb1mg.lc-cn-n1-shared.com"
	static let phone: String          = "18566668888"
}

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
	static let emptyData                	= "没有相关数据"
	
}

/// 通知
struct ConfigNotification {
	
	static let `default`                    = "default"
	static let toLogin                      = "ConfigNotification.toLogin"
}

/// 图片
struct ConfigImage {
	
	static let `default`                    = UIImage.init(named: "default")
	static let appIcon                      = UIImage.init(named: "AppIcon")
	static let avatar                       = UIImage.init(named: "avatar")
	static let emptyData                    = UIImage.init(named: "empty_content")
}

typealias CLViodHandler = () -> Void
typealias CLBoolHandler = (_ success: Bool) -> Void
typealias CLStringHandler = (_ text: String) -> Void
typealias CLImageHandler = (_ image: UIImage) -> Void

/// 功能设置列表类型
enum CLUserSettingType: Int {
	case about 			// 关于我们
	case cleanCache 	// 清理缓存
	case collect		// 我的收藏
	case fansList  		// 我的粉丝
	case feedback 		// 意见反馈
	case follow  		// 我的关注
	case message		// 我的消息
	case setting		// 系统设置
	case publish  		// 我的发布
	case password 		// 修改密码
}
