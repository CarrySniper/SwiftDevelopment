//
//  CLBaseModel.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/1.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit
import YYModel

class CLBaseModel: NSObject, NSCoding, NSCopying {
	// Swift 创建 Model 类时，model 类属性变量前需加 @objc ，否则 YYModel 将不能读取 model 类属性变量，即无法解析返回空。
	@objc var objectId : String!
	
	@objc var className : String!
	
	@objc var updatedAt : Date!
	
	@objc var createdAt : Date!
	
	/// 实例化
	override init() {
		super.init()
	}
	/// 直接添加以下代码即可自动完成序列化／反序列化
	func encode(with aCoder: NSCoder) {
		self.yy_modelEncode(with: aCoder)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init()
		self.yy_modelInit(with: aDecoder)
	}

	func copy(with zone: NSZone? = nil) -> Any {
		return self.yy_modelCopy() as Any
	}
	
	func hash() -> UInt {
		return self.yy_modelHash()
	}
	
	func isEqual(object: Any) -> Bool {
		return self.yy_modelIsEqual(object)
	}
	
	func description() -> String {
		return self.yy_modelDescription()
	}
}
