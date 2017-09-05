//
//  GTZMainTabelViewController.swift
//  GTZSwiftProject
//
//  Created by guangai on 2017/6/12.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit

class GTZMainTabelViewController: GTZBaseViewController{

    var tabelViwe : GTZMainTabelView!
    var tabelViewModel : GTZMainTabelViewModel!
    var RefreshLoading = false
    
    /// 创建控制器的方法
    /// gtz
    /// - Parameters:
    ///   - title: 标题
    ///   - backgroundColor: view背景色
    ///   - RefreshLoading: 是否刷新
    required init(title: String?, backgroundColor: UIColor?,RefreshLoading:Bool) {
        super.init(title: title, backgroundColor: backgroundColor)
        self.RefreshLoading = RefreshLoading
        self.tabelViwe = GTZMainTabelView(frame: self.view.bounds, style: .plain, RefreshLoading:self.RefreshLoading)
        self.tabelViewModel = GTZMainTabelViewModel(target: self, tableView: self.tabelViwe, block: { () in
            
        })
        self.view.addSubview(self.tabelViwe)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(title: String?, backgroundColor: UIColor?) {
        fatalError("init(title:backgroundColor:) has not been implemented")
    }
}
