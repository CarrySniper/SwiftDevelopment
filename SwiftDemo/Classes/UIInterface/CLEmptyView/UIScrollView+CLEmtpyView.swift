//
//  UIScrollView+CLEmtpyView.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/9.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit
import Aspects

var kCLEmptyViewKey = "kCLEmptyViewKey"

var kCLEmptyDataSourceKey = "kCLEmptyDataSourceKey"

/// protocol代理
public protocol CLEmptyDataSource {
	
	/// 空数据时UI设置回调
	///
	/// - Parameter scrollView:
	/// - Returns: 回调设置的emptyView
	func cl_emptyViewDataSource(_ scrollView: UIScrollView) -> UIView?
	
	/// 空数@objc @objc 据UI偏移设置回调
	///
	/// - Parameter scrollView:
	/// - Returns: 偏移量
	func cl_emptyViewOffset(_ scrollView: UIScrollView) -> CGPoint?
}

/// 让CLEmptyDataSource的代理方法变可以选实现
extension CLEmptyDataSource {
	func cl_emptyViewDataSource(_ scrollView: UIScrollView) -> UIView? {
		return nil
	}
	
	func cl_emptyViewOffset(_ scrollView: UIScrollView) -> CGPoint? {
		return nil
	}
}

// MARK: - 扩展方法
extension UIScrollView {

	
	/// runtime 扩展存储属性
	var emptyView: UIView? {
		get {
			return objc_getAssociatedObject(self, &kCLEmptyViewKey) as? UIView
		}
		set {
			objc_setAssociatedObject(self, &kCLEmptyViewKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
		}
	}
	/// runtime 扩展存储属性
	var emptyDataSource: CLEmptyDataSource? {
		get {
			return objc_getAssociatedObject(self, &kCLEmptyDataSourceKey) as? CLEmptyDataSource
		}
		set {
			if newValue == nil {
				objc_setAssociatedObject(self, &kCLEmptyDataSourceKey, nil, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
			} else {
				objc_setAssociatedObject(self, &kCLEmptyDataSourceKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
				//黑科技 面向切面编程 AOP
				let wrappedBlock:@convention(block) (AspectInfo)-> Void = { aspectInfo in
					// 你的代码
					print("黑科技 面向切面编程 AOP")
					self.makeEmptyView()
				}
				let wrappedObject: AnyObject = unsafeBitCast(wrappedBlock, to: AnyObject.self)
				do {
					try self.aspect_hook(#selector(UITableView.reloadData), with: AspectOptions.positionBefore, usingBlock: wrappedObject)
				}catch{
					print(error)
				}
			}
		}
	}
	
	//MARK: -
	/// 私有方法 - 制作EmptyView，并设置位置
	private func makeEmptyView() {
		emptyView?.removeFromSuperview()
		/// 判断 1、是不是没有数据；2、是不是实现了代理；3、是不是实现了cl_emptyViewDataSource()方法
		if self.getItemsCount() == 0 && emptyDataSource != nil && ((emptyDataSource?.cl_emptyViewDataSource(self)) != nil) {
			let view = emptyDataSource?.cl_emptyViewDataSource(self)
			if view == nil || view?.isKind(of: UIView.self) == false {
				print("You must return a valid UIView object for -emptyViewDataSource:")
				return
			}
			// 如果返回有UIView，则保存显示
			emptyView = view
			self.addSubview(emptyView!)
			
			// 设置位置偏移
			let offset: CGPoint = self.getOffset()
			let frame: CGRect = view!.frame
			// 禁止将 AutoresizingMask 转换为 Constraints
			view!.translatesAutoresizingMaskIntoConstraints = false
			// 添加 centerX 约束
			let centerXConstraint: NSLayoutConstraint = NSLayoutConstraint(item: view!, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: offset.x)
			// 添加 centerY 约束
			let centerYConstraint: NSLayoutConstraint = NSLayoutConstraint(item: view!, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: offset.y)
			// 添加 width 约束
			let widthConstraint: NSLayoutConstraint = NSLayoutConstraint(item: view!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0.0, constant: frame.size.width)
			// 添加 height 约束
			let heightConstraint: NSLayoutConstraint = NSLayoutConstraint(item: view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0.0, constant: frame.size.height)
			
			//把约束添加到父视图上
			let array: [AnyObject] = [widthConstraint,heightConstraint,centerXConstraint,centerYConstraint]
			self.addConstraints(array as! [NSLayoutConstraint])

		}
	}
	
	/// 私有方法 - 获取代理回传的偏移量
	///
	/// - Returns: 偏移量
	private func getOffset() -> CGPoint {
		var offset = CGPoint(x: 0.0, y: 0.0)
		/// 判断 1、是不是实现了代理；2、是不是实现了cl_emptyViewOffset()方法
		if emptyDataSource != nil && ((emptyDataSource?.cl_emptyViewOffset(self)) != nil) {
			offset = (emptyDataSource?.cl_emptyViewOffset(self))!
		}
		return offset
	}
	
	/// 私有方法 - 获取UITableView、UICollectionView数据量
	///
	/// - Returns: 数据量
	private func getItemsCount() -> Int {

		// UIScollView doesn't respond to 'dataSource' so let's exit
		if !self.responds(to: #selector(getter: UITableView.dataSource)) {
			return 0
		}
		
		var items: Int = 0
		
		// UITableView support
		if self.isKind(of: UITableView.self) {
			let tableView: UITableView = self as! UITableView
			if tableView.dataSource == nil {
				return items
			}
			let dataSource: UITableViewDataSource = tableView.dataSource!
			let sections: Int = tableView.numberOfSections
			if dataSource.responds(to: #selector(UITableViewDataSource.tableView(_:numberOfRowsInSection:))) {
				for section in 0..<sections {
					items += dataSource.tableView(tableView, numberOfRowsInSection: section)
				}
			}
		} else if self.isKind(of: UICollectionView.self) {
			let collectionView: UICollectionView = self as! UICollectionView
			if collectionView.dataSource == nil {
				return items
			}
			let dataSource: UICollectionViewDataSource = collectionView.dataSource!
			let sections: Int = collectionView.numberOfSections
			if dataSource.responds(to: #selector(UICollectionViewDataSource.collectionView(_:numberOfItemsInSection:))) {
				for section in 0..<sections {
					items += dataSource.collectionView(collectionView, numberOfItemsInSection: section)
				}
			}
		}
		return items
	}
	
}
