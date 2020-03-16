//
//  CLImagePicker.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/16.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit

class CLImagePicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	typealias CLImageHandler = (_ image: UIImage) -> Void
	var limitMaxSize: NSInteger = 0
	
	var imagePickerHandler: CLImageHandler!
	
	/// 懒加载
	lazy var imagePickerController: UIImagePickerController = {
		let imagePicker = UIImagePickerController()
		imagePicker.delegate = self
		return imagePicker
	}()
	
	/// 单例
	class func sharedInstance() -> CLImagePicker {
		struct Single {
			static let instance: CLImagePicker = CLImagePicker()
		}
		_ = Single.instance.setup_oncesAction
		return Single.instance
	}
	
	/// 懒加载-只执行一次的代码
	lazy var setup_oncesAction: Void = {
		// 写下想要执行一次的代码
	
		
	}()
	
	/// 显示选择图片视图控制器
	/// - Parameters:
	///   - allowsEditing: 是否允许编辑
	///   - limitMaxSize: 限制最大大小
	///   - sourceType: 资源类型
	///   - imagePickerHandler: 回调
	public func show(_ allowsEditing: Bool, _ limitMaxSize: NSInteger,_ sourceType: UIImagePickerController.SourceType, _ imagePickerHandler: CLImageHandler?) {
		
		if (sourceType == .camera) {
			//  判断是否支持相机。注：模拟器没有相机
			if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) == false {
				print("不支持相机拍摄")
				return()
			}
		}
		self.limitMaxSize = limitMaxSize
		self.imagePickerHandler = imagePickerHandler
		
		self.imagePickerController.allowsEditing = allowsEditing
		self.imagePickerController.sourceType = sourceType
		getCurrentViewController()!.present(self.imagePickerController, animated: true, completion: nil)
	}

	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		var selectImage: UIImage!
		if picker.allowsEditing == true {
			selectImage = (info[UIImagePickerController.InfoKey.editedImage] as! UIImage)
		} else {
			selectImage = (info[UIImagePickerController.InfoKey.originalImage] as! UIImage)
		}
		
		if self.limitMaxSize >= 0 {
			let limitSize = self.scaleImage(image: selectImage, imageLength: CGFloat(self.limitMaxSize))
			selectImage = self.resizeImage(image: selectImage, newSize: limitSize)
		}
		
		if self.imagePickerHandler != nil {
			self.imagePickerHandler(selectImage)
		}
		picker.dismiss(animated: true, completion: nil)
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		picker.dismiss(animated: true, completion: nil)
	}
	
	///swift版本
	/// iOS11 解决图片编辑时左下角cancel按钮很难点击的问题
	func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
		if Double(UIDevice.current.systemVersion)! < 11.0 {
			return
		}
		if viewController.isKind(of: NSClassFromString("PUPhotoPickerHostViewController")!) {
			for item in viewController.view.subviews {
				if item.frame.size.width < 42 {
					viewController.view.sendSubviewToBack(item)
					return
				}
			}
		}
	}
	
	
	func resizeImage(image: UIImage, newSize: CGSize) -> UIImage {
		UIGraphicsBeginImageContext(newSize)
		image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
		
		let newImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		
		return newImage!
	}
	func scaleImage(image: UIImage, imageLength: CGFloat) -> CGSize {
		var newWidth:CGFloat = 0.0
		var newHeight:CGFloat = 0.0
		let width = image.size.width
		let height = image.size.height
		if (width > imageLength || height > imageLength){
			if (width > height) {
				newWidth = imageLength;
				newHeight = newWidth * height / width;
			}else if(height > width){
				newHeight = imageLength;
				newWidth = newHeight * width / height;
			}else{
				newWidth = imageLength;
				newHeight = imageLength;
			}
		}
		return CGSize(width: newWidth, height: newHeight)
	}
}
