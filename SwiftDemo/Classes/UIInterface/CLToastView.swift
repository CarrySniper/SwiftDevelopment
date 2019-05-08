//
//  CLToastView.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/4.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit

func SHOW_TOAST_SUCCESS(_ text: String) {
	CLToastView.sharedInstance().setText(text)
	CLToastView.sharedInstance().show()
	CLToastView.sharedInstance().hide(3.0)
	CLToastView.sharedInstance().backgroundColor = UIColor.colorHex("007F00")
}

func SHOW_TOAST_INFO(_ text: String) {
	CLToastView.sharedInstance().setText(text)
	CLToastView.sharedInstance().show()
	CLToastView.sharedInstance().hide(3.0)
	CLToastView.sharedInstance().backgroundColor = (UIColor.orange)
}

func SHOW_TOAST_ERROR(_ error: Error) {
	CLToastView.sharedInstance().setText(error.localizedDescription)
	CLToastView.sharedInstance().show()
	CLToastView.sharedInstance().hide(3.0)
	CLToastView.sharedInstance().backgroundColor = (UIColor.red)
}



class CLToastView: UIView {
	
	var timerCount = Int(0)
	var originalFrame = CGRect.zero
	var showFrame = CGRect.zero
	var isShow = false
	
	lazy var textLabel: UILabel = {
		let label = UILabel.init()
		label.font = UIFont.systemFont(ofSize: 15)
		label.textColor = UIColor.black
		label.textAlignment = NSTextAlignment.center
		label.numberOfLines = 0
		return label
	}()
	
	/// 单例
	class func sharedInstance() -> CLToastView {
		struct Single {
			static let instance: CLToastView = CLToastView()
		}
		_ = Single.instance.setup_oncesAction
		return Single.instance
	}
	
	/// 懒加载-只执行一次的代码
	lazy var setup_oncesAction: Void = {
		// 写下想要执行一次的代码
		
		/// 状态栏高度改变影响高度
		NotificationCenter.default.addObserver(self, selector: #selector(updateFrame), name: UIApplication.didChangeStatusBarFrameNotification, object: nil)
		
		/// HUD层
		self.backgroundColor = UIColor.white
		self.layer.shadowColor = UIColor.gray.cgColor
		self.layer.shadowOffset = CGSize(width: 0, height: 0)
		self.layer.shadowOpacity = 0.5
		self.layer.shadowRadius = 5
		
		// 更新获取位置
		self.updateFrame()
		textLabel.frame = CGRect(x: 32, y: originalFrame.height - 44, width: originalFrame.width - 64, height: 44.0)
		
		self.addSubview(textLabel)
		
		// 约束-TopMargin顶部适配，让底部距离不变
		self.autoresizesSubviews = true
		textLabel.autoresizingMask = [UIView.AutoresizingMask.flexibleTopMargin]
	}()
	
	//MARK: - 更新位置
	@objc private func updateFrame() {
		let statusBarHeight = UIApplication.shared.statusBarFrame.height
		let height = 44.0 + statusBarHeight
		let width = UIScreen.main.bounds.width
		
		originalFrame = CGRect(x: 0, y: -height, width: width, height: height)
		showFrame = CGRect(x: 0, y: 0, width: width, height: height)
		
		if isShow == true {
			self.frame = showFrame
		} else {
			self.frame = originalFrame
		}
	}
	
	func setText(_ text: String) {
		textLabel.text = text
	}
	//MARK: 类方法配置属性
	func setTextColor(_ color: UIColor) {
		textLabel.textColor = color
	}
	
	public func show() {
		self.isShow = true
		let window: UIWindow = UIApplication.shared.keyWindow!
		if window.subviews.contains(self) {
			return()
		}
		DispatchQueue.main.async {
			window.addSubview(self)
			self.frame = self.originalFrame
			UIView.animate(withDuration: 0.25, delay: 0.0, options: UIView.AnimationOptions.curveLinear, animations: {
				self.frame = self.showFrame
			}, completion: { (Bool) in
				
			})
		}
	}
	
	public func hide() {
		self.isShow = false
		DispatchQueue.main.async {
			UIView.animate(withDuration: 0.25, delay: 0.0, options: UIView.AnimationOptions.curveLinear, animations: {
				self.frame = self.originalFrame
			}, completion: { (Bool) in
				self.removeFromSuperview()
			})
		}
	}
	
	public func hide(_ delaySeconds: TimeInterval) {
		if timerCount > 0 {
			timerCount = Int(delaySeconds * 10); // 0.1秒1次，所以10倍
			return;
		}
		timerCount = Int(delaySeconds * 10); // 0.1秒1次，所以10倍
		
		// 在global线程里创建一个时间源
		let timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
		// 设定这个时间源是每秒循环一次，立即开始
		timer.schedule(deadline: .now(), repeating: .milliseconds(100))
		// 设定时间源的触发事件
		timer.setEventHandler(handler: {
			// 时间到了取消时间源
			if self.timerCount <= 0  {
				self.timerCount = 0
				self.hide()// 内部包含主线程
				timer.cancel()
			} else {
				self.timerCount = self.timerCount-1
				//print(Int(self.timerCount));
			}
		})
		// 启动时间源
		timer.resume()
	}
}
