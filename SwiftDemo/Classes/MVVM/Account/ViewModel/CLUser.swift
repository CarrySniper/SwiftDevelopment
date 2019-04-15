//
//  CLUser.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/4.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit
import AVOSCloud

class CLUser: CLBaseModel {
	
	@objc var avatar : String!
	
	@objc var username : String!
	
	@objc var mobilePhoneNumber : String!
	
	@objc var signature : String!
	
	var mobilePhoneVerified : Bool!
	
	
	/// 忧伤的 ！ ？
	///
	/// - Returns: 登录返回YYModel，未登录返回nil
	static func currentUser() -> CLUser? {
		var model : CLUser?
		let user = AVUser.current()
		if (user != nil) {
			model = CLUser.yy_model(withJSON: user?.dictionaryForObject() as Any)
			model!.createdAt = user?.createdAt
			return model!
		}
		return model
	}
	
	static func logout() {
		AVUser.logOut()
	}
}
