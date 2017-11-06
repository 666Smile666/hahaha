//
//  AppDelegate.swift
//  DYZB
//
//  Created by buyun1 on 2017/11/3.
//  Copyright © 2017年 buyun1. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       
        UITabBar.appearance().tintColor = UIColor.orange;
        
        return true
    }

}

