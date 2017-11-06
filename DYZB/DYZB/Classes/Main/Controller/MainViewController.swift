//
//  MainViewController.swift
//  DYZB
//
//  Created by buyun1 on 2017/11/6.
//  Copyright © 2017年 buyun1. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildVC(storyName: "Home");
        addChildVC(storyName: "Live");
        addChildVC(storyName: "Follow");
        addChildVC(storyName: "Profile");
    }
    
    private func addChildVC(storyName:String) {
        //1、通过storyboard获取控制器
        let childVC = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!;
        
        //2、将childVC作为子控制器
        addChildViewController(childVC);
    }

}
