//
//  CLBaseViewController.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/1.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit

class CLBaseViewController: UIViewController {
	
	/// 状态栏文字颜色设置，见CLBaseNavigationController.swift
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .default
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		/// 视图背景颜色
		self.view.backgroundColor = CLColor.viewColor
		/// 隐藏导航栏的返回按钮
		self.navigationItem.hidesBackButton = true
		/// 导航栏返回按钮设置，自定义返回按钮将失去边沿左滑返回功能
		if (self.navigationController?.viewControllers.count == 0) {
			self.navigationItem.leftBarButtonItem = nil
		}else{
			let leftBarItem = UIBarButtonItem.init(image: UIImage.init(named: "navigation_back"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(customBack))
			leftBarItem.imageInsets = UIEdgeInsets.init(top: 0, left: -5, bottom: 0, right: 0)
			self.navigationItem.leftBarButtonItem = leftBarItem
		}
    }
	
	/// 视图将要展现
	///
	/// - Parameter animated: 是否有动画
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.navigationController?.navigationBar.isHidden = false
		self.navigationController?.navigationBar.isTranslucent = false
		self.navigationController?.navigationBar.shadowImage = nil
		self.navigationController?.navigationBar.setBackgroundImage(UIImage.navigationImage(), for: UIBarMetrics.default)
		
		self.navigationController?.navigationBar.tintColor = CLColor.title
		self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:CLColor.title,NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20)]
		
	}
	
	@objc func customBack() {
		if self.navigationController != nil && (self.navigationController?.viewControllers.count)! > 1 {
			self.navigationController?.popViewController(animated: true)
		} else {
			self.dismiss(animated: true) {}
		}
	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesBegan(touches, with: event)
		
		self.view.endEditing(false)
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
