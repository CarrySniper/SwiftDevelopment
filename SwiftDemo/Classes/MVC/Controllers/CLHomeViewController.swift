//
//  CLHomeViewController.swift
//  SwiftDemo
//
//  Created by 炬盈科技 on 2017/8/31.
//  Copyright © 2017年 CJQ. All rights reserved.
//

import UIKit
import SnapKit

class CLHomeViewController: CommonViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let label = self.createLabel()
        label.text = "If you prefer not to use either of the aforementioned dependency managers, you can integrate SnapKit into your project manually.";
        label.backgroundColor = UIColor.red
        self.view.addSubview(label);
        label.snp.makeConstraints { (make) in
            make.width.equalTo(self.view)
            make.top.equalTo(64)
            make.centerX.equalTo(self.view)
        }
        
        let imageView = UIImageView.init(frame: CGRect(x: 0, y: 150, width: 100, height: 100))
        imageView.backgroundColor = UIColor.lightGray
        imageView.image = UIImage(named: "tabbar_selected2.pdf")
        self.view.addSubview(imageView)
        
        
        let button = self.createButton(title: "按钮",
                                       image: UIImage(named: "tabbar_selected2")!,
                                       action: #selector(aaa))
        button.frame = CGRect(x: 0, y: 300, width: 100, height: 100)
        self.view.addSubview(button)
        
    }
    
    func aaa() {
        print("aaaa");
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
