//
//  CLBaseTableViewCell.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/1.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit

class CLBaseTableViewCell: UITableViewCell {
	
//	func registerForTableView(_ tableView: UITableView) {
//		let className: String = NSStringFromClass(self).components(separatedBy: ".").last!
//		tableView.registerClass(self.class, forCellReuseIdentifier: className)
//	}
	// MARK: - Xib
	// Xib 注册Cell方法
	class func registerXibForTableView(_ tableView: UITableView) {
		let className: String = NSStringFromClass(self).components(separatedBy: ".").last!
		let nib = UINib.init(nibName: className, bundle: nil)
		tableView.register(nib, forCellReuseIdentifier: className)
	}
	
	// Xib获取Cell方法
	class func dequeueXibReusable(_ tableView: UITableView, _ indexPath: IndexPath) -> AnyObject {
		let className: String = NSStringFromClass(self).components(separatedBy: ".").last!
		return tableView.dequeueReusableCell(withIdentifier: className, for: indexPath)
	}

	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		self.contentView.backgroundColor = CLColor.cellColor
		// 设置选中背景
		let view: UIView = UIView()
		view.backgroundColor = CLColor.spaceColor
		self.selectedBackgroundView = view
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
