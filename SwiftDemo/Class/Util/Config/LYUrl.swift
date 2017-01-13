
import Foundation
import UIKit

func RequestAPI(api: NSString) ->NSString {
    
    // 测试服
    let serverHost = "http://192.168.30.44:1111"
    // 正式服
//    let serverHost = "http://ymapp.seejoys.net.cn"
    
    return NSString.init(format: "%@/%@", serverHost, api)
}

struct UrlString {
    
    static let home = RequestAPI(api: "Api/Home")                             //首页信息GET
}

