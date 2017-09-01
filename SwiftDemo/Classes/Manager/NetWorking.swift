//
//  NetWorking.swift
//  SwiftDemo
//
//  Created by 炬盈科技 on 2017/9/1.
//  Copyright © 2017年 CJQ. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON

//格式: typealias 闭包名称 = (参数名称: 参数类型) -> 返回值类型
typealias responseBlock = (_ responseData: Any) -> Void

class NetWorking: NSObject {
    static func request(url: String, method: HTTPMethod, parameters: NSDictionary, block: @escaping responseBlock) {
        let parameters = parameters as! Parameters
        
        Alamofire.request(url, method: method, parameters: parameters).responseJSON {
            response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            switch response.result {
            case .success( _):
                
                if let data = response.result.value {
                    block(JSON(data))
                }
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}
