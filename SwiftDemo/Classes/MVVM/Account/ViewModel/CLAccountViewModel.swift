//
//  CLAccountViewModel.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/4.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit

class CLAccountViewModel: CLBaseViewModel {
	
	func login(phone: String, password: String, completionHandler: CLViodHandler) {
		let phoneText = phone.trimSpace
		let passwordText = password.trimSpace
		
		if phoneText.count == 0 {
			ShowInfo("请输入手机号")
			return;// 不要分号会z继续执行下面的
		}
		if passwordText.count == 0 {
			ShowInfo("请输入密码")
			return;// 不要分号会z继续执行下面的
		}
	}
//	#pragma mark - 手机号登录
//	- (void)loginWithPhone:(NSString *)phone password:(NSString *)password completionHandler:(CLBoolBlock)completionHandler {
//	phone = [phone TrimSpaces];
//	password = [password TrimSpaces];
//	if (phone.length == 0) {
//	SHOW_TOAST_INFO(@"请输入手机号")
//	return;
//	}
//	if (password.length == 0) {
//	SHOW_TOAST_INFO(@"请输入密码")
//	return;
//	}
//
//	[SVProgressHUD showLoadingWithText:@"正在登录"];
//	[self disableInteraction];
//	[AVUser logInWithMobilePhoneNumberInBackground:phone password:password block:^(AVUser *user, NSError *error) {
//	if (user != nil) {
//	SHOW_TOAST_SUCCESS(@"登录成功");
//	}else{
//	SHOW_ERROR(error)
//	}
//	[self enableInteraction];
//	if (completionHandler) {
//	completionHandler(error == nil);
//	}
//	}];
//	}
}
