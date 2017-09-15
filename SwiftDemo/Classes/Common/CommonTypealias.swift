//
//  CommonTypealias.swift
//  SwiftDemo
//
//  Created by 炬盈科技 on 2017/9/15.
//  Copyright © 2017年 CJQ. All rights reserved.
//

import Foundation

typealias VoidBlock = () -> Void

typealias ErrorBlock = (_ code: NSInteger, _ message: String) -> Void


/*
 
 1、定义闭包类型
 typealias ErrorBlock = (_ code: NSInteger, _ message: String) -> Void
 
 2、声明闭包函数变量
 private var errorBlcok: ErrorBlock?
 
 3、声明含有闭包变量的函数（可省略，建议使用）。当省略这一步时，需要去掉private限定，然后直接使用变量属性
 func setMyBlock(block: @escaping ErrorBlock) {
    self.errorBlcok = block
 }
 
 4、触发闭包函数
 let code: NSInteger = 404
 let msg: String = "对象不存在"
 
 if errorBlcok != nil {
    errorBlcok!(code, msg)
 }
 
 5、闭包回调
 使用第3步，调用函数
 myObject.errorBlcok { (code, message) in
    print("error1：" +  (String)(code) + (message))
 }
 
 省略第3步，直接使用变量属性
 myObject.errorBlcok = { (code, message) -> Void in
    print("error2：" +  (String)(code) + (message))
 }
 
 */
