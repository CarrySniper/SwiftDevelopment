//
//  String+CLExtension.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/4.
//  Copyright © 2019 cl. All rights reserved.
//

import Foundation

extension String {
	/*
	*去掉首尾空格
	*/
	var trimSpace: String {
		let whitespace = NSCharacterSet.whitespaces
		return self.trimmingCharacters(in: whitespace)
	}
	/*
	*去掉首尾空格 包括后面的换行 \n
	*/
	var removeHeadAndTailSpacePro:String {
		let whitespace = NSCharacterSet.whitespacesAndNewlines
		return self.trimmingCharacters(in: whitespace)
	}
	/*
	*去掉所有空格
	*/
	var removeAllSapce: String {
		return self.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
	}
	/*
	*去掉首尾空格 后 指定开头空格数
	*/
	func beginSpaceNum(num: Int) -> String {
		var beginSpace = ""
		for _ in 0..<num {
			beginSpace += " "
		}
		return beginSpace + self.removeHeadAndTailSpacePro
	}
}
