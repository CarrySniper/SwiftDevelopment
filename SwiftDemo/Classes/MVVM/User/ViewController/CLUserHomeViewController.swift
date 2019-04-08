//
//  CLUserHomeViewController.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/2.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit
import YYModel
import SnapKit

class CLUserHomeViewController: CLBaseHomeViewController {

	@IBOutlet weak var avatar: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var signatureLabel: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
	
		let rightBarItem = UIBarButtonItem.init(image: UIImage.init(named: "navigation_cancel"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(aaaa))
		self.navigationItem.rightBarButtonItem = rightBarItem
		
		self.setupUI()
	
		
		
		let dict = ["className":"ssgasg","age":18] as [String : Any]
		
		let model : CLBaseModel = CLBaseModel.yy_model(withJSON: dict)!
		print(model.className, IS_IPHONE_X_SERIES())
		
		
	}
	@objc func aaaa() {
		HIDE_LOADING()
	}

	@IBAction func userInfoAction(_ sender: Any) {
		
		
		if CLUser.currentUser() == nil {
			AppDelegate.postNotificationToLoginPage()
		} else {
			print("去y个人信息页")
			let vc = CLUserInfoViewController.init()
			self.navigationController?.pushViewController(vc, animated: true)
		}
		
//		struct Number {
//			static var number: Int = 0
//		}
//		Number.number += 1
		
//		SHOW_SUCCESS(String (format: "HUD %d", Number.number))
//SHOW_LOADING()
//		return()
//
	}
	
	// MARK: - 设置UI
	private func setupUI() {
		avatar.layer.cornerRadius = 30.0
		avatar.layer.masksToBounds = true
		
		let textView = CLTextView.init()
		textView.font = UIFont.boldSystemFont(ofSize: 20)
		textView.placeholderColor=UIColor.red
		self.view.addSubview(textView)
		textView.snp.makeConstraints { (make) in
			make.width.equalTo(200)         // 宽为100
			make.height.equalTo(100)        // 高为100
			make.center.equalTo(view)       // 位于当前视图的中心
		}
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
