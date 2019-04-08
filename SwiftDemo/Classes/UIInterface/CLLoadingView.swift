//
//  CLLoadingView.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/8.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit

func SHOW_LOADING() {
	CLLoadingView.sharedInstance().show(-1)
}

func SHOW_PROGRESS(_ progress: CGFloat) {
	CLLoadingView.sharedInstance().show(progress)
}

func HIDE_LOADING() {
	CLLoadingView.sharedInstance().hide()
}

class CLLoadingView: UIView {
	// 图形1、菊花指示器
	var activityIndicatorView: UIActivityIndicatorView!
	// 图形2、环形加载进度器
	var shapeLayer: CAShapeLayer!
	var percentLabel: UILabel!
	
	/// 单例
	class func sharedInstance() -> CLLoadingView {
		struct Single {
			static let instance: CLLoadingView = CLLoadingView()
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
		
		// 图形2、环形加载进度器
		percentLabel = UILabel.init()
		percentLabel.frame = self.bounds
		percentLabel.text = "0%"
		percentLabel.textColor = UIColor.white
		percentLabel.textAlignment = NSTextAlignment.center
		percentLabel.font = UIFont.systemFont(ofSize: 15)
		self.addSubview(percentLabel)
		
		let onePath = UIBezierPath(arcCenter: self.center,
								   radius: 30.0,
								   startAngle: CGFloat(Double.pi*3/2),
								   endAngle: CGFloat(Double.pi*2+Double.pi*3/2),
								   clockwise: true)
		let trackLayer = CAShapeLayer()
		trackLayer.path = onePath.cgPath
		trackLayer.lineWidth = 2
		trackLayer.strokeStart = 0.0	// 开始点
		trackLayer.strokeEnd = 1.0		// 终止点
		trackLayer.fillColor = UIColor.clear.cgColor
		trackLayer.strokeColor = UIColor.lightGray.cgColor
		percentLabel.layer.addSublayer(trackLayer)// 加在Label上
		
		shapeLayer = CAShapeLayer()
		shapeLayer.path = onePath.cgPath
		shapeLayer.lineWidth = 2
		shapeLayer.strokeStart = 0.0	// 开始点
		shapeLayer.strokeEnd = 0.0		// 终止点
		shapeLayer.fillColor = UIColor.clear.cgColor
		shapeLayer.strokeColor = UIColor.white.cgColor
		percentLabel.layer.addSublayer(shapeLayer)// 加在Label上
	}()
	
	public func show(_ progress: CGFloat) {
		let window: UIWindow = UIApplication.shared.keyWindow!
		DispatchQueue.main.async {
			if progress < 0.0 {
				// 图形1、菊花指示器
				self.activityIndicatorView.isHidden = false
				self.percentLabel.isHidden = true
				
				self.activityIndicatorView.startAnimating()
			} else {
				// 图形2、环形加载进度器
				self.activityIndicatorView.isHidden = true
				self.percentLabel.isHidden = false
				
				let value = min(progress, 1.0)
				self.shapeLayer.strokeEnd = value
				self.percentLabel.text = String.init(format: "%.0f%%", value * 100)
			}
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
