//
//  GTZSignInViewController.swift
//  GTZSwiftProject
//  统计页面 GTZ
//  Created by guangai on 2017/6/9.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit

class GTZSignInViewController: GTZMainTabelViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(WIFIObject.shared.wifiName,WIFIObject.shared.wifiDate)
        
        let api =  GTZNetWorkCacheRequest(url: "http://www.56hyd.xin:8081/api/MemWayBill/GetMemWayBillList", method: .post, parameters: ["PageIndex":"1","PageSize":"3000"], isHeaders: true, successBlock: { (data) in
            GTZLog(message: String.init(data: data, encoding: .utf8))
            GTZProgressHUD.sharedHUD.hudError(msg:"请求服务器成功")
        }, failureBlock: nil, delegate: nil);
        GTZProgressHUD.sharedHUD.hudLoadingMsg(msg: nil)
        api.startRequestForCache(isFromCache: true)
    }
    
    required init(title: String?, backgroundColor: UIColor?, RefreshLoading: Bool) {
        super.init(title: title, backgroundColor: backgroundColor, RefreshLoading: RefreshLoading)
//        self.tabelViwe.backgroundView = UIImageView.init(image: UIImage.init(named: "a2298f3"))
        self.view.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "a2298f3")!)
        self.tabelViwe.frame = CGRect.init(x: 0, y: -64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        self.tabelViewModel = GTZSignInViweModel(target: self, tableView: self.tabelViwe, block: { () in
            
        })
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(title: String?, backgroundColor: UIColor?) {
        fatalError("init(title:backgroundColor:) has not been implemented")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 设置透明
        self.setNavigationControllerTransparent()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //设置不透明
        self.setNavigationControllerNOTransparent()
    }
    
    

}
