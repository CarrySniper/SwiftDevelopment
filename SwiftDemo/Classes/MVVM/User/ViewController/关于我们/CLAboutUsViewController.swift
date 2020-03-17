//
//  CLAboutUsViewController.swift
//  SwiftDemo
//
//  Created by CJQ on 2020/3/17.
//  Copyright © 2020 cl. All rights reserved.
//

import UIKit

class CLAboutUsViewController: CLBaseViewController {

	@IBOutlet weak var logo: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var versionLabel: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		self.setupUI()
		
		self.logo.image = ConfigImage.appIcon
		self.nameLabel.text = Bundle.main.appDisplayName;
		self.versionLabel.text = "Version：" + AppInfo.appVersion + " (" + AppInfo.buildVersion + ")";
    }
	
	// MARK: - 设置UI
	private func setupUI() -> Void {
		self.logo.layer.cornerRadius = 8;
		self.logo.layer.masksToBounds = true
	}
	
	// MARK: - Action
	/// 联系我们
	/// - Parameter sender: <#sender description#>
	@IBAction func contactUsAction(_ sender: Any) {
		let vc = CLWebViewController.init()
		vc.loadUrlString(AppStore.protocolUrl, title: "联系我们")
		self.navigationController?.pushViewController(vc, animated: true)
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
