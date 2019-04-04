//
//  CLProgressHUD.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/4.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit

func ShowSuccess(_ text: String) {
	CLProgressHUD.sharedSingle().setText(text)
	CLProgressHUD.sharedSingle().show()
	CLProgressHUD.sharedSingle().hide(3.0)
}

func ShowInfo(_ text: String) {
	CLProgressHUD.sharedSingle().setText(text)
	CLProgressHUD.sharedSingle().show()
	CLProgressHUD.sharedSingle().hide(3.0)
}


class CLProgressHUD: UIView {
	
	var containerView = UIView()
	var minimumSize = CGSize.zero
	var imageView = UIImageView()
	var textLabel = UILabel()
	var timerCount = Int(0)
	
	
	/// 单例
	class func sharedSingle() -> CLProgressHUD {
		struct Single {
			static let instance: CLProgressHUD = CLProgressHUD()
		}
		Single.instance.setup()
		return Single.instance
	}
	
	private func setup() {
		/// HUD层
		containerView.backgroundColor = UIColor.blue
		containerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		self.addSubview(containerView)
		
		textLabel.backgroundColor = UIColor.green
		textLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 60)
		textLabel.font = UIFont.systemFont(ofSize: 12)
		textLabel.textAlignment = NSTextAlignment.center
		textLabel.numberOfLines = 0
		containerView.addSubview(textLabel)
		textLabel.center = containerView.center
		
	}
	
	
	func minimumSize(_ size: CGSize) {
		containerView.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
	}
	
	func setText(_ text: String) {
		textLabel.text = text
	}
	
	public func show() {
		DispatchQueue.main.async {
			UIApplication.shared.keyWindow?.addSubview(self)
		}
	}
	
	public func hide() {
		DispatchQueue.main.async {
			self.removeFromSuperview()
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
}
