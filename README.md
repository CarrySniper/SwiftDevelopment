# SwiftDemo

>用于了解Swift的例子，很有作用，学习过程中会更新。慢慢养成看[Wiki](https://github.com/cjq002/SwiftDemo/wiki)的习惯。<br>
CL为个人特殊名字，不是说Swift有命名空间后就不需要前缀之类的。Swift 5发布，工程项目得新建才能更好地适配。
最近Objective C语言偏向MVVM架构，所以Swift一起转向MVVM。

## 学习从此刻开始（时间倒序）

#### 2019-04-15（周一）
自定义Web视图控制器，带进度条progress，动态显示标题title。
[CLWebViewController.swift](https://github.com/cjq002/SwiftDemo/wiki/功能-WebView)

#### 2019-04-12（周五）
自定义AlertView，学习UIWindow属性，遮挡状态栏
```swift 
extension UIWindow.Level {

    public static let normal: UIWindow.Level

    public static let alert: UIWindow.Level

    public static let statusBar: UIWindow.Level
}
}

#### 2019-04-10（周三）
自定义协议代理protocol，实现optional可选方法（extension扩展实现了需要标记的optional可选方法）。
如下：cl_emptyViewDataSource()方法必须实现，cl_emptyViewOffset()是可实现可不实现。
```swift 
 /// protocol代理
public protocol CLEmptyDataSource {

  func cl_emptyViewDataSource(_ scrollView: UIScrollView) -> UIView?
  
  func cl_emptyViewOffset(_ scrollView: UIScrollView) -> CGPoint?
}

/// 让CLEmptyDataSource的代理方法变可以选实现
extension CLEmptyDataSource {

  func cl_emptyViewOffset(_ scrollView: UIScrollView) -> CGPoint? {
    return nil
  }
}
```

#### 2019-04-08（周一）
重写UITextView，增加上placeholder和placeholderColor属性
1、学会重写set、get方法。Swift 5 推荐
```swift 
  /** 占位文字 */
  var placeholder: String? {
    didSet {
      self.setNeedsDisplay()
    }

  }
  /** 占位文字颜色 */
  var placeholderColor: UIColor? {
    didSet {
      self.setNeedsDisplay()
    }
  }
```
2、draw in方法绘制内容
```swift
// 属性
let attributes = [NSAttributedString.Key.foregroundColor: self.placeholderColor as Any, NSAttributedString.Key.font: self.font as Any]
    
// 画文字
var tempFrame: CGRect = rect
tempFrame.origin.x = 5
tempFrame.origin.y = 8
tempFrame.size.width -= 2 * tempFrame.origin.x
self.placeholder?.draw(in: tempFrame, withAttributes: attributes)
```

#### 2017-09-15（周五）
1、学习Swift闭包，ypealias定义。<br>
2、获取相机相册图片<br>
详情请查询:[Wiki 2017 0915](https://github.com/cjq002/SwiftDemo/wiki)

#### 2017-09-14（周四）
1、设置UI主色调为系统默认颜色<br>
2、实现UITableView分组<br>
3、个人栏目头像显示和导航栏透明+半透明效果。<br>
>优化导航栏透明效果状态下，UINavigationController出入栈的NavigationBar显示。
isTranslucent = false，近乎完美，当然默认半透明效果就没有了。

导航栏隐藏主要代码：
```swift
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        if self.isEqual(viewController) {
            navigationController.setNavigationBarHidden(true, animated: true)
        }else{
            navigationController.setNavigationBarHidden(false, animated: true)
        }
    }
```

#### 2017-09-13（周三）
图标使用PDF格式（矢量），个人使用Sketch软件制作并生成导出。<br>
——听说苹果建议图标使用PDF格式，虽占用内存可能多（可能：不一定多），但只需要一张图，不需要区分@1x、@2x、@3x，只留一张All-Universal图就可以了。

<需要矢量图尺寸按@1x（UIImageView大小为30，即30x30）来算；
将PDF图放到Assets.xcassets里面，并且设置Image Set->Scales为Single Scale。

#### 2017-09-12（周二）
1、添加公共基类，前缀：CLBase（通常使用Base,避免和别人的基类同名冲突，加上CL）<br>
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

可查找文件文件CLTabBarController.swift
```swift
/// 自定义UITabBar
/// - Parameter selectedIndex: 选中下标 从0开始
tabBarController = CLTabBarController()
tabBarController?.selectedIndex = 1
window?.rootViewController = tabBarController
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
详情请查询:[Wiki 2017 0113](https://github.com/cjq002/SwiftDemo/wiki)
