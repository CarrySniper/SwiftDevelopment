//
//  CLUserHomeViewController.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/2.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit
import YYModel
import SnapKit

class CLUserHomeViewController: CLBaseHomeViewController {

	@IBOutlet weak var avatar: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var signatureLabel: UILabel!
	
	@IBOutlet weak var funcView: UIView!
	@IBOutlet weak var tableView: CLBaseTableView!
	
	/// 懒加载
	lazy var logoutButton: UIButton = {
		var button = UIButton.init(type: UIButton.ButtonType.custom)
		button.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH(), height: 80)
		button.setTitle("退出登录", for: UIControl.State.normal)
		button.setTitleColor(CLColor.textSelected, for: UIControl.State.normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
		button.addTarget(self, action: #selector(logoutAction), for: UIControl.Event.touchUpInside)
	
		return button
	}()
	
	/// 状态栏文字颜色设置，见CLBaseNavigationController.swift
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
	
		let rightBarItem = UIBarButtonItem.init(image: UIImage.init(named: "navigation_cancel"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(aaaa))
		self.navigationItem.rightBarButtonItem = rightBarItem
		
		self.title = ""
		self.tabBarItem.title = "User"
		self.setupUI()
		
		
		
		let dict = ["className":"ssgasg","age":18] as [String : Any]
		
		let model : CLBaseModel = CLBaseModel.yy_model(withJSON: dict)!
		print(model.className, IS_IPHONE_X_SERIES())
		
		
	}
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
//		self.navigationController?.navigationBar.isHidden = false
//		self.navigationController?.navigationBar.isTranslucent = false
		self.navigationController?.navigationBar.shadowImage = UIImage.init()
		self.navigationController?.navigationBar.setBackgroundImage(UIImage.fromColor(UIColor.colorHex("#F55D64")), for: UIBarMetrics.default)
		
		self.navigationController?.navigationBar.tintColor = UIColor.white
		self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white,NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20)]
		
		self.loadUserData()
	}
//	- (void)viewWillAppear:(BOOL)animated {
//	[super viewWillAppear:animated];
//
//	[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
//	self.navigationController.navigationBar.translucent = YES;
//	self.navigationController.navigationBar.shadowImage = [UIImage new];
//	[self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//
//	[self loadUserData];
//	}
	@objc func aaaa() {
		HIDE_LOADING()
		
		self.tableView.reloadData()
	}

	func loadUserData() {
		let user = CLUser.currentUser()
		if user == nil {
			nameLabel.text = "登录/注册"
			avatar.image = ConfigImage.avatar
			signatureLabel.text = "这人很懒，什么都没有留下～"
			tableView.tableFooterView = UIView.init()
		} else {
			
			nameLabel.text = user?.username
			avatar.image = ConfigImage.avatar
			signatureLabel.text = user?.signature
			
			tableView.tableFooterView = logoutButton
		}
	}
	
	@IBAction func userInfoAction(_ sender: Any) {
		
		
		if CLUser.currentUser() == nil {
			AppDelegate.postNotificationToLoginPage()
		} else {
			print("去y个人信息页")
			let vc = CLUserInfoViewController.init()
			self.navigationController?.pushViewController(vc, animated: true)
		}
		
//		struct Number {
//			static var number: Int = 0
//		}
//		Number.number += 1
		
//		SHOW_SUCCESS(String (format: "HUD %d", Number.number))
//SHOW_LOADING()
//		return()
//
	}
	
	/// 退出登录
	@objc func logoutAction() {
		
	}
	
	// MARK: - 设置UI
	private func setupUI() {
		avatar.layer.cornerRadius = 30.0
		avatar.layer.masksToBounds = true
	
		tableView.tableHeaderView = UIView.init(frame: CGRect (x: 0, y: 0, width: SCREEN_WIDTH(), height: funcView.bounds.height/2))
		
		self.makeView(funcView)
	}
	
	func makeView(_ view: UIView) {
		view.layer.shadowColor = UIColor.colorHex("#E5E5E5").cgColor
		view.layer.shadowOffset = CGSize(width: 0, height: 1.5)
		view.layer.shadowRadius = 3;
		view.layer.shadowOpacity = 1;
		view.layer.cornerRadius = 5;
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
