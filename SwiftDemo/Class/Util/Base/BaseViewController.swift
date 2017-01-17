//
//  BaseViewController.swift
//  SwiftDemo
//
//  Created by 思久科技 on 2017/1/16.
//  Copyright © 2017年 思久科技. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // TODO: - 所有继承者都带有下面设置
        
        // MARK: 背景颜色
        self.view.backgroundColor = Color.bg
        // MARK: 导航栏是否半透明
        self.navigationController?.navigationBar.isTranslucent = true
        // MARK: 导航栏背景颜色
        self.navigationController?.navigationBar.barTintColor = Color.nav
        // MARK: 导航栏图标颜色
        self.navigationController?.navigationBar.tintColor = Color.navTitle
        // MARK: 导航栏标题颜色
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName:UIFont.systemFont(ofSize: 20.0),
                                                                        NSForegroundColorAttributeName:Color.navTitle]

        // MARK: 消除ScrollView及其子类的偏移64
        self.automaticallyAdjustsScrollViewInsets = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
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
