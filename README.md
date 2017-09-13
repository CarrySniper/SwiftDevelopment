# SwiftDemo

>用于了解Swift的例子，很有作用，学习过程中会更新。看到的人如果觉得好，要记得做点什么哦！<br>
CL为个人特殊名字

## 学习从此刻开始（时间倒序）

#### 2017-09-13（周三）
图标使用PDF格式（矢量），个人使用Sketch软件制作并生成导出。<br>
——听说苹果建议图标使用PDF格式，虽占用内存可能多（可能：不一定多），但只需要一张图，不需要区分@1x、@2x、@3x，直接一张.pdf矢量图就可以了。

#### 2017-09-12（周二）
1、添加公共基类，前缀：Common（通常使用Base）<br>
2、添加UI交互类，UIInterface（通常使用UI），顺便添加扩展Extension（Objective-C中为Category）<br>
![](https://github.com/cjq002/SwiftDemo/raw/master/Media/common.png) 

#### 2017-01-16（周一）
>百度经验：iOS开发 Swift添加CocoaPods依赖库管理 <br>
http://jingyan.baidu.com/article/4f34706e2eee45e387b56dc0.html

可查找文件文件Podfile
```swift
platform :ios, '8.0'

target 'SwiftDemo' do
  use_frameworks!
  # Pods for SwiftDemo
  pod 'Alamofire'           # 网络请求库
  pod 'SwiftyJSON'          # Json解析库
  pod 'SnapKit'             # UI约束
end
```
>百度经验：iOS开发 Swift纯代码管理UITabBarController <br>

可查找文件文件TabBarManager.swift
```swift
/// 自定义UITabBar
/// - Parameter selectedIndex: 选中下标 从0开始
func customTabbar(selectedIndex:NSInteger)
    
override func viewDidLoad()
```
#### 2017-01-13（周五）
>百度经验：iOS开发 Swift去除Main.storyboard <br>
http://jingyan.baidu.com/article/9faa7231935a97473c28cbdb.html

可查找文件：AppDelegate.swift
```swift
window = UIWindow(frame: UIScreen.main.bounds)
window?.rootViewController = ViewController()
window?.makeKeyAndVisible()
```
>百度经验：iOS开发 CocoaPods安装、移除和常见问题 <br>
http://jingyan.baidu.com/article/c1a3101e5aeab3de656debe5.html


仿OC的宏定义，利用结构体和静态变量定义全局属性。<br>
如：颜色，可查找文件CommonColor.swift
```swift
import Foundation
import UIKit

// 常用颜色 小驼峰
struct Color {   
    static let textNormal   = CLColorHex(value: "AEAEAE")   //  字体正常的颜色
    static let textSelect   = CLColorHex(value: "D6BD99")   //  字体选中的颜色    
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
```
使用方法：
```swift
let myColor = Color.textNormal
```
