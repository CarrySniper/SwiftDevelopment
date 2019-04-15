//
//  UIImage+CLExtention.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/3.
//  Copyright © 2019 cl. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
	class func navigationImage() -> UIImage? {
		return UIImage.fromColor(CLColor.navigationColor)
	}
	
	/// 根据颜色生成图片
	///
	/// - Parameter color: 颜色
	/// - Returns: 图片
	class func fromColor(_ color: UIColor) -> UIImage {
		let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
		UIGraphicsBeginImageContext(rect.size)
		let context = UIGraphicsGetCurrentContext()
		context!.setFillColor(color.cgColor)
		context!.fill(rect)
		let img = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return img!
	}
}
