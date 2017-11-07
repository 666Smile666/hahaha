//
//  PageTitleView.swift
//  DYZB
//
//  Created by buyun1 on 2017/11/6.
//  Copyright © 2017年 buyun1. All rights reserved.
//

import UIKit

private let kScrollLineH : CGFloat = 2;

class PageTitleView: UIView {

    //定义属性
    fileprivate var titles : [String];
    
    //Mark -- 懒加载属性
    fileprivate lazy var titleLabels : [UILabel] = [UILabel]();
    
    fileprivate lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView();
        scrollView.showsHorizontalScrollIndicator = false;
        scrollView.scrollsToTop = false;//页面内有用到回到顶部的功能，其它需要全部关闭
        scrollView.bounces = false;
        return scrollView;
    }()
    
    fileprivate lazy var scrollLine : UIView = {
        let scrollLine = UIView();
        scrollLine.backgroundColor = UIColor.orange;
        return scrollLine;
    }()
    
    //自定义构造函数
    init(frame : CGRect, titles : [String]) {
        self.titles = titles;
        super.init(frame: frame);
        //设置UI界面
        setupUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension PageTitleView {
    fileprivate func setupUI() {
        //1、添加UIScrollView
        addSubview(scrollView);
        scrollView.frame = bounds;
        
        //2、添加titles对应的label
        setupTitleLabels();
        
        //3、设置底线和滚动的滑块
        setupBottomLineAndScrollLine();
    }
    
    private func setupTitleLabels() {
        //0、确定label的一些frame的值
        let labelW : CGFloat = frame.width / CGFloat(titles.count);
        let labelH : CGFloat = frame.height - kScrollLineH;
        let labelY : CGFloat = 0;
        
        for (index, title) in titles.enumerated() {
            //1、创建label
            let label = UILabel();
            
            //2、设置label的属性
            label.text = title;
            label.tag = index;
            label.font = UIFont.systemFont(ofSize: 16);
            label.textColor = UIColor.darkGray;
            label.textAlignment = .center;
            
            //3、设置label的frame
            let labelX : CGFloat = labelW * CGFloat(index);
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH);
            
            //将label添加到scrollView中
            scrollView.addSubview(label);
            
            titleLabels.append(label);
        }
    }
    
    private func setupBottomLineAndScrollLine() {
        //1、添加底线
        let bottomLine = UIView();
        bottomLine.backgroundColor = UIColor.lightGray;
        let lineH : CGFloat = 0.5;
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH);
        addSubview(bottomLine);
        
        //2、添加scrollLine
        //2.1获取第一个label
        guard let firstLabel = titleLabels.first else {return};
        firstLabel.textColor = UIColor.orange;
        
        scrollView.addSubview(scrollLine);
        scrollLine.frame = CGRect(x: firstLabel.bounds.origin.x, y: frame.height - kScrollLineH, width: firstLabel.bounds.width, height: kScrollLineH);
        
    }
}
