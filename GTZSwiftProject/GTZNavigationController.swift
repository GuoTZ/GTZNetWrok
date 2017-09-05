//
//  GTZNavigationController.swift
//  GTZSwiftProject
//
//  Created by guangai on 2017/6/7.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit

class GTZNavigationController: UINavigationController,UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactivePopGestureRecognizer?.delegate = self;
        //设置导航栏背景颜色
        self.navigationBar.barTintColor = COLOR_APP_MAIN
        
        let dict:NSDictionary = [NSForegroundColorAttributeName: COLOR_NAV_TEXT,NSFontAttributeName : UIFont.boldSystemFont(ofSize: 18)]
        //标题颜色
        self.navigationController?.navigationBar.titleTextAttributes = dict as? [String : AnyObject]
    }

    
    
    
    /// push到下一页
    /// 如果是push过去的则显示返回按钮
    /// - Parameters:
    ///   - viewController: 控制器
    ///   - animated: 回调
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if (self.childViewControllers.count > 0) {
            let backButton = UIButton.init();
            backButton.setTitleColor(UIColor.black, for: .normal);
            backButton.setTitleColor(UIColor.red, for: .normal);
            backButton.setImage(UIImage(named:"返回"), for: .normal)
            backButton.sizeToFit();
            backButton.addTarget(self, action: #selector(GTZNavigationController.back), for: .touchUpInside);
            
            backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton);
            viewController.hidesBottomBarWhenPushed = true;
            
        }
        
        super.pushViewController(viewController, animated: animated);
    }
    
    
    /// 点击返回手势
    public func back() {
        self.popViewController(animated: true);
    }
    
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        //档子控制器个数大于1是,手势有效
        return self.childViewControllers.count > 1;
    }
}
