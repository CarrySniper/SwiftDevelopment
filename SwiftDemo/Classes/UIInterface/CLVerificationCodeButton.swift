//
//  CLVerificationCodeButton.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/3.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit

/// 颜色定义
struct CLCodeButtonColor {
	static let textNormal			= CLColor.red
	static let textDisabled     	= UIColor.white
	static let backgroundNormal     = UIColor.clear
	static let backgroundDisabled   = CLColor.lightGray
}

class CLVerificationCodeButton: UIButton {
	
	typealias CLCodeButtonHandler = (_ button: CLVerificationCodeButton) -> Void
	
	var countNumber : TimeInterval!
	var durationTime : TimeInterval!
	var startHandler: CLCodeButtonHandler!
	var endHandler: CLCodeButtonHandler!
	
	
	public func setHandler(_ duration : TimeInterval, start: @escaping CLCodeButtonHandler, end: @escaping CLCodeButtonHandler) {
		durationTime = duration
		startHandler = start
		endHandler = end
	}
	
	public func stop() {
		self.isEnabled = true;
		if endHandler != nil {
			endHandler!(self)
		}
	}
	
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.setup()
	}
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		self.setup()
	}
	
	private func setup() {
		// 类型必须为 buttonType = UIButtonTypeCustom
		self.setTitle("获取验证码", for: UIControl.State.normal)
		
		self.setTitleColor(CLCodeButtonColor.textNormal, for: UIControl.State.normal)
		self.setTitleColor(CLCodeButtonColor.textDisabled, for: UIControl.State.disabled)
		self.setBackgroundImage(UIImage.fromColor(CLCodeButtonColor.backgroundNormal), for: UIControl.State.normal)
		self.setBackgroundImage(UIImage.fromColor(CLCodeButtonColor.backgroundDisabled), for: UIControl.State.disabled)
		
		self.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
		self.addTarget(self, action: #selector(startButtonAction), for: UIControl.Event.touchUpInside)
	}
	
	@objc private func startButtonAction() {
		self.startTimer()
		if startHandler != nil {
			startHandler!(self)
		}
	}
	
	private func changeButtonStatus() {
		let text = NSString(format: "%d秒", Int(countNumber))
		self.setTitle(text as String, for: UIControl.State.disabled)
	}

	private func startTimer() {
		// 避免重复点击
		if self.isEnabled == false {
			return
		}
		self.isEnabled = false
		
		
		// 定义需要计时的时间
		countNumber = durationTime
		// 在global线程里创建一个时间源
		let timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
		// 设定这个时间源是每秒循环一次，立即开始
		timer.schedule(deadline: .now(), repeating: .seconds(1))
		// 设定时间源的触发事件
		timer.setEventHandler(handler: {
			// 每秒计时一次
			// 时间到了取消时间源
			if self.countNumber <= 1  {
				timer.cancel()
				// 返回主线程处理一些事件，更新UI等等
				DispatchQueue.main.async {
					self.stop()
				}
			} else {
				
				DispatchQueue.main.async {
					if (self.isEnabled == true) {
						timer.cancel()
						self.stop()
					}
					self.changeButtonStatus()
					//print(Int(self.countNumber));
				}
				self.countNumber = self.countNumber-1
			}
		})
		// 启动时间源
		timer.resume()
	}
}
