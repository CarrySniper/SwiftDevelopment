//
//  Config.swift
//  SwiftDemo
//
//  Created by 炬盈科技 on 2017/8/31.
//  Copyright © 2017年 CJQ. All rights reserved.
//

import Foundation
import UIKit

/// 数值
struct ConfigNumber {
    static let cellHeight: CGFloat          = 50.0
    static let spaceHeight: CGFloat         = 8.0
}

/// API字段
struct ConfigAPIField {
    
    static let Id                           = "Id"
    static let Name                         = "Name"
    static let Status                       = "Status"
}

/// 文本
struct ConfigText {
    
    static let `default`                    = "default"
    static let advertisement                = UIImage.init(named: "default")
    
}


/// 图片
struct ConfigImage {
    
    static let `default`                    = UIImage.init(named: "default")
    static let appIcon                      = UIImage.init(named: "appIcon")
    static let avatar                       = UIImage.init(named: "avatar")
}
