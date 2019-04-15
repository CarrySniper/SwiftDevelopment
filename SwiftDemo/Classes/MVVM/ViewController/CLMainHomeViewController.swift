//
//  CLMainHomeViewController.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/2.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit

class CLMainHomeViewController: CLBaseHomeViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		let rightBarItem = UIBarButtonItem.init(image: UIImage.init(named: "navigation_cancel"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(aaaa))
		self.navigationItem.rightBarButtonItem = rightBarItem
    }
    
	@objc func aaaa() {
	
		
//		let window = CLPopupWindow.sharedInstance()
//		window.show()
	}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
