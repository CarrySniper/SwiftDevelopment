//
//  CLUserHomeViewController.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/2.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit
import YYModel

class CLUserHomeViewController: CLBaseHomeViewController {

	@IBOutlet weak var codeButton: CLVerificationCodeButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
	
		
		// 验证码
		codeButton.layer.cornerRadius = 15;
		codeButton.layer.masksToBounds = true;
		codeButton.layer.borderWidth = 0.5;
		codeButton.layer.borderColor = CLColor.red.cgColor;
		codeButton.setHandler(6, start: { (button) in
			button.layer.borderWidth = 0.0;
			// 发起网络请求
//			[weakSelf sendCodeAction];
		}, end: { (button) in
			button.layer.borderWidth = 0.5;
		})
		
		
		let dict = ["className":"ssgasg","age":18] as [String : Any]
		
		let model : CLBaseModel = CLBaseModel.yy_model(withJSON: dict)!
		print(model.className)
    }


	@IBAction func userInfoAction(_ sender: Any) {
		struct Number {
			static var number: Int = 0
		}
		Number.number += 1
		
//		showSuccess(String (format: "HUD %d", Number.number))
		return
		AppDelegate.postNotificationToLoginPage()
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
