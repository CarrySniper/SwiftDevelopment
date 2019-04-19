//
//  CLLoadingView.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/15.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit

func SHOW_LOADING(_ view: UIView) {
	CLLoadingView.showInView(view, -1)
}

func SHOW_LOADING_PROGRESS(_ view: UIView,_ progress: CGFloat) {
	CLLoadingView.showInView(view, progress)
}

func HIDE_LOADING(_ view: UIView) {
	CLLoadingView.hide(view)
}

class CLLoadingView: UIView {
	
	// 图形1、菊花指示器
	lazy var activityIndicatorView: UIActivityIndicatorView = {
		let view = UIActivityIndicatorView.init()
		view.style = UIActivityIndicatorView.Style.whiteLarge
		view.frame = self.bounds
		return view
	}()
	// 图形2、环形加载进度器
	lazy var circlePath: UIBezierPath = {
		return UIBezierPath(arcCenter: self.center,
							radius: 30.0,
							startAngle: CGFloat(Double.pi*3/2),
							endAngle: CGFloat(Double.pi*2+Double.pi*3/2),
							clockwise: true)
	}()
	lazy var trackLayer: CAShapeLayer = {
		let layer = CAShapeLayer()
		layer.path = circlePath.cgPath
		layer.lineWidth = 2
		layer.strokeStart = 0.0	// 开始点
		layer.strokeEnd = 1.0		// 终止点
		layer.fillColor = UIColor.clear.cgColor
		layer.strokeColor = UIColor.lightGray.cgColor
		return layer
	}()
	lazy var shapeLayer: CAShapeLayer = {
		let layer = CAShapeLayer()
		layer.path = circlePath.cgPath
		layer.lineWidth = 2
		layer.strokeStart = 0.0	// 开始点
		layer.strokeEnd = 0.0		// 终止点
		layer.fillColor = UIColor.clear.cgColor
		layer.strokeColor = UIColor.white.cgColor
		return layer
	}()
	lazy var percentLabel: UILabel = {
		let label = UILabel.init()
		label.frame = self.bounds
		label.text = "0%"
		label.textColor = UIColor.white
		label.textAlignment = NSTextAlignment.center
		label.font = UIFont.systemFont(ofSize: 15)
		return label
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.layer.masksToBounds = true
		self.layer.cornerRadius = 10.0
		self.backgroundColor = UIColor.gray
		self.frame = CGRect.init(x: 0, y: 0, width: 88, height: 88)
		
		// 图形1、菊花指示器
		self.addSubview(activityIndicatorView)
	
		// 图形2、环形加载进度器
		self.addSubview(percentLabel)
		percentLabel.layer.addSublayer(trackLayer)// 加在Label上
		percentLabel.layer.addSublayer(shapeLayer)// 加在Label上
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()

		let superView = self.superview

		let window = UIApplication.shared.keyWindow
		let rect = superView!.convert(superView!.bounds, to: window)
		let x = ((window?.bounds.width)! - self.frame.width) / 2
		let y = ((window?.bounds.height)! - self.frame.height) / 2 - rect.origin.y
		self.frame = CGRect(x: x, y: y, width: self.frame.width, height: self.frame.height)
	}
	
	class func showInView(_ view: UIView,_ progress: CGFloat) {
		view.isUserInteractionEnabled = false
		var currentView = self.getCurrentView(view)
		if currentView == nil {
			currentView = CLLoadingView.init(frame: CGRect.zero)
			view.addSubview(currentView!)
			
		} else {
			view.bringSubviewToFront(currentView!)
		}
		
		DispatchQueue.main.async {
			if progress < 0.0 {
				// 图形1、菊花指示器
				currentView!.activityIndicatorView.isHidden = false
				currentView!.percentLabel.isHidden = true
				
				currentView!.activityIndicatorView.startAnimating()
			} else {
				// 图形2、环形加载进度器
				currentView!.activityIndicatorView.isHidden = true
				currentView!.percentLabel.isHidden = false
				
				let value = min(progress, 1.0)
				currentView!.shapeLayer.strokeEnd = value
				currentView!.percentLabel.text = String.init(format: "%.0f%%", value * 100)
			}
		}
	}
	
	 class func hide(_ view: UIView) {
		let currentView = self.getCurrentView(view)
		if currentView == nil {
			return()
		}
		DispatchQueue.main.async {
			currentView!.superview!.isUserInteractionEnabled = true
			currentView!.activityIndicatorView.stopAnimating()
			currentView!.removeFromSuperview()
		}
	}
	
	class func getCurrentView(_ superView: UIView) -> CLLoadingView? {
		for view in superView.subviews.reversed() {
			if view.isKind(of: CLLoadingView.self) {
				return view as? CLLoadingView
			}
		}
		return nil
	}
}
