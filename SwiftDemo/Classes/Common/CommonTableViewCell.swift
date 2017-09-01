//
//  CommonTableViewCell.swift
//  SwiftDemo
//
//  Created by 炬盈科技 on 2017/8/31.
//  Copyright © 2017年 CJQ. All rights reserved.
//

import UIKit

class CommonTableViewCell: UITableViewCell {
    
    func setModel(model: CommonModel) -> CGFloat {
        
        return 80.0
    }
    
    static func dequeueReusable(_ tableView: UITableView, _ identifier: String) -> CommonTableViewCell{
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier);
        if (cell == nil) {
            cell = CommonTableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier);
        }
        return cell! as! CommonTableViewCell
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSubviews()
        
        self.backgroundColor = UIColor.groupTableViewBackground
        self.imageView?.removeFromSuperview()
        self.textLabel?.removeFromSuperview()
        
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
