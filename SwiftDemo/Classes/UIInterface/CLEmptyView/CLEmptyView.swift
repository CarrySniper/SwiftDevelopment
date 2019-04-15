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
	
	typealias CLViodHandler = () -> Void
	var actionHandler: CLViodHandler!
	
	
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
	
	@IBAction func buttonAction(_ sender: Any) {
		if actionHandler != nil {
			actionHandler()
		}
	}
	

//	required init?(coder aDecoder: NSCoder) {
//		fatalError("init(coder:) has not been implemented")
//	}

	/*
	
	
	- (IBAction)clickAction:(id)sender {
	if (self.actionBlock) {
	self.actionBlock(sender);
	}
	}
*/
}
