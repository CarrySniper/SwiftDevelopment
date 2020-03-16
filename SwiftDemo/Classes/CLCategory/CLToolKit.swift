//
//  CLKit.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/8.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit
import Foundation

class CLToolKit: NSObject {
	struct Series {
		static var iPhoneX: Bool = false
	}
	lazy var onceAction: Void = {
		// 写下想要执行一次的代码
		Series.iPhoneX = UIView.isXSeries()
	}()
	
	public func isXSeries() -> Bool {
		_ = self.onceAction
		return Series.iPhoneX
	}
	
	
}

/// 获取当前视图控制器
func getCurrentViewController() -> UIViewController? {
	
	/// 获取当前视图控制器
	/// - Parameter rootViewController: 根视图控制器
	func getCurrentViewController(rootViewController:UIViewController?) -> UIViewController?{
		if let vc = rootViewController as? UITabBarController {
			// UITabBarController.selectedViewController就是rootVC,而不是那个UITabBarController本身
			return getCurrentViewController(rootViewController: vc.selectedViewController)
		} else if let vc = rootViewController as? UINavigationController {
			// UINavigationController.visibleViewController才是rootVC,而不是UINavigationController本身
			return getCurrentViewController(rootViewController: vc.visibleViewController)
		} else {
			if rootViewController?.presentedViewController != nil {
				return getCurrentViewController(rootViewController: rootViewController?.presentedViewController)
			} else {
				return rootViewController
			}
		}
	}
	
    var result: UIViewController? = nil
    if let window = UIApplication.shared.keyWindow {
        var keyWindow = window
     
		// UIWindow.Level window三种等级 normal，alert，statusBar,可见normal才是我们真正要用到的，这段代码就是排除其他两种level，找到所需的normalWindow
        if window.windowLevel != UIWindow.Level.normal {
            let windows = UIApplication.shared.windows
            for tmp in windows {
                if tmp.windowLevel == UIWindow.Level.normal {
                    keyWindow = tmp
                    break
                }
            }
        }
        result = getCurrentViewController(rootViewController: keyWindow.rootViewController)
    }
    return result
}


