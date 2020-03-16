//
//  CLSingletonManager.swift
//  SwiftDemo
//
//  Created by CJQ on 2020/3/15.
//  Copyright © 2020 cl. All rights reserved.
//

import UIKit

class CLSingletonManager: NSObject {
	
	/// 单例
	class func sharedInstance() -> CLSingletonManager {
		struct Single {
			static let instance: CLSingletonManager = CLSingletonManager()
		}
		_ = Single.instance.setup_oncesAction
		return Single.instance
	}
	
	/// 懒加载-只执行一次的代码
	lazy var setup_oncesAction: Void = {
		// 写下想要执行一次的代码
	
		
	}()
}
