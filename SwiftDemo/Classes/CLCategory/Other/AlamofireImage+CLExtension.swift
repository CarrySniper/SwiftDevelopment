//
//  AlamofireImage+CLExtension.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/10.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit
import AlamofireImage


extension UIImageView {
	
	func setImageUrl(_ urlString : String?,_ placeholder: UIImage?) {
		if urlString == nil {
			self.image = placeholder
		} else {
			let url = URL(string: urlString!)
			self.af_setImage(withURL: url!, placeholderImage: placeholder)
		}
	}
	
}
