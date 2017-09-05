//
//  GTZBaseViewController.swift
//  GTZSwiftProject
//
//  Created by guangai on 2017/6/9.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit

class GTZBaseViewController: UIViewController {

    
    /// 创建控制器
    ///
    /// - Parameters:
    ///   - title: 控制器标题
    ///   - backgroundColor: 控制器背景色
    required init(title:String?,backgroundColor:UIColor?) {
        super.init(nibName: nil, bundle: nil)
//        navigationController?.navigationBar.isTranslucent = false
        if let backgroundColor:UIColor = backgroundColor {
            self.view.backgroundColor = backgroundColor
        } else {
            self.view.backgroundColor = UIColor.white
        }
        
        if let title:String =  title {
            self.navigationItem.title = title
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    /// psuh到下一个控制器
    ///
    /// - Parameter vc: 被推出的控制器
    func pushNextVC(vc:UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //点击View的手势方法
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        //View结束编辑
        self.view.endEditing(false)
    }
    
    
    /// 设置导航栏的透明度，一般写在页面将要显示的时候
    func setNavigationControllerTransparent () {
        //设置导航栏背景图片为一个空的image，这样就透明了
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //去掉透明后导航栏下边的黑边
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    
    /// 设置导航栏的不是透明的，一般写在页面将要消失的时候
    func setNavigationControllerNOTransparent () {
        //设置导航栏背景图片为一个空的image，这样就透明了
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        //去掉透明后导航栏下边的黑边
        self.navigationController?.navigationBar.shadowImage = nil
    }
    

}
