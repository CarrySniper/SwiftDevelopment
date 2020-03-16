//
//  CLUserInfoEditViewController.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/8.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit

class CLUserInfoEditViewController: CLBaseViewController, UITextViewDelegate {

	@IBOutlet weak var textView: CLBaseTextView!
	@IBOutlet weak var doneButton: UIButton!
	
	var content: String!
	var placeholder: String!
	
	var doneHandler: CLStringHandler!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		self.title = "编辑"
		let parameters : Dictionary = self.routerParameters[MGJRouterParameterUserInfo] as! [String: Any];
		
		self.doneHandler = parameters["doneHandler"] as? CLStringHandler
		
		self.textView.text = parameters["content"] as? String
		self.textView.placeholder = parameters["placeholder"] as? String
		self.textView.placeholderColor = CLColor.placeholder
		
		self.doneButton.layer.cornerRadius = 15
		self.doneButton.layer.masksToBounds = true
    }

	@IBAction func doneAction(_ sender: Any) {
		textView.resignFirstResponder()
		if (doneHandler != nil) {
			doneHandler(textView.text.trimSpace)
		}
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
