//
//  CLPopupView.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/11.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit
import SnapKit

enum CLPopupViewType: Int {
	case custom = 0
	case alert
	case sheet
}

class CLPopupView: UIView, UIGestureRecognizerDelegate {
	
	/// 弹出类型，默认custom
	var type: CLPopupViewType!
	
	/// 当外部被触发时，是否隐藏 默认true
	var hideWhenTouchOutside: Bool!
	
	/// CLPopupWindow的覆盖层
	var windowAttachedView: UIView!
	
	/// lazy var get 视图容器
	private lazy var containerView: UIView = {
		let view = UIView.init(frame: UIScreen.main.bounds)
		view.backgroundColor = UIColor.clear
		view.addGestureRecognizer(tapGesture)
		return view
	}()
	
	/// lazy var get 隐藏手势
	lazy var tapGesture: UITapGestureRecognizer = {
		var gesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(actionTap))
		gesture.cancelsTouchesInView = false
		gesture.delegate = self
		return gesture
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.cl_setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		self.cl_setup()
	}
	
	private func cl_setup() {
		// 设置默认type
		type = .custom
		// 设置点击外部隐藏
		hideWhenTouchOutside = true
		// 获取CLPopupWindow attachedView
		windowAttachedView = CLPopupWindow.sharedInstance().attachedView
		
//		CLPopupWindow.sharedInstance().backgroundColor = UIColor.colorHex("666666", 0.8)
	}
	
	func show() {
		
		windowAttachedView.addSubview(containerView)
		containerView.addSubview(self)
		CLPopupWindow.sharedInstance().reloadView()
		
		switch type {
		case .alert? :
			self.snp.updateConstraints { (make) in
				make.center.equalTo(containerView)
			}
			break
		case CLPopupViewType.sheet? :
			self.snp.updateConstraints { (make) in
				make.centerX.equalTo(containerView)
				make.bottom.equalTo(containerView)
			}
			break
		case .custom?:
			break
			
		default: break
			
		}
		self.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
		self.alpha = 0.5;
		UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
			self.transform = CGAffineTransform.identity
			self.alpha = 1.0
		}) { (finished) in
			
		}

	}
	
	func hide() {
		UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
			self.transform = CGAffineTransform.identity
			self.alpha = 0.5
		}) { (finished) in
			self.removeFromSuperview()
			self.containerView.removeFromSuperview()
			CLPopupWindow.sharedInstance().reloadView()
		}
	}
	
	
	@objc func actionTap(recognizer : UITapGestureRecognizer) {
		if hideWhenTouchOutside == true {
			self.hide()
		}
	}
}
