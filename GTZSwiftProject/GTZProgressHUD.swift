//
//  GTZProgressHUD.swift
//  GTZSwiftProject
//
//  Created by guangai on 2017/6/19.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit

class GTZProgressHUD: UIView {
    private var loadingViwe : GTZProgressLoading?
    private var hudViwe : GTZProgressMsg!
    private static let shared = GTZProgressHUD()
    class var sharedHUD:GTZProgressHUD {
        return shared
    }

    private init() {
        super.init(frame:UIScreen.main.bounds)
        self.frame = UIScreen.main.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    
    /// 开始加载提示---msg
    func hudLoadingMsg(msg:String?) {
        self.loadingViwe = GTZProgressLoading()
        self.loadingViwe?.hudLoadingMsg(msg: msg)
    }
    
    /// 停止动画并移除视图
    func stopRotationAnim() {
        if self.loadingViwe != nil {
            self.loadingViwe?.stopRotationAnim()
        }
    }
    
    func hudError(msg:String) {
        stopRotationAnim()
        self.hudViwe = GTZProgressMsg()
        hudViwe.hudErrorMsg(msg: msg, categroy: .error)
    }
    func hudSuccess(msg:String) {
        stopRotationAnim()
        self.hudViwe = GTZProgressMsg()
        hudViwe.hudErrorMsg(msg: msg, categroy: .success)
    }
}
