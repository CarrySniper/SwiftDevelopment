

import Foundation
import UIKit

// 常用颜色 小驼峰
struct Color {
    
    static let nav          = LYColorHex(value: "242424")   //  导航条颜色
    static let tabber       = LYColorHex(value: "242424")   //  tabbar颜色
    
    static let textNormal   = LYColorHex(value: "AEAEAE")   //  字体正常的颜色
    static let textSelect   = LYColorHex(value: "D6BD99")   //  字体选中的颜色
    
}



/// //十六进制颜色转换成UIColor
///
/// - Parameter value: 十六进制字符串  如："2B2B2B"
/// - Returns: UIColor
func LYColorHex(value: NSString) -> UIColor {
    let hexValue = strtoul(value.cString(using: String.Encoding.utf8.rawValue), nil, 16)
    return UIColor(red: ((CGFloat)((hexValue & 0xFF0000) >> 16)) / 255.0,
                   green: ((CGFloat)((hexValue & 0xFF00) >> 8)) / 255.0,
                   blue: ((CGFloat)(hexValue & 0xFF)) / 255.0,
                   alpha: 1.0)
}
