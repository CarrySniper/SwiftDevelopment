//
//  TabBarManager.swift
//  SwiftDemo
//
//  Created by 思久科技 on 2017/1/13.
//  Copyright © 2017年 思久科技. All rights reserved.
//

import UIKit


class TabBarManager: UITabBarController {

    
    func user(index:NSInteger) {
        
        let vc = ViewController()
        let vc1 = ViewController1()
        let vc2 = MeVC()
        
        vc.title = "首页"
        vc1.title = "订单"
        vc2.title = "我的"
        
        vc.tabBarItem.image = UIImage(named: "tabbar_normal0")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_selected0")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        vc1.tabBarItem.image = UIImage(named: "tabbar_normal1")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        vc1.tabBarItem.selectedImage = UIImage(named: "tabbar_selected1")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        vc2.tabBarItem.image = UIImage(named: "tabbar_normal2")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        vc2.tabBarItem.selectedImage = UIImage(named: "tabbar_selected2")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        let navCtr = UINavigationController.init(rootViewController: vc)
        let navCtr1 = UINavigationController.init(rootViewController: vc1)
        let navCtr2 = UINavigationController.init(rootViewController: vc2)
        
        let vcArray = [navCtr, navCtr1, navCtr2]
        
        self.setViewControllers(vcArray, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // tabBar背景颜色
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = Color.tabber;
        
        // UITabBarItem字体和颜色
        let attributesNormal =  [NSFontAttributeName:UIFont.systemFont(ofSize: 10),
                           NSForegroundColorAttributeName:Color.textNormal]
        let attributesSelected =  [NSFontAttributeName:UIFont.systemFont(ofSize: 10),
                           NSForegroundColorAttributeName:Color.textSelect]
        
        UITabBarItem.appearance().setTitleTextAttributes(attributesNormal, for: UIControlState.normal)
        
        UITabBarItem.appearance().setTitleTextAttributes(attributesSelected, for: UIControlState.selected)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
