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
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		self.title = "编辑"
		
		self.textView.text = content
		self.textView.placeholder = placeholder
		self.textView.placeholderColor = CLColor.placeholder
		
		self.doneButton.layer.cornerRadius = 15
		self.doneButton.layer.masksToBounds = true
    }

	@IBAction func doneAction(_ sender: Any) {
		
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
