//
//  ViewController.swift
//  GTZSwiftProject
//
//  Created by guangai on 2017/6/7.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit
import SnapKit
import ReactiveCocoa
import YYKit
//import 

class GTZMianViewController: GTZBaseViewController {

    
    /// 懒加载确认按钮
    lazy var okBtn:UIButton = {
        return GTZKit.configButton(frame: CGRect.zero, normaltitle: "确认", selecttitle: nil, disabltitle: nil, normalColor: UIColor.black, selectColor: nil, disablColor: nil, font: 15, cornerRadius: 4)
    }()
    
    
    lazy var phoneText:UITextField = {
        return GTZKit.configTextField(frame: CGRect.zero, title: "输入手机号", isSecure: false)
    }()
    
    lazy var pwdText:UITextField = {
        return GTZKit.configTextField(frame: CGRect.zero, title: "输入密码", isSecure: false)
    }()
    
    lazy var navigationBtn: UIButton = {
        return GTZKit.configButton(frame: CGRect.init(x: 0, y: 0, width: 60, height: 40), normaltitle: "日历", selecttitle: nil, disabltitle: nil, normalColor: COLOR_NAV_TEXT, selectColor: nil, disablColor: nil, font: 14, cornerRadius: nil)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "你好Swift"
        self.view.backgroundColor = UIColor.white
        
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: navigationBtn);
        navigationBtn.addTarget(self, action: #selector(GTZMianViewController.navBtnAction), for: .touchUpInside);
        
        self.view.addSubview(phoneText)
        phoneText.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.left.equalTo(50)
            make.width.equalTo(SCREEN_WIDTH-100)
            make.height.equalTo(30)
        }
        
        self.view.addSubview(pwdText)
        pwdText.snp.makeConstraints { (make) in
            make.top.equalTo(phoneText.snp.bottom).offset(10)
            make.left.equalTo(50)
            make.width.equalTo(SCREEN_WIDTH-100)
            make.height.equalTo(30)
        }
        
        self.view.addSubview(okBtn)
        okBtn.setBackgroundColor(backgroundColor: COLOR_APP_MAIN, state: .normal)
        okBtn.snp.makeConstraints { (make) in
            make.top.equalTo(pwdText.snp.bottom).offset(10)
            make.left.equalTo(50)
            make.width.equalTo(SCREEN_WIDTH-100)
            make.height.equalTo(30)
        }
        
        let dmodel = DeliveryListConditionModel()
        dmodel.PageSize = 20
        dmodel.PageIndex = 1
        dmodel.type = "Z"
        GTZLoadView.sharedView.setLoadState(state: .loading)
        dmodel.startDeliveryListCondition { (data) in
            GTZLoadView.sharedView.setLoadState(state: .failed)
        }
        
        
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
//            GTZLoadView.sharedView.setLoadState(state: .failed)
        })
    }
    
    
    /// 点击导航栏右侧按钮的点击方法
    func navBtnAction() {
        self.pushNextVC(vc: GTZSignInViewController(title: "统计", backgroundColor: nil, RefreshLoading: false))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.wifiChangeValue()
    }
    
    func wifiChangeValue() {
        let wifi:(success:Bool,ssid:String,name:String) = GTZTool.getWifiName()
        if wifi.success {
//            let wifiObj:GTZSignInModel =  GTZSignInModel()
//            wifiObj.wifiName = wifi.ssid
//            wifiObj.wifiDate = GTZTool.configDate()
//            
//            /// 拆分时间
//            let data:NSString = wifiObj.wifiDate as NSString;
//            let array = data.components(separatedBy: " ");
//            wifiObj.wifiMonthDay = array.first!
//            wifiObj.wifiDate = array.last!
//            /// 读取缓存
//            var arr = GTZWriteFile.readFileArray()
//            let dict:Dictionary<String,String> = ["wifiMonthDay":array.first!,"wifiDate":array.last!,"wifiName":wifiObj.wifiName]
//            arr.append(dict)
//            GTZWriteFile.writeFileArray(array: arr)
        }
    }
    
    
}

