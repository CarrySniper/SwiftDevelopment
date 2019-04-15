//
//  CLUserSystemTableViewCell.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/10.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit

class CLUserSystemTableViewCell: CLBaseTableViewCell {

	@IBOutlet weak var icon: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var contentLabel: UILabel!
	@IBOutlet weak var moreIcon: UIImageView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
