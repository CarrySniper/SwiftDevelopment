//
//  CLListsTableViewCell.swift
//  SwiftDemo
//
//  Created by 炬盈科技 on 2017/8/31.
//  Copyright © 2017年 CJQ. All rights reserved.
//

import UIKit

class CLListsTableViewCell: CommonTableViewCell {

    var nameLabel = UILabel()
    var iconImage = UIImageView()
    
    override func setModel(model: CommonModel) -> CGFloat {
        
        return 80.0
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.iconImage = UIImageView.init(frame: CGRect.init(x: 10, y: 10, width: 60, height: 60))
        self.contentView .addSubview(self.iconImage)
        
        self.nameLabel = UILabel.init(frame: CGRect.init(x: 80, y: 10, width: 200, height: 60))
        self.contentView .addSubview(self.nameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
