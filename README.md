# SwiftDemo
用于了解Swift的例子，很有作用，学习过程中会更新。看到的人如果觉得好，要记得做点什么哦！<br>
LY为女票名字

##学习从此刻开始（时间倒序）

####2017-01-16
百度经验：iOS开发 Swift添加CocoaPods依赖库管理 <br>

可查找文件文件Podfile
```
# Uncomment the next line to define a global platform for your project

platform :ios, '8.0'

target 'SwiftDemo' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!


  # Pods for SwiftDemo
  
  pod 'Alamofire'           # 网络请求库
  pod 'SwiftyJSON'          # Json解析库
  
end
```
百度经验：iOS开发 Swift自定义UITabBarController <br>

可查找文件文件TabBarManager.swift
```
    /// 自定义UITabBar
    ///
    /// - Parameter selectedIndex: 选中下标 从0开始
    func customTabbar(selectedIndex:NSInteger)
    
    override func viewDidLoad()
```
####2017-01-13
百度经验：iOS开发 Swift去除Main.storyboard <br>
http://jingyan.baidu.com/article/9faa7231935a97473c28cbdb.html

可查找文件文件AppDelegate.swift
```
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = ViewController()
    window?.makeKeyAndVisible()
```
百度经验：iOS开发 CocoaPods安装、移除和常见问题 <br>
http://jingyan.baidu.com/article/c1a3101e5aeab3de656debe5.html

仿OC的宏定义，利用结构体和静态变量定义全局属性。<br>
如：颜色，可查找文件LYColor.swift
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
