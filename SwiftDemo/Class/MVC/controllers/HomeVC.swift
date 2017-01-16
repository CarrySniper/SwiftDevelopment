//
//  HomeVC.swift
//  SwiftDemo
//
//  Created by 思久科技 on 2017/1/16.
//  Copyright © 2017年 思久科技. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let parameters: Parameters = ["page": "1", "pageSize":"20"]
        Alamofire.request(ServerAPI.advertisement, method: .get, parameters: parameters).responseJSON {
            response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            switch response.result {
            case .success( _):
                if let data = response.result.value {
                    let array = JSON(data)
                    print(array)
                    
                }
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
