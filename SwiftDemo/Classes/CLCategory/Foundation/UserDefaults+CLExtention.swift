//
//  UserDefaults+CLExtention.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/10.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit

/*
// 存取数据
UserDefaults.set("ABC", forKey: .userName)
UserDefaults.string(forKey: .userName)
*/

extension UserDefaults {
	enum UserDefaultsKeys: String {
		case phoneNumber
		case age
	}
	
	class func set(_ value: String, forKey key: UserDefaultsKeys) {
		let key = key.rawValue
		UserDefaults.standard.set(value, forKey: key)
		UserDefaults.standard.synchronize()
	}
	
	class func string(forKey key: UserDefaultsKeys) -> String? {
		let key = key.rawValue
		return UserDefaults.standard.string(forKey: key)
	}
}

