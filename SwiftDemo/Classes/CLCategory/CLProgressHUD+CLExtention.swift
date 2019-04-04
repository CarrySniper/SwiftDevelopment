//
//  CLProgressHUD+CLExtention.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/4.
//  Copyright © 2019 cl. All rights reserved.
//

import Foundation

extension CLProgressHUD {
	class func showText(_ text: String) {
		CLProgressHUD.sharedSingle().setText(text)
		CLProgressHUD.sharedSingle().show()
	}
	
}
