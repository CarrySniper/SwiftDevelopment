//
//  CLPersonalViewController.swift
//  SwiftDemo
//
//  Created by 炬盈科技 on 2017/9/15.
//  Copyright © 2017年 CJQ. All rights reserved.
//

import UIKit

class CLPersonalViewController: CommonViewController, UIImagePickerControllerDelegate {

    @IBOutlet weak var avatar: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "个人信息"
        
        self.initObject()
        self.setProperties()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /// 实例化对象
    private func initObject() {
        
    }
    
    /// 设置属性
    private func setProperties() {
        avatar.layer.cornerRadius = 35.0
        avatar.layer.masksToBounds = true
    }
    
    @IBAction func selectAvatar(_ sender: Any) {
        
        weak var weakSelf = self
        let alertController = UIAlertController(title: "选择图片", message: "需要获取相机或相册使用权限", preferredStyle: UIAlertControllerStyle.actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: {
            (action: UIAlertAction) -> Void in
            /**
             写取消后操作
             */
        })
        
        let cameraAction = UIAlertAction(title: "拍照获取", style: .default, handler: {
            (action: UIAlertAction) -> Void in
            
            weakSelf?.alertAction(action: action)
        })
        let albumAction = UIAlertAction(title: "相册选择", style: .default, handler: {
            (action: UIAlertAction) -> Void in
            
            weakSelf?.alertAction(action: action)
        })
        
        //判断是否支持相机
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            alertController.addAction(cameraAction)
        }
        
        alertController.addAction(albumAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func alertAction(action: UIAlertAction) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        if action.title == "拍照获取" {
            imagePicker.sourceType = .camera
        }else if action.title == "相册选择" {
            imagePicker.sourceType = .photoLibrary
            
        }
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let imagePickerc = info[UIImagePickerControllerOriginalImage] as! UIImage
        avatar.image = imagePickerc
        self.dismiss(animated: true, completion: nil)        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
