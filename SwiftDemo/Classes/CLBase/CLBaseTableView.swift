//
//  CLBaseTableView.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/9.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit
import SnapKit

class CLBaseTableView: UITableView, UITableViewDelegate, CLEmptyDataSource {
	
	/// EmptyData
	var emptyCenterOffset: CGPoint!
	var emptyText: String!
	var emptyImage: UIImage!
	var emptyButtonText: String!
	var emptyButtonBackgroundImage: UIImage!
	var emptyActionHandler: CLViodHandler!
	
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
		
		self.delegate = self
		// 1、固定行高（二选一，要注释一个）
		self.rowHeight = 50.0
		// 2、自动行高（二选一，要注释一个）
		//self.estimatedRowHeight = 44.0
		//self.rowHeight = UITableView.automaticDimension
		
		// 让tableview不显示分割线
		//self.separatorStyle = UITableViewCell.SeparatorStyle.none;
		
		// 分割线颜色，xib的要在显示后再设置，不然顺序问题设置无效
		self.separatorColor = CLColor.lineColor
		// 背景颜色
		self.backgroundColor = CLColor.viewColor
		//设置分割线内边距
		self.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
		// 头部
		self.tableHeaderView = UIView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH(), height: 0.001))
		// 脚部
		self.tableFooterView = UIView.init()
		
		
		if #available(iOS 11.0, *) {
			self.contentInsetAdjustmentBehavior = ContentInsetAdjustmentBehavior.never;
		} else {
			
		}
		
	}
	
	
	//MARK: - CLEmptyDataSource
	/// 空数据时设置回调UIView
	func cl_emptyViewDataSource(_ scrollView: UIScrollView) -> UIView? {
		let view = CLEmptyView.loadView()
		view.label.text = ConfigText.emptyData
		view.imageView.image = ConfigImage.emptyData
		/// 看按钮需不需要显示
		if emptyButtonText != nil || emptyButtonBackgroundImage != nil {
			view.button.isHidden = false
			view.button.isEnabled = true
			view.button.setTitle(emptyButtonText != nil ? emptyButtonText : "", for: UIControl.State.normal)
			view.button.setBackgroundImage(emptyButtonBackgroundImage != nil ? emptyButtonBackgroundImage : UIImage(), for: UIControl.State.normal)
			
			view.buttonAction{ () in
				if self.emptyActionHandler != nil {
					self.emptyActionHandler()
				}
			}
		} else {
			view.button.isHidden = true
			view.button.isEnabled = false
		}

		return view
	}
	
	/// 空数据UIView偏移设置回调
	func cl_emptyViewOffset(_ scrollView: UIScrollView) -> CGPoint? {
		return nil
	}
}
