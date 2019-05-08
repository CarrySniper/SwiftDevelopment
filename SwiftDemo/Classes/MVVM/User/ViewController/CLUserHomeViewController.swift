//
//  CLUserHomeViewController.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/2.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit
import Foundation
import YYModel
import SnapKit

class CLUserHomeViewController: CLBaseHomeViewController, UITableViewDelegate, UITableViewDataSource {

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
	
	lazy var dataArray: Array = {
		return [[CLUserSettingType.password, "密码设置", "icon_password", "CLResetPasswordViewController"],
				[CLUserSettingType.about, "关于我们", "icon_about", "CLAboutUsViewController"],
				[CLUserSettingType.feedback, "意见反馈", "icon_feedback", "CLFeedbackViewController"],
				[CLUserSettingType.cleanCache, "清理缓存", "icon_delect", ""],
		]
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
//		SHOW_LOADING(self.view)
	}

	@objc func aaaa() {
//		UIAlertController.showAlert(title: "T##String?", message: "T##String?", handerName: "我要确认") { (UIAlertAction) in
//			print("T##items: Any...##Any")
//		}
//		UIAlertController.showSheet(title: "T##String?", message: "T##String?", handerNameArray: ["aaa","bbb","10"]) { (UIAlertAction, Int) in
//			print(UIAlertAction, Int)
//		}
//		SHOW_LOADING(self.view)
//		HIDE_LOADING()
//
		
//		self.tableView.reloadData()
//		let vc = CLWebViewController.init()
//		vc.loadUrlString(AppInfo.protocolUrl, title: "GitHub")
//		self.navigationController?.pushViewController(vc, animated: true)
//		SHOW_ALERT("温馨提示", "您要退出登录账号吗？", "确认退出") {
//			CLUser.logout()
//			AppDelegate.postNotificationToLoginPage()
//		}
//		let window = UIApplication.shared.keyWindow
//		window!.windowLevel = UIWindow.Level.statusBar
//		let view = UIView.init(frame: UIScreen.main.bounds)
//		view.backgroundColor = UIColor.colorHex("666666", 0.8)
//		window?.addSubview(view)
		
//		let window = CLPopupWindow.sharedInstance()
//		let view = CLAlertView.loadView()
//		window.rootViewController?.view.addSubview(view)

//		let alertView = CLAlertView.loadView()
//		alertView.show()
//
//
//		let alertView1 = CLAlertView.loadView()
//		alertView1.type = .sheet
//		alertView1.show()
//		let window = CLPopupWindow.sharedInstance()
//		window.show()
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
			avatar.setImageUrl(user!.avatar, ConfigImage.avatar)
			if (user?.signature) != nil {
				signatureLabel.text = user?.signature
			} else {
				signatureLabel.text = "这人很懒，什么都没有留下～"
			}
			
			
			tableView.tableFooterView = logoutButton
		}
	}
	
	@IBAction func userInfoAction(_ sender: Any) {
		
		
		if CLUser.currentUser() == nil {
			AppDelegate.postNotificationToLoginPage()
		} else {
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
		SHOW_ALERT("温馨提示", "您要退出登录账号吗？", "确认退出") {
			CLUser.logout()
			AppDelegate.postNotificationToLoginPage()
		}
	}
	//MARK: - UITableViewDelegate
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		
		let rowArray: Array = dataArray[indexPath.section]
		let type: CLUserSettingType = rowArray.first as! CLUserSettingType
		switch type {
		case .password:
			break
		default:
			break
		}
		
		let name: String = rowArray.last as! String
		guard let viewController = UIViewController.loadViewControllerFromName(name) else {
			return
		}
		self.navigationController?.pushViewController(viewController, animated: true)
	}
	
	//MARK: - UITableViewDataSource
	func numberOfSections(in tableView: UITableView) -> Int {
		return dataArray.count
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell: CLUserSystemTableViewCell = CLUserSystemTableViewCell.dequeueXibReusable(tableView, indexPath) as! CLUserSystemTableViewCell
		
		let rowArray: Array = dataArray[indexPath.section]
		
		cell.nameLabel.text = rowArray[1] as? String
		cell.icon.image = UIImage.init(named: (rowArray[2] as? String)!)
		cell.contentLabel.isHidden = true
		
		let type: CLUserSettingType = rowArray.first as! CLUserSettingType
		
		switch type {
		case .password:
			
			break
		default:
			break
		}
		
		
		return cell
	}
	
	// MARK: - 设置UI
	private func setupUI() {
		avatar.layer.cornerRadius = 30.0
		avatar.layer.masksToBounds = true
	
		tableView.tableHeaderView = UIView.init(frame: CGRect (x: 0, y: 0, width: SCREEN_WIDTH(), height: funcView.bounds.height/2+10))
		tableView.bounces = false
		tableView.delegate = self
		tableView.dataSource = self
		tableView.rowHeight = 54.0
		
		tableView.backgroundColor = UIColor.white
		tableView.separatorColor = CLColor.lineColor
		
		CLUserSystemTableViewCell.registerXibForTableView(tableView)
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
