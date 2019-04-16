//
//  CLUserViewModel.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/16.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit
import AVOSCloud

class CLUserViewModel: CLBaseViewModel {
	
	func setAvatar(avatarImage: UIImage?, handler: CLViodHandler?) {
		if avatarImage == nil {
			return()
		}
		let imageData = avatarImage?.jpegData(compressionQuality: 0.5)
		let avFile = AVFile.init(data: imageData!, name: "avatar.jpg")
		
		SHOW_LOADING(self.view)
		avFile.upload(progress: { (percentDone) in
			// 介于 0 和 100。
			SHOW_LOADING_PROGRESS(self.view, CGFloat(percentDone) / 100.0)
		}, completionHandler: { (succeeded, error) in
			if succeeded && avFile.url() != nil {
				AVUser.current()?.setObject(avFile.url(), forKey: "avatar")
				AVUser.current()?.saveInBackground({ (succeeded, error) in
					if succeeded && error == nil && (handler != nil) {
						handler!()
						SHOW_TOAST_SUCCESS("保存成功");
					} else {
						SHOW_TOAST_ERROR(error!)
					}
					HIDE_LOADING(self.view)
				})
			} else {
				SHOW_TOAST_ERROR(error!)
				HIDE_LOADING(self.view)
			}
		})
	}
	
	func setInfo(username: String, signature: String, handler: CLViodHandler?) {
		if (username.count < 2) {
			SHOW_TOAST_INFO("用户名长度至少为2")
			return()
		}
		if (signature.count > 50) {
			SHOW_TOAST_INFO("个性签名，一句话限制50个字")
			return()
		}
		SHOW_LOADING(self.view)
		AVUser.current()?.setObject(username, forKey: "username")
		AVUser.current()?.setObject(signature, forKey: "signature")
		AVUser.current()?.saveInBackground({ (succeeded, error) in
			if succeeded && error == nil && (handler != nil) {
				handler!()
				SHOW_TOAST_SUCCESS("保存成功");
			} else {
				SHOW_TOAST_ERROR(error!)
			}
			HIDE_LOADING(self.view)
		})
	}
	
}
