//
//  CLResetPasswordViewController.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/3.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit

class CLResetPasswordViewController: CLBaseViewController, UITextFieldDelegate {

	@IBOutlet weak var phoneTextField: UITextField!
	@IBOutlet weak var codeTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var apasswordTextField: UITextField!
	
	@IBOutlet weak var doneButton: UIButton!
	@IBOutlet weak var codeButton: CLVerificationCodeButton!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		self.title = "密码设置"
		
		self.setupUI()
	}


	// MARK: - UIControl
	// MARK: 注册操作
	@IBAction func resetAction(_ sender: Any) {
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
