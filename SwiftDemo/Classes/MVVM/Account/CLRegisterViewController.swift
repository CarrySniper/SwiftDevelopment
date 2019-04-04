//
//  CLRegisterViewController.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/2.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit

class CLRegisterViewController: CLBaseHomeViewController, UITextFieldDelegate {

	@IBOutlet weak var phoneTextField: UITextField!
	@IBOutlet weak var codeTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var apasswordTextField: UITextField!
	
	@IBOutlet weak var doneButton: UIButton!
	@IBOutlet weak var codeButton: CLVerificationCodeButton!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		let rightBarItem = UIBarButtonItem.init(image: UIImage.init(named: "navigation_cancel"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(customBack))
		self.navigationItem.rightBarButtonItem = rightBarItem
		
		self.setupUI()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.navigationController?.navigationBar.shadowImage = UIImage.init()
	}
	
	@objc override func customBack() {
		self.dismiss(animated: true) {
			
		}
	}
	
	// MARK: - UIControl
	// MARK: 注册操作
	@IBAction func registerAction(_ sender: Any) {
	}
	// MARK: 返回登录操作
	@IBAction func backLoginAction(_ sender: Any) {
		let transition = CATransition.init()
		/// 动画时长
		transition.duration = 0.5
		/// 动画类型
		transition.type = CATransitionType(rawValue: "cube")
		/// 动画方向
		transition.subtype = CATransitionSubtype.fromLeft
		/// 完成动画删除
		transition.isRemovedOnCompletion = true
		/// 缓动函数
		transition.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.easeInEaseOut)
		
		self.navigationController?.view.layer.add(transition, forKey: nil)
		self.navigationController?.popViewController(animated: true)
	}
	// MARK: 用户协议操作
	@IBAction func protocolAction(_ sender: Any) {
	}
	
	// MARK: - UITextFieldDelegate
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		switch textField {
		case phoneTextField:
			codeTextField.becomeFirstResponder()
			break
		case codeTextField:
			passwordTextField.becomeFirstResponder()
			break
		case passwordTextField:
			apasswordTextField.becomeFirstResponder()
			break
		default:
			textField.resignFirstResponder()
			break
		}
		return true
	}
	
	// MARK: - 设置UI
	private func setupUI() {
		self.view.backgroundColor = UIColor.white;
		
		doneButton.layer.cornerRadius = 20;
		doneButton.layer.masksToBounds = true;

		phoneTextField.delegate = self;
		codeTextField.delegate = self;
		passwordTextField.delegate = self;
		apasswordTextField.delegate = self;

		phoneTextField.defaultPlaceholder()
		codeTextField.defaultPlaceholder()
		passwordTextField.defaultPlaceholder()
		apasswordTextField.defaultPlaceholder()

		codeButton.layer.cornerRadius = 15;
		codeButton.layer.masksToBounds = true;
		codeButton.layer.borderWidth = 0.5;
		codeButton.layer.borderColor = CLColor.red.cgColor;
		codeButton.setHandler(60, start: { (button) in
			button.layer.borderWidth = 0.0;
			// 发起网络请求
			//			[weakSelf sendCodeAction];
		}, end: { (button) in
			button.layer.borderWidth = 0.5;
		})
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
