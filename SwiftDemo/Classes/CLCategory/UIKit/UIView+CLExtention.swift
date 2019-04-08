//
//  UIView+CLExtention.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/8.
//  Copyright © 2019 cl. All rights reserved.
//

import Foundation
import UIKit

func SCREEN_BOUNDS() -> CGRect {
	return UIScreen.main.bounds
}

func SCREEN_WIDTH() -> CGFloat {
	return UIScreen.main.bounds.size.width
}

func SCREEN_HEIGHT() -> CGFloat {
	return UIScreen.main.bounds.size.height
}

/// 是否是iPhone X系列，有安全区域
///
/// - Returns: 是或否
func IS_IPHONE_X_SERIES() -> Bool {
	return UIView.isXSeries()
}

/// 结构体，Frame值
struct CLFrame {
	static let safeAreaTop  	= UIView.isXSeries() ? 24.0 : 0.0
	static let safeAreaBottom   = UIView.isXSeries() ? 34.0 : 0.0
	
	static let statusBarHeight  = 20.0 + safeAreaTop
	static let navigationBarHeight  = 64.0 + safeAreaTop
	static let tabbarBarHeight  = 49.0 + safeAreaTop
}

// MARK: - 扩展方法
extension UIView {
	
	
	/// 类方法：是否是iPhone X系列，有安全区域
	///
	/// - Returns: 是或否
	class func isXSeries() -> Bool {
		if #available(iOS 11.0, *) {
			let window: UIWindow = ((UIApplication.shared.delegate?.window)!)!
			if window.safeAreaInsets.bottom > 0.0 {
				return true
			}
		}
		return false
	}
}


