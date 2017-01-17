//
//  BaseModel.swift
//  SwiftDemo
//
//  Created by 思久科技 on 2017/1/17.
//  Copyright © 2017年 思久科技. All rights reserved.
//

import UIKit
import HandyJSON

/// 基本模型，可直接使用，可以继承,都给默认值
class BaseModel: HandyJSON {

    var Id: NSNumber = 0
    
    var Name: String = ""
    
    var Status:NSNumber = 0
    
    var Image: UIImage = ConfigImage.default!
    
    
    
    
    
    
    required init(){}
}
