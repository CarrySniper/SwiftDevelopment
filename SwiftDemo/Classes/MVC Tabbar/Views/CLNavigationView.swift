//
//  CLNavigationView.swift
//  SwiftDemo
//
//  Created by 炬盈科技 on 2017/9/14.
//  Copyright © 2017年 CJQ. All rights reserved.
//

import UIKit

class CLNavigationView: UIView {
    var titleLabel = UILabel()
    
    init() {
        super.init(frame: CGRect(x: 0,y: 0, width: UIScreen.main.bounds.size.width, height:64))
        
        self.backgroundColor = Color.navigationColor
        
        self.titleLabel = UILabel.init(frame: CGRect(x: 44,y: 20, width: UIScreen.main.bounds.size.width - 88, height:44))
        self.titleLabel.textColor = Color.title
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        self.titleLabel.textAlignment = .center
        self.addSubview(self.titleLabel)
        
        let lineView = UIView.init(frame: CGRect(x:0, y:64, width: UIScreen.main.bounds.size.width, height: 0.5))
        lineView.backgroundColor = Color.lineColor
        self.addSubview(lineView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
