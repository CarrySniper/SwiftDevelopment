//
//  CLTextView.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/8.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit
import Foundation

class CLTextView: UITextView {
	
	/** 占位文字 */
	var placeholder: String? {
		didSet {
			self.setNeedsDisplay()
		}

	}
	/** 占位文字颜色 */
	var placeholderColor: UIColor? {
		didSet {
			self.setNeedsDisplay()
		}
	}
	
	/// 重写方法
	override var font: UIFont? {
		didSet {
			self.setNeedsDisplay()
		}
	}
	
	override var text: String! {
		didSet {
			self.setNeedsDisplay()
		}
	}
	
	override var attributedText: NSAttributedString! {
		didSet {
			self.setNeedsDisplay()
		}
	}
	
	
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
		
		// 如果有文字，就直接返回，不需要画占位文字
		if self.hasText == true {
			return()
		}
		// 属性
		let attributes = [NSAttributedString.Key.foregroundColor: self.placeholderColor as Any,
						  NSAttributedString.Key.font: self.font as Any]
		
		// 画文字
		var tempFrame: CGRect = rect
		tempFrame.origin.x = 5
		tempFrame.origin.y = 8
		tempFrame.size.width -= 2 * tempFrame.origin.x
		self.placeholder?.draw(in: tempFrame, withAttributes: attributes)
    }

	override init(frame: CGRect, textContainer: NSTextContainer?) {
		super.init(frame: frame, textContainer: textContainer)
		self.setup()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		self.setup()
	}
	
	// MARK: - 设置
	private func setup() {
		// 设置默认字体
		self.font = UIFont.systemFont(ofSize: 15)
		
		// 设置默认颜色
		self.placeholder = ""
		
		// 设置默认颜色
		self.placeholderColor = UIColor.gray
		
		NotificationCenter.default.addObserver(self, selector: #selector(textDidChange), name: UITextView.textDidChangeNotification, object: self)
	}

	@objc func textDidChange(notification: Notification) {
		// 会重新调用drawRect:方法
		self.setNeedsDisplay()
	}

	deinit {
		NotificationCenter.default.removeObserver(self)
	}
	
}
