//
//  CommonTableViewCell.swift
//  SwiftDemo
//
//  Created by 炬盈科技 on 2017/8/31.
//  Copyright © 2017年 CJQ. All rights reserved.
//

import UIKit
import SnapKit

class CommonTableViewCell: UITableViewCell {
    
    func setModel(model: CommonModel) -> CGFloat {
        
        return 80.0
    }
    
    
    
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSubviews()
        
        self.imageView?.removeFromSuperview()
        self.textLabel?.removeFromSuperview()
        
        self.backgroundColor = Color.cellColor
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
