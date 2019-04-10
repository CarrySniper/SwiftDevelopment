//
//  CLBaseNavigationController.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/2.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit

class CLBaseNavigationController: UINavigationController, UINavigationControllerDelegate {
	
	/// 防止多次push一个页面
	var isPushing: Bool = false
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		self.delegate = self
    }
    
	override func pushViewController(_ viewController: UIViewController, animated: Bool) {
		if isPushing == true {
			print("被拦截: \(type(of: viewController))")
		} else {
			if self.viewControllers.count > 0 {
				isPushing = true
			}
		}
		if self.viewControllers.count > 0 {
			viewController.hidesBottomBarWhenPushed = true
		}
		super.pushViewController(viewController, animated: animated)
	}
	
	func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
		isPushing = false
	}
	
	// 重写这两个方法，状态栏颜色才可以修改.删除 info.plist view controller-based status bar appearance的设置
	override var childForStatusBarHidden: UIViewController? {
		return self.topViewController
	}
		
	override var childForStatusBarStyle: UIViewController? {
		return self.topViewController
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
