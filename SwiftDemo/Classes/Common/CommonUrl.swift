//
//  CommonUrl.swift
//  SwiftDemo
//
//  Created by 炬盈科技 on 2017/9/1.
//  Copyright © 2017年 CJQ. All rights reserved.
//

import Foundation

struct ServerAPI {
    
    static let home                 = RequestAPI(api: "Api/Home")                    //首页信息GET
    static let advertisement        = RequestAPI(api: "Api/Ad")                      //广告数据GET
}

func RequestAPI(api: String) ->String {
    
    // 测试服
    let serverHost = "http://192.168.30.44:1111"
    // 正式服
    //    let serverHost = "http://ymapp.seejoys.net.cn"
    
    return String(format: "%@/%@", serverHost, api) as String
}