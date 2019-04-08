//
//  CLUserInfoViewController.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/8.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit

class CLUserInfoViewController: CLBaseViewController {

	@IBOutlet weak var avatar: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var phoneLabel: UILabel!
	@IBOutlet weak var signatureLabel: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		self.title = "个人资料"
		
		self.setupUI()
    }

	@IBAction func avatarAction(_ sender: UIButton) {
	}
	
	@IBAction func nameAction(_ sender: UIButton) {
		let user = CLUser.currentUser()
		
		let vc = CLUserInfoEditViewController.init()
		vc.content = user?.username
		vc.placeholder = "输入昵称"
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	@IBAction func phoneAction(_ sender: UIButton) {
	}
	
	@IBAction func signatureAction(_ sender: UIButton) {
		let user = CLUser.currentUser()
		
		let vc = CLUserInfoEditViewController.init()
		vc.content = user?.signature
		vc.placeholder = "输入个人签名（不超过30字）"
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	// MARK: - 设置UI
	private func setupUI() {
		avatar.layer.cornerRadius = 25.0
		avatar.layer.masksToBounds = true
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
