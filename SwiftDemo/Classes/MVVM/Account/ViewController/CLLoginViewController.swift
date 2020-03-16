//
//  CLLoginViewController.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/2.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit

class CLLoginViewController: CLBaseHomeViewController, UITextFieldDelegate {

	@IBOutlet weak var phoneTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	
	@IBOutlet weak var secureButton: UIButton!
	@IBOutlet weak var doneButton: UIButton!
	
	/// 懒加载
	lazy var viewModel: CLAccountViewModel = {
		var vm = CLAccountViewModel.init()
		vm.view = self.view
		return vm
	}()
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		let rightBarItem = UIBarButtonItem.init(image: UIImage.init(named: "navigation_cancel"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(customBack))
		self.navigationItem.rightBarButtonItem = rightBarItem
		
		self.setupUI()
		phoneTextField.text = UserDefaults.string(forKey: .phoneNumber)
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.navigationController?.navigationBar.shadowImage = UIImage.init()
		self.navigationController?.navigationBar.setBackgroundImage(UIImage.fromColor(UIColor.white), for: UIBarMetrics.default)
	}
	
	
	// MARK: - UIControl
	// MARK: 登录操作
	@IBAction func loginAction(_ sender: Any) {
		UserDefaults.set(phoneTextField.text!, forKey: .phoneNumber)
		
		viewModel.login(phone: phoneTextField.text!, password: passwordTextField.text!) { (success) in
			if success == true {
				// 登录成功
				self.dismiss(animated: true, completion: nil)
			}
		}
	}
	
	// MARK: 去注册
	@IBAction func registerAction(_ sender: Any) {
		let transition = CATransition.init()
		/// 动画时长
		transition.duration = 0.5
		/// 动画类型
		transition.type = CATransitionType(rawValue: "cube")
		/// 动画方向
		transition.subtype = CATransitionSubtype.fromRight
		/// 完成动画删除
		transition.isRemovedOnCompletion = true
		/// 缓动函数
		transition.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.easeInEaseOut)
		
		self.navigationController?.view.layer.add(transition, forKey: nil)
		
		let vc = CLRegisterViewController.init()
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	// MARK: 去修改密码
	@IBAction func forgetAction(_ sender: Any) {
		let vc = CLResetPasswordViewController.init()
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	// MARK: 密码输入安全切换 **** 1234
	@IBAction func secureAction(_ sender: Any) {
		if (secureButton.isSelected == false) {
			secureButton.isSelected = true
			passwordTextField.isSecureTextEntry = true
		}else{
			secureButton.isSelected = false
			passwordTextField.isSecureTextEntry = false
		}
	}
	
	// MARK: - UITextFieldDelegate
	func textFieldShouldClear(_ textField: UITextField) -> Bool {
		textField.text = ""
		return true
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		switch textField {
		case phoneTextField:
			passwordTextField.becomeFirstResponder()
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
		passwordTextField.delegate = self;
		
		phoneTextField.defaultPlaceholder()
		passwordTextField.defaultPlaceholder()
		
		// 明文输入
		secureButton.isSelected = true
		passwordTextField.isSecureTextEntry = true
		secureButton.setImage(UIImage.init(named: "icon_show"), for: UIControl.State.normal)
		secureButton.setImage(UIImage.init(named: "icon_show_no"), for: UIControl.State.selected)
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
