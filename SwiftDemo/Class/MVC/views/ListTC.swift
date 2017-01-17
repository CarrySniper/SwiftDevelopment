//
//  ListTC.swift
//  SwiftDemo
//
//  Created by 思久科技 on 2017/1/16.
//  Copyright © 2017年 思久科技. All rights reserved.
//

import UIKit

class ListTC: UITableViewCell {

    var nameLabel = UILabel()
    var iconImage = UIImageView()
    
    func setModel(model: BaseModel) -> CGFloat {
        
        return 80.0
    }
    
    static func dequeueReusable(_ tableView: UITableView, _ identifier: String) -> ListTC{
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier);
        if (cell == nil) {
            cell = ListTC.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier);
        }
        return cell! as! ListTC
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
