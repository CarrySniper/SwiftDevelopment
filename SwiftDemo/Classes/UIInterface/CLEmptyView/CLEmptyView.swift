//
//  CLEmptyView.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/9.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit

class CLEmptyView: UIView {

	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var label: UILabel!
	@IBOutlet weak var button: UIButton!
	
	
	class func loadView() -> CLEmptyView {
		let view: CLEmptyView = CLEmptyView.loadViewFromNib() as! CLEmptyView
		view.backgroundColor = UIColor.clear
		
		view.label.text = ConfigText.emptyData;
		view.label.textColor = CLColor.textNormal;
		
		view.button.layer.cornerRadius = 20.0;
		view.button.layer.masksToBounds = true;
		view.button.layer.borderWidth = 0.5;
		view.button.layer.borderColor = CLColor.textSelected.cgColor;
		
		view.button.tintColor = CLColor.textSelected;
		view.button.backgroundColor = UIColor.white;
		return view
	}
	
	

//	required init?(coder aDecoder: NSCoder) {
//		fatalError("init(coder:) has not been implemented")
//	}

	/*
	- (instancetype)init
	{
		NSArray *nibViews = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:self options:nil];
		// 得到第n个UIView作为底部容器
		self = (CLEmtpyView *)[nibViews objectAtIndex:0];
		if (self) {
			self.backgroundColor = [UIColor clearColor];
			
			self.label.text = kEmptyText;
			self.label.textColor = COLOR_TEXT_NORMAL;
			
			self.button.layer.cornerRadius = 20.0;
			self.button.layer.masksToBounds = YES;
			self.button.layer.borderWidth = 0.5;
			self.button.layer.borderColor = COLOR_TEXT_SELECT.CGColor;
			
			self.button.tintColor = COLOR_TEXT_SELECT;
		}
		return self;
	}
	
	- (IBAction)clickAction:(id)sender {
	if (self.actionBlock) {
	self.actionBlock(sender);
	}
	}
*/
}
