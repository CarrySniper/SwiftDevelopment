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
	static let navigationColor  = UIColor.colorHex("FFFFFF")   //  导航条颜色
	static let tabbarColor      = UIColor.colorHex("F8F8F8")   //  选项栏颜色
	static let viewColor        = UIColor.colorHex("F8F8F8")   //  背景颜色
	static let lineColor        = UIColor.colorHex("E5E5E5")   //  线条颜色
	static let spaceColor       = UIColor.colorHex("F8F8F8")   //  区间颜色
	static let cellColor        = UIColor.colorHex("FFFFFF")   //  单元格颜色
	static let placeholder      = UIColor.colorHex("707070")   //  占位符字体颜色
	
	static let lightGray      	= UIColor.colorHex("999999")   //  浅灰颜色
	static let gray      		= UIColor.colorHex("666666")   //  灰颜色
	static let black      		= UIColor.colorHex("333333")   //  黑颜色
	static let red      		= UIColor.colorHex("FF473D")   //  红颜色
	
	static let title            = UIColor.colorHex("242424")   //  标题的颜色
	static let content          = UIColor.colorHex("999999")   //  内容的颜色
	
	static let textNormal       = UIColor.colorHex("#BFBFBF")   //  字体正常的颜色
	static let textSelected     = UIColor.colorHex("#1E1E1E")   //  字体选中的颜色
}

// MARK: - 扩展颜色生成方法
extension UIColor {
	
	class func colorHex(_ hex: Int) -> UIColor {
		return self.colorHex(hex, 1.0)
	}
	
	class func colorHex(_ hex: NSString) -> UIColor {
		return self.colorHex(hex, 1.0)
	}
	
	class func colorHex(_ hex: NSString, _ alpha: CGFloat) -> UIColor {
		if hex.length < 6 {
			return UIColor.clear
		}
		let tempValue = hex.substring(from: hex.length-6)
		let hexValue = strtoul(tempValue.cString(using: String.Encoding.utf8), nil, 16)
		return self.colorHex(Int(hexValue), alpha)
	}
	
	/// class类方法。十六进制颜色
	///
	/// - Parameters:
	///   - hex: 颜色值
	///   - alpha: 透明度
	/// - Returns: 颜色
	class func colorHex(_ hex: Int, _ alpha: CGFloat) -> UIColor {
		return UIColor(red: ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0,
					   green: ((CGFloat)((hex & 0xFF00) >> 8)) / 255.0,
					   blue: ((CGFloat)(hex & 0xFF)) / 255.0,
					   alpha: alpha)
	}
	
}
