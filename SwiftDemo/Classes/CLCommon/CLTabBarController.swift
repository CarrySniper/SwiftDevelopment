//
//  CLTabBarController.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/1.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit

class CLTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		self.setup()
		
		var dataArray = Array<Array<String>>()
		dataArray = [["Home", "CLMainHomeViewController"],
					 ["User", "CLUserHomeViewController"],]
		
		
		for (index, item) in dataArray.enumerated() {
			print(index, item)
			let normalImageName = "tabbar_normal" + String(index)
			let selectedImageName = "tabbar_selected" + String(index)
			
			let viewController = self.makeViewController(className: item.last!, title: item.first!, normalImageName: normalImageName, selectedImageName: selectedImageName)
			let navigationController = CLNavigationController.init(rootViewController: viewController)
			self.addChild(navigationController)
		}
    }
    
	/// 配置
	private func setup() {
		// tabBar是否半透明
		self.tabBar.isTranslucent = false
		
		// tabBar背景颜色
		self.tabBar.barTintColor = CLColor.tabbarColor;
		
		// UITabBarItem字体和颜色
		let attributesNormal =  [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 10),
								 NSAttributedString.Key.foregroundColor:CLColor.textNormal]
		let attributesSelected =  [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 10),
								   NSAttributedString.Key.foregroundColor:CLColor.textSelected]
		
		UITabBarItem.appearance().setTitleTextAttributes(attributesNormal, for: UIControl.State.normal)
		UITabBarItem.appearance().setTitleTextAttributes(attributesSelected, for: UIControl.State.selected)
	}
	
	private func makeViewController(className: String, title: String, normalImageName: String, selectedImageName: String) -> UIViewController {
		// 1.获取命名空间
		guard let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
			NSLog("命名空间不存在")
			return UIViewController.init()
		}
		// 2.通过命名空间和类名转换成类
		let NewClass : AnyClass? = NSClassFromString((namespace as! String) + "." + className)
		
		// swift 中通过Class创建一个对象,必须告诉系统Class的类型
		guard let classType = NewClass as? UIViewController.Type else {
			NSLog("无法转换成UIViewController")
			return UIViewController.init()
		}
		
		// 3.通过Class创建对象
		let viewController = classType.init()
		
		// nav、tab标题
		viewController.title = title;
		// tabbar正常图标
		viewController.tabBarItem.image = UIImage(named: normalImageName)?.withRenderingMode(.alwaysOriginal)
		// tabbar选中图标
		viewController.tabBarItem.selectedImage = UIImage(named: selectedImageName)?.withRenderingMode(.alwaysOriginal)
		
//		//controller.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);

		return viewController
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
