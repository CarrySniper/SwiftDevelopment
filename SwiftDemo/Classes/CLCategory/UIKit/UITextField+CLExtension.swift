//
//  UITextField+CLExtension.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/2.
//  Copyright © 2019 cl. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {

	func defaultPlaceholder() {
		self.placeholderColor(color: CLColor.placeholder)
	}
	
	func placeholderColor(color: UIColor) {
		//字体大小
		self.setValue(self.font ,forKeyPath: "placeholderLabel.font")
		//字体颜色
		self.setValue(color, forKeyPath: "placeholderLabel.textColor")
	}
}
