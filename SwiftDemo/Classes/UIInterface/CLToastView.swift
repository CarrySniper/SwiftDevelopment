//
//  CLToastView.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/4.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit

func SHOW_SUCCESS(_ text: String) {
	CLToastView.sharedInstance().setText(text)
	CLToastView.sharedInstance().show()
	CLToastView.sharedInstance().hide(3.0)
	CLToastView.setBackgroundColor(UIColor.colorHex("007F00"))
}

func SHOW_INFO(_ text: String) {
	CLToastView.sharedInstance().setText(text)
	CLToastView.sharedInstance().show()
	CLToastView.sharedInstance().hide(3.0)
	CLToastView.setBackgroundColor(UIColor.orange)
}

func SHOW_ERROR(_ error: Error) {
	CLToastView.sharedInstance().setText(error.localizedDescription)
	CLToastView.sharedInstance().show()
	CLToastView.sharedInstance().hide(3.0)
	CLToastView.setBackgroundColor(UIColor.red)
}



class CLToastView: UIView {
	
	var containerView = UIView()
	var minimumSize = CGSize.zero
	var imageView = UIImageView()
	var textLabel = UILabel()
	var timerCount = Int(0)
	var tempFrame = CGRect.zero
	var finalFrame = CGRect.zero
	
	
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
		/// HUD层
		let isXSeries = self.isXSeries()
		
		let y = CGFloat(isXSeries ? 24.0 : 0.0)
		let width = UIScreen.main.bounds.size.width
		let height = 64.0 + y
		tempFrame = CGRect(x: 0, y: -height, width: width, height: height)
		finalFrame = CGRect(x: 0, y: 0, width: width, height: height)
		
		containerView.backgroundColor = UIColor.white
		containerView.frame = tempFrame
		self.addSubview(containerView)
		
		textLabel.frame = CGRect(x: 32, y: y+20, width: width-64, height: 44.0)
		textLabel.font = UIFont.systemFont(ofSize: 15)
		textLabel.textColor = UIColor.black
		textLabel.textAlignment = NSTextAlignment.center
		textLabel.numberOfLines = 0
		containerView.addSubview(textLabel)
	}()
	
	func setText(_ text: String) {
		CLToastView.sharedInstance().textLabel.text = text
	}
	//MARK: 类方法配置属性
	class func setBackgroundColor(_ color: UIColor) {
		CLToastView.sharedInstance().containerView.backgroundColor = color
	}
	
	
	class func setTextColor(_ color: UIColor) {
		CLToastView.sharedInstance().textLabel.textColor = color
	}
	
	public func show() {
		let window: UIWindow = UIApplication.shared.keyWindow!
		if window.subviews.contains(self) {
			return()
		}
		DispatchQueue.main.async {
			window.addSubview(self)
			self.containerView.frame = self.tempFrame
			UIView.animate(withDuration: 0.25, delay: 0.0, options: UIView.AnimationOptions.curveLinear, animations: {
				self.containerView.frame = self.finalFrame
			}, completion: { (Bool) in
				
			})
		}
	}
	
	public func hide() {
		DispatchQueue.main.async {
			UIView.animate(withDuration: 0.25, delay: 0.0, options: UIView.AnimationOptions.curveLinear, animations: {
				self.containerView.frame = self.tempFrame
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
			// 每秒计时一次
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
	
	/// 是否是iPhone X系列，有安全区域
	///
	/// - Returns: 是或否
	func isXSeries() -> Bool {
		if #available(iOS 11.0, *) {
			let window: UIWindow = ((UIApplication.shared.delegate?.window)!)!
			if window.safeAreaInsets.bottom > 0.0 {
				return true
			}
		}
		return false
	}

}
