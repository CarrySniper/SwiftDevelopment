//
//  Config.swift
//  SwiftDemo
//
//  Created by 思久科技 on 2017/1/17.
//  Copyright © 2017年 思久科技. All rights reserved.
//

import Foundation
import UIKit



/// API字段
struct ConfigAPIField {
    
    static let Id                   = "Id"
    static let Name                 = "Name"
    static let Status               = "Status"
}

/// 文本
struct ConfigText {
    
    static let `default`            = "default"
    static let advertisement        = UIImage.init(named: "default")

}


/// 图片
struct ConfigImage {
    
    static let `default`            = UIImage.init(named: "default")
    static let appIcon              = UIImage.init(named: "appIcon")
    static let avatar               = UIImage.init(named: "avatar")
}
