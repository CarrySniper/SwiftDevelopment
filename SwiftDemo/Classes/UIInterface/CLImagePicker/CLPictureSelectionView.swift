//
//  CLPictureSelectionView.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/16.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit

class CLPictureSelectionView: CLPopupView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
	var imageHandler: CLImageHandler!
	
	@IBOutlet weak var cameraButton: UIButton!
	@IBOutlet weak var albumButton: UIButton!
	@IBOutlet weak var cancelButton: UIButton!
	
	
	@IBAction func cameraAction(_ sender: Any) {
		CLImagePicker.sharedInstance().show(true, 300, .camera, imageHandler)
		
		self.hide()
	}
	@IBAction func albumAction(_ sender: Any) {
		CLImagePicker.sharedInstance().show(true, 300, .photoLibrary, imageHandler)
		
		self.hide()
	}
	@IBAction func cancelAction(_ sender: Any) {
		self.hide()
	}
	
	class func show(_ imageHandler: CLImageHandler?) {
		let view: CLPictureSelectionView = CLPictureSelectionView.loadViewFromNib() as! CLPictureSelectionView

		view.type = .sheet
		view.hideWhenTouchOutside = true

		view.imageHandler = imageHandler
		
		view.show()
	}
	
	override func show() {
		super.show()
		
		self.snp.makeConstraints { (make) in
			make.width.equalTo(SCREEN_WIDTH())
			make.height.equalTo(207+CLFrame.safeAreaBottom)
		}
	}
}
