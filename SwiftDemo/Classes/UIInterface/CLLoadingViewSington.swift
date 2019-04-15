//
//  CLLoadingViewSington.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/8.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit

class CLLoadingViewSington: UIView {
	// 菊花指示器
	var activityIndicatorView: UIActivityIndicatorView!
	
	/// 单例
	class func sharedInstance() -> CLLoadingViewSington {
		struct Single {
			static let instance: CLLoadingViewSington = CLLoadingViewSington()
		}
		_ = Single.instance.setup_oncesAction
		return Single.instance
	}
	
	/// 懒加载-只执行一次的代码
	lazy var setup_oncesAction: Void = {
		// 写下想要执行一次的代码
		self.layer.masksToBounds = true
		self.layer.cornerRadius = 10.0
		self.backgroundColor = UIColor.gray
		self.frame = CGRect.init(x: 0, y: 0, width: 88, height: 88)
		
		// 图形1、菊花指示器
		activityIndicatorView = UIActivityIndicatorView.init()
		activityIndicatorView.style = UIActivityIndicatorView.Style.whiteLarge
		activityIndicatorView.frame = self.bounds
		self.addSubview(activityIndicatorView)
		
	}()
	
	public func show() {
		let window: UIWindow = UIApplication.shared.keyWindow!
		DispatchQueue.main.async {
			// 菊花指示器
			self.activityIndicatorView.isHidden = false
			window.addSubview(self)
			self.center = window.center
		}
	}
	
	public func hide() {
		DispatchQueue.main.async {
			self.activityIndicatorView.stopAnimating()
			self.removeFromSuperview()
		}
	}
	
}
