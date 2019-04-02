//
//  UIColor+CLExtention.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/1.
//  Copyright © 2019 cl. All rights reserved.
//

import Foundation
import UIKit

/// 常用颜色定义 小驼峰
struct CLColor {
	static let navigationColor  = UIColor.colorHex(hex: "F8F8F8")   //  导航条颜色
	static let tabbarColor      = UIColor.colorHex(hex: "F8F8F8")   //  选项栏颜色
	static let viewColor        = UIColor.colorHex(hex: "F8F8F8")   //  背景颜色
	static let lineColor        = UIColor.colorHex(hex: "C8C8C8")   //  线条颜色
	static let spaceColor       = UIColor.colorHex(hex: "FFFFFF")   //  区间颜色
	static let cellColor        = UIColor.colorHex(hex: "F8F8F8")   //  单元格颜色
	static let placeholder      = UIColor.colorHex(hex: "007070")   //  占位符字体颜色
	
	static let title            = UIColor.colorHex(hex: "242424")   //  标题的颜色
	static let text             = UIColor.colorHex(hex: "242424")   //  字体通用的颜色
	static let textNormal       = UIColor.colorHex(hex: "#BFBFBF")   //  字体正常的颜色
	static let textSelect       = UIColor.colorHex(hex: "#1E1E1E")   //  字体选中的颜色
}

// MARK: - 扩展颜色生成方法
extension UIColor {
	
	class func colorHex(hex: Int) -> UIColor {
		return self.colorHex(hex: hex, alpha: 1.0)
	}
	
	class func colorHex(hex: NSString) -> UIColor {
		return self.colorHex(hex: hex, alpha: 1.0)
	}
	
	class func colorHex(hex: NSString, alpha: CGFloat) -> UIColor {
		if hex.length < 6 {
			return UIColor.clear
		}
		let tempValue = hex.substring(from: hex.length-6)
		let hexValue = strtoul(tempValue.cString(using: String.Encoding.utf8), nil, 16)
		return self.colorHex(hex: Int(hexValue), alpha: alpha)
	}
	
	/// class类方法。十六进制颜色
	///
	/// - Parameters:
	///   - hex: 颜色值
	///   - alpha: 透明度
	/// - Returns: 颜色
	class func colorHex(hex: Int, alpha: CGFloat) -> UIColor {
		return UIColor(red: ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0,
					   green: ((CGFloat)((hex & 0xFF00) >> 8)) / 255.0,
					   blue: ((CGFloat)(hex & 0xFF)) / 255.0,
					   alpha: alpha)
	}
	
}
