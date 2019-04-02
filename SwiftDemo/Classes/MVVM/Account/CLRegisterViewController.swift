//
//  CLRegisterViewController.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/2.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit

class CLRegisterViewController: CLBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		self.navigationItem.leftBarButtonItem = nil
		
		let rightBarItem = UIBarButtonItem.init(image: UIImage.init(named: "navigation_cancel"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(customBack))
		self.navigationItem.rightBarButtonItem = rightBarItem
		
		self.setupUI()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.navigationController?.navigationBar.shadowImage = UIImage.init()
	}
	
	@objc override func customBack() {
		self.dismiss(animated: true) {
			
		}
	}

	private func setupUI() {
		self.view.backgroundColor = UIColor.white;
		
//		doneButton.layer.cornerRadius = 20;
//		doneButton.layer.masksToBounds = true;
//
//		phoneTextField.delegate = self;
//		passwordTextField.delegate = self;
//
//		phoneTextField.defaultPlaceholder()
//		passwordTextField.defaultPlaceholder()
//
//		// 明文输入
//		secureButton.isSelected = true
//		passwordTextField.isSecureTextEntry = true
//		secureButton.setImage(UIImage.init(named: "icon_show"), for: UIControl.State.normal)
//		secureButton.setImage(UIImage.init(named: "icon_show_no"), for: UIControl.State.selected)
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
