//
//  CLBaseViewModel.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/1.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit
import AVOSCloud

class CLBaseViewModel: NSObject {
	
	var className: String!	// 类名
	var limit: Int = 10		// 最多返回 10 条结果
	var skip: Int! = 0		// 跳过 20 条结果
	
	typealias CLCodeButtonHandler = (_ button: CLVerificationCodeButton) -> Void
	
	
	/// 同步数据：包含插入、更新两个操作
	///
	/// - Parameters:
	///   - className: <#className description#>
	///   - model: <#model description#>
	public func fetchObject(object: AVObject, model: CLBaseModel) {
		
	}
	
	public func addObject(className: NSString, model: CLBaseModel) {
		
	}
	
	/*
	#pragma mark 插入数据（不包含Pointer）
	+ (void)addObjectWithClassName:(NSString *)className model:(BaseModel *)model resultBlock:(ViewModelObjectBlock)resultBlock {
	AVObject *object = [AVObject objectWithClassName:className];
	NSDictionary *dict = [model yy_modelToJSONObject];
	for (NSString *key in [dict allKeys]) {
	[object setObject:dict[key] forKey:key];
	}
	[object saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
	if (succeeded) {
	// 存储成功
	if (resultBlock) {
	resultBlock(YES, object);
	}
	} else {
	SHOW_ERROR(error)
	if (resultBlock) {
	resultBlock(NO, nil);
	}
	}
	}];
	}
	*/
	
}
