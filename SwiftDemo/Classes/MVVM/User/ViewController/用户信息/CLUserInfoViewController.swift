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
	
	/// 懒加载
	lazy var viewModel: CLUserViewModel = {
		var vm = CLUserViewModel.init()
		vm.view = self.view
		return vm
	}()
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		self.title = "个人资料"
		
		self.setupUI()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.loadUserData()
		
	}
	
	func loadUserData() {
		let user = CLUser.currentUser()
		if user == nil {
			nameLabel.text = "登录/注册"
			avatar.image = ConfigImage.avatar
			signatureLabel.text = "这人很懒，什么都没有留下～"
			phoneLabel.text = "未绑定"
		} else {
			nameLabel.text = user?.username
			avatar.setImageUrl(user!.avatar, ConfigImage.avatar)
			signatureLabel.text = user?.signature
			let phone: NSString = (user!.mobilePhoneNumber as NSString?)!
			if phone.length > 7 {
				phoneLabel.text = "\(phone.substring(to: 3))****\(phone.substring(from: 7))"
			} else {
				phoneLabel.text = "未绑定"
			}
		}
	}
	
	@IBAction func avatarAction(_ sender: UIButton) {
		CLPictureSelectionView.show(self) { (image) in
			self.viewModel.setAvatar(avatarImage: image, handler: {
				self.avatar.image = image
			})
		}
	}
	
	@IBAction func nameAction(_ sender: UIButton) {
		let user = CLUser.currentUser()
		
		let vc = CLUserInfoEditViewController.init()
		vc.content = user?.username
		vc.placeholder = "输入昵称"
		self.navigationController?.pushViewController(vc, animated: true)
		
		vc.doneHandler = { (content) in
			self.viewModel.setInfo(username: content, signature: user!.signature, handler: {
				self.customBack()
				self.nameLabel.text = content
			})
		}
	}
	
	@IBAction func phoneAction(_ sender: UIButton) {
		SHOW_TOAST_INFO("电话不能修改")
	}
	
	@IBAction func signatureAction(_ sender: UIButton) {
		let user = CLUser.currentUser()
		
		let vc = CLUserInfoEditViewController.init()
		vc.content = user?.signature
		vc.placeholder = "输入个人签名（不超过50字）"
		self.navigationController?.pushViewController(vc, animated: true)
		
		vc.doneHandler = { (content) in
			self.viewModel.setInfo(username: user!.username, signature: content, handler: {
				self.customBack()
				self.signatureLabel.text = content
			})
		}
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
