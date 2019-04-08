//
//  CLKit.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/8.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit
import Foundation

class CLToolKit: NSObject {
	struct Series {
		static var iPhoneX: Bool = false
	}
	lazy var onceAction: Void = {
		// 写下想要执行一次的代码
		Series.iPhoneX = UIView.isXSeries()
	}()
	
	public func isXSeries() -> Bool {
		_ = self.onceAction
		return Series.iPhoneX
	}
	
	
}
