//
//  CLBaseTableView.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/9.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit
import SnapKit

class CLBaseTableView: UITableView, CLEmptyDataSource {
	
	

	override init(frame: CGRect, style: UITableView.Style) {
		super.init(frame: frame, style: style)
		
		self.cl_setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		self.cl_setup()
	}
	
	private func cl_setup() {
		
		self.emptyDataSource = self
		
		self.backgroundColor = CLColor.viewColor
		// 分割线颜色
		self.separatorColor = CLColor.lineColor
		// 让tableview不显示分割线
		self.separatorStyle = UITableViewCell.SeparatorStyle.none;
		
		if #available(iOS 11.0, *) {
			self.contentInsetAdjustmentBehavior = ContentInsetAdjustmentBehavior.never;
		} else {
		}
		
	}
	
	func cl_emptyViewDataSource(_ scrollView: UIScrollView) -> UIView? {
		let view = CLEmptyView.loadView()
		return view
	}
	
	func cl_emptyViewOffset(_ scrollView: UIScrollView) -> CGPoint? {
		return nil
	}
}
