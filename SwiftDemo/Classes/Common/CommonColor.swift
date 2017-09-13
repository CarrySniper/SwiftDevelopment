//
//  CommonColor.swift
//  SwiftDemo
//
//  Created by 炬盈科技 on 2017/8/31.
//  Copyright © 2017年 CJQ. All rights reserved.
//

import Foundation
import UIKit

// 常用颜色 小驼峰
struct Color {
    
    static let navigationColor  = CLColorHex(value: "F8F8F8")   //  导航条颜色
    static let tabbarColor      = CLColorHex(value: "F8F8F8")   //  选项栏颜色
    static let viewColor        = CLColorHex(value: "F8F8F8")   //  背景颜色
    static let lineColor        = CLColorHex(value: "C8C8C8")   //  线条颜色
    
    static let title            = CLColorHex(value: "242424")   //  标题的颜色
    static let text             = CLColorHex(value: "242424")   //  字体通用的颜色
    static let textNormal       = CLColorHex(value: "9B9B9B")   //  字体正常的颜色
    static let textSelect       = CLColorHex(value: "9013FE")   //  字体选中的颜色
    
}

/// //十六进制颜色转换成UIColor
///
/// - Parameter value: 十六进制字符串  如："2B2B2B"
/// - Parameter alpha: 透明度  0.0 ~ 1.0
/// - Returns: UIColor
func CLColorHex(value: NSString) -> UIColor {
    return CLColorHex(value: value, alpha:1.0)
}

func CLColorHex(value: NSString, alpha: CGFloat) -> UIColor {
    let hexValue = strtoul(value.cString(using: String.Encoding.utf8.rawValue), nil, 16)
    return UIColor(red: ((CGFloat)((hexValue & 0xFF0000) >> 16)) / 255.0,
                   green: ((CGFloat)((hexValue & 0xFF00) >> 8)) / 255.0,
                   blue: ((CGFloat)(hexValue & 0xFF)) / 255.0,
                   alpha: alpha)
}
