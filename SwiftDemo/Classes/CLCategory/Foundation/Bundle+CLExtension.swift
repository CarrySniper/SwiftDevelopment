//
//  Bundle+CLExtension.swift
//  SwiftDemo
//
//  Created by CJQ on 2020/3/17.
//  Copyright © 2020 cl. All rights reserved.
//

import Foundation

extension Bundle {
	//要确保info.plist文件有相应项，否则获取失败
    var appDisplayName: String {
        if let name = infoDictionary?["CFBundleDisplayName"] as? String {
            return name
        }
        return ""
    }
    var appVersion: String {
        if let version = infoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        }
        return ""
    }
    var buildVersion: String {
        if let version = infoDictionary?["CFBundleVersion"] as? String {
            return version
        }
        return ""
    }
}
