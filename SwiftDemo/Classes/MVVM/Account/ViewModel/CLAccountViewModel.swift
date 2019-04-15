//
//  CLAccountViewModel.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/4.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit
import AVOSCloud

class CLAccountViewModel: CLBaseViewModel {
	
	/// 登录 - 手机号方式
	///
	/// - Parameters:
	///   - phone: 手机
	///   - password: 密码
	///   - completionHandler: 回调
	func login(phone: String, password: String, completionHandler: @escaping CLBoolHandler) {
		let phoneText = phone.trimSpace
		let passwordText = password.trimSpace
		
		if phoneText.count == 0 {
			SHOW_INFO("请输入手机号")
			return()
		}
		if passwordText.count == 0 {
			SHOW_INFO("请输入密码")
			return()
		}
		
		SHOW_LOADING(self.view)
		AVUser.logInWithMobilePhoneNumber(inBackground: phoneText, password: passwordText) { (user, error) in
			if user != nil {
				SHOW_SUCCESS("登录成功")
			} else {
				SHOW_ERROR(error!)
			}
			HIDE_LOADING(self.view)
			completionHandler(error == nil)
		}
	}

	func register(phone: String, smscode: String, password: String, apassword: String, completionHandler: @escaping CLBoolHandler) {
		let phoneText = phone.trimSpace
		let smscodeText = smscode.trimSpace
		let passwordText = password.trimSpace
		let apasswordText = apassword.trimSpace
		
		if phoneText.count == 0 {
			SHOW_INFO("请输入手机号")
			return()
		}
		if smscodeText.count == 0 {
			SHOW_INFO("请输入验证码")
			return()
		}
		if passwordText.count == 0 {
			SHOW_INFO("请输入密码")
			return()
		}
		if apasswordText != passwordText {
			SHOW_INFO("输入两次密码不一致")
			return()
		}
		
		SHOW_LOADING(self.view)
		AVUser.signUpOrLoginWithMobilePhoneNumber(inBackground: phoneText, smsCode: smscodeText, password: passwordText) { (user, error) in
			// 如果 error 为空就可以表示登录成功了，并且 user 是一个全新的用户
			if user != nil && error == nil {
				SHOW_SUCCESS("注册成功")
				var name = phoneText as NSString
				if name.length > 7 {
					name = "\(name.substring(to: 3))****\(name.substring(from: 7))" as NSString
				} else {
					name = "未绑定"
				}
				user?.username = name as String
				user?.saveInBackground()
			} else {
				SHOW_ERROR(error!)
			}
			HIDE_LOADING(self.view)
			completionHandler(error == nil)
		}
	}
	
	func resetPassword(phone: String, smscode: String, password: String, apassword: String, completionHandler: @escaping CLBoolHandler) {
		let phoneText = phone.trimSpace
		let smscodeText = smscode.trimSpace
		let passwordText = password.trimSpace
		let apasswordText = apassword.trimSpace
		
		if phoneText.count == 0 {
			SHOW_INFO("请输入手机号")
			return()
		}
		if smscodeText.count == 0 {
			SHOW_INFO("请输入验证码")
			return()
		}
		if passwordText.count == 0 {
			SHOW_INFO("请输入密码")
			return()
		}
		if apasswordText != passwordText {
			SHOW_INFO("输入两次密码不一致")
			return()
		}
		
		SHOW_LOADING(self.view)
		AVUser.resetPassword(withSmsCode: smscodeText, newPassword: passwordText) { (success, error) in
			if success {
				SHOW_SUCCESS("重置成功，请重新登录")
			} else {
				SHOW_ERROR(error!)
			}
			HIDE_LOADING(self.view)
			completionHandler(error == nil)
		}
	}
	
	func sendCode(phone: String, completionHandler: @escaping CLBoolHandler) {
		let phoneText = phone.trimSpace
		
		if phoneText.count == 0 {
			SHOW_INFO("请输入手机号")
			completionHandler(false);
			return()
		}
		SHOW_LOADING(self.view)
		AVSMS.requestShortMessage(forPhoneNumber: phoneText, options: nil) { (success, error) in
			if success {
				SHOW_SUCCESS("验证码已发送")
			} else {
				SHOW_ERROR(error!)
			}
			HIDE_LOADING(self.view)
			completionHandler(error == nil)
		}
	}
}
