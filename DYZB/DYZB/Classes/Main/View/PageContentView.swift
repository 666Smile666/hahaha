//
//  PageContentView.swift
//  DYZB
//
//  Created by buyun1 on 2017/11/7.
//  Copyright © 2017年 buyun1. All rights reserved.
//

import UIKit

private let contentCellID = "contentCellID";

class PageContentView: UIView {

    //Mark -- 定义属性
    fileprivate var childVcs : [UIViewController];
    fileprivate var parentViewController : UIViewController;
    
    //mark -- 懒加载属性
    fileprivate lazy var collectionView : UICollectionView = {
        //1.创建layout
        let layout = UICollectionViewFlowLayout();
        layout.itemSize = self.bounds.size;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = .horizontal;
        
        //2.创建UIcollectView
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout);
        collectionView.showsHorizontalScrollIndicator = false;
        collectionView.isPagingEnabled = true;
        collectionView.bounces = false;
        collectionView.dataSource = self as? UICollectionViewDataSource;
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: contentCellID);
        
        return collectionView;
    }()
    
    //mark -- 自定义构造函数
    init(frame: CGRect, childVcs: [UIViewController], parentViewController: UIViewController) {
        self.childVcs = childVcs;
        self.parentViewController = parentViewController;
        
        super.init(frame: frame);
        
        //设置UI界面
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//设置UI界面
extension PageContentView {
    fileprivate func setupUI() {
        //1.将所有子控制器添加到父控制器中
        for childVC in childVcs {
            parentViewController.addChildViewController(childVC);
        }
        
        //2.添加UICollectionView，用于Cell中存放控制器的view
        addSubview(collectionView);
        collectionView.frame = bounds;
    }
}

//mark -- 遵守UIcollectionViewDataSource
extension PageContentView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count;
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //1.创建cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contentCellID, for: indexPath);
        
        //2.给cell设置内容
        for view in cell.contentView.subviews {
            view.removeFromSuperview();
        }
        
        let childVc = childVcs[indexPath.row];
        childVc.view.frame = cell.contentView.bounds;
        cell.contentView.addSubview(childVc.view);
        
        return cell;
    }
}
