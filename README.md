# SwiftDemo
用于了解Swift的例子，很有作用，学习过程中会更新。看到的人如果觉得好，要记得做点什么哦！


##学习从此刻开始（时间倒序）

####2017-01-13
百度经验：iOS开发 Swift去除Main.storyboard <br>
http://jingyan.baidu.com/article/9faa7231935a97473c28cbdb.html

仿OC的宏定义，利用结构体和静态变量定义全局属性。<br>
如：颜色
```
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
```
使用方法：
```
let myColor = Color.textNormal
```
