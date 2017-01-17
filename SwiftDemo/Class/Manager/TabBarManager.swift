//
//  TabBarManager.swift
//  SwiftDemo
//
//  Created by 思久科技 on 2017/1/13.
//  Copyright © 2017年 思久科技. All rights reserved.
//

import UIKit


class TabBarManager: UITabBarController {

    
    /// 自定义UITabBar
    ///
    /// - Parameter selectedIndex: 选中下标 从0开始
    func customTabbar(selectedIndex:NSInteger) {
        
        // MARK: 视图控制器
        let vc0 = HomeVC()
        let vc1 = ListVC()
        let vc2 = MeVC()
        
        // MARK: 标题
        vc0.title = "首页"
        vc1.title = "列表"
        vc2.title = "我的"
        
        // MARK: tabbar图标
        vc0.tabBarItem.image = UIImage(named: "tabbar_normal0")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        vc0.tabBarItem.selectedImage = UIImage(named: "tabbar_selected0")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        vc1.tabBarItem.image = UIImage(named: "tabbar_normal1")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        vc1.tabBarItem.selectedImage = UIImage(named: "tabbar_selected1")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        vc2.tabBarItem.image = UIImage(named: "tabbar_normal2")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        vc2.tabBarItem.selectedImage = UIImage(named: "tabbar_selected2")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        // MARK: 导航控制器
        let navCtr0 = UINavigationController.init(rootViewController: vc0)
        let navCtr1 = UINavigationController.init(rootViewController: vc1)
        let navCtr2 = UINavigationController.init(rootViewController: vc2)
        
        // MARK: UITabBarController所有
        let vcArray = [navCtr0, navCtr1, navCtr2]
        self.setViewControllers(vcArray, animated: true)
        
        // MARK: 选中下标
        self.selectedIndex = selectedIndex
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // tabBar是否半透明
        self.tabBar.isTranslucent = true
        
        // tabBar背景颜色
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
