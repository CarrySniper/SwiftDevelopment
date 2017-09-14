//
//  CLMeTableViewCell.swift
//  SwiftDemo
//
//  Created by 炬盈科技 on 2017/9/14.
//  Copyright © 2017年 CJQ. All rights reserved.
//

import UIKit

class CLMeTableViewCell: CommonTableViewCell {

    var nameLabel = UILabel()
    var iconImage = UIImageView()
    
    override func setModel(model: CommonModel) -> CGFloat {
        self.nameLabel.text = model.Name
        return 80.0
    }
    
    static func dequeueReusable(_ tableView: UITableView, _ identifier: String) -> CommonTableViewCell{
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier);
        if (cell == nil) {
            cell = CLMeTableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier);
        }
        return cell! as! CommonTableViewCell
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        self.iconImage = UIImageView.init()
        self.contentView.addSubview(self.iconImage) ;self.iconImage.backgroundColor = UIColor.gray
        self.iconImage.snp.makeConstraints { (make) in
            make.width.height.equalTo(30)
            make.left.equalTo(16)
            make.centerY.equalTo(self.contentView)
        }
        
        self.nameLabel = UILabel.init()
        self.contentView.addSubview(self.nameLabel)
        self.nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.iconImage.snp.right).offset(8)
            make.right.equalTo(self.contentView).offset(-8)
            make.centerY.equalTo(self.contentView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
