
import Foundation
import UIKit


struct ServerAPI {
    
    static let home = RequestAPI(api: "Api/Home")                             //首页信息GET
}

func RequestAPI(api: String) ->String {
    
    // 测试服
    let serverHost = "http://192.168.30.44:1111"
    // 正式服
//    let serverHost = "http://ymapp.seejoys.net.cn"
    
    return String(format: "%@/%@", serverHost, api) as String
}


