//
//  CustomTabBarController.swift
//  CustomUI_01
//
//  Created by QuetzalAndOrca on 03/05/2019.
//  Copyright © 2019 Kim_Sung-jin. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    let customView = UIView()
    let tabItem01 = UIButton(type: .system)
    let tabItem02 = UIButton(type: .system)
    let tabItem03 = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.isHidden = true
        self.onTabBarItemClick(self.tabItem01)
        
        setTabBarView()

    }
    

    func setTabBarView(){
        
        //Tab Bar Setting
        let width = self.view.frame.width
        let height: CGFloat = 50
        let x: CGFloat = 0
        let y = self.view.frame.height - height
        self.customView.frame = CGRect(x: x, y: y, width: width, height:  height)
        self.customView.backgroundColor = UIColor.brown
        self.view.addSubview(self.customView)
        
        //Tab Bar Button Setiing
        let tabButttonWidth = self.customView.frame.size.width / 3
        let tabButtonHeight = self.customView.frame.size.height
        
        self.tabItem01.frame = CGRect(x: 0, y: 0, width: tabButttonWidth, height: tabButtonHeight)
        self.tabItem02.frame = CGRect(x: tabButttonWidth, y: 0, width: tabButttonWidth, height: tabButtonHeight)
        self.tabItem03.frame = CGRect(x: tabButttonWidth * 2, y: 0, width: tabButttonWidth, height: tabButtonHeight)
        
        self.addTabbarButton(button: tabItem01, title: "First Tab Item", tag: 0)
        self.addTabbarButton(button: tabItem02, title: "Second Tab Item", tag: 1)
        self.addTabbarButton(button: tabItem03, title: "Third Tab Item", tag: 2)
        
    }
    
    func addTabbarButton(button: UIButton, title: String, tag: Int) {
        button.setTitle(title, for: .normal)
        button.tag = tag
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.yellow, for: .selected)
        button.tintColor = UIColor.brown
        button.addTarget(self, action: #selector(onTabBarItemClick(_:)), for: .touchUpInside)
        self.customView.addSubview(button)
    }
    
    @objc func onTabBarItemClick(_ sender: UIButton) {
        self.tabItem01.isSelected = false
        self.tabItem02.isSelected = false
        self.tabItem03.isSelected = false
        sender.isSelected = true
        
        self.selectedIndex = sender.tag // 탭 전환 기능
    }
    
}
