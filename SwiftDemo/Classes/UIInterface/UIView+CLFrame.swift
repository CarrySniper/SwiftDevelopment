//
//  UIView+CLFrame.swift
//  SwiftDemo
//
//  Created by 炬盈科技 on 2017/9/14.
//  Copyright © 2017年 CJQ. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    
    var makeLeft: CGFloat {
        get {
            return frame.minX
        }
        set {
            frame = CGRect(x: newValue, y: frame.minY, width: frame.width, height: frame.height)
        }
    }
    
    var makeTop: CGFloat {
        get {
            return frame.minY
        }
        set {
            frame = CGRect(x: frame.minX, y: newValue, width: frame.width, height: frame.height)
        }
    }
    
    var makeBottom: CGFloat {
        get {
            return frame.maxY
        }
        set {
            frame = CGRect(x: frame.minX, y: newValue - frame.height, width: frame.width, height: frame.height)
        }
    }
    
    var makeWidth: CGFloat {
        get {
            return frame.width
        }
        set {
            frame = CGRect(x: frame.minX, y: frame.minY, width: newValue, height: frame.height)
        }
    }
    
    var makeHeight: CGFloat {
        get {
            return frame.height
        }
        set {
            frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: newValue)
        }
    }
}
