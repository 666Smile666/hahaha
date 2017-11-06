
//
//  HomeViewController.swift
//  DYZB
//
//  Created by buyun1 on 2017/11/6.
//  Copyright © 2017年 buyun1. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //设置UI界面
        setupUI();
    }
}

//设置UI界面
extension HomeViewController {
    public func setupUI() {
    
        //1、设置导航栏
        setupNavigationBar();
    }
    
    private func setupNavigationBar() {
        //1.设置左侧的Item
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo");
        
        //2.设置右侧的Item
        let size = CGSize(width: 40, height: 40);

        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size);
        let serchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size);
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size);
    
        navigationItem.rightBarButtonItems = [historyItem,serchItem,qrcodeItem];
    }
    

}
