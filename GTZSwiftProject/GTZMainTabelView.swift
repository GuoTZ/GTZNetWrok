//
//  GTZMainTabelView.swift
//  GTZSwiftProject
//
//  Created by guangai on 2017/6/12.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit
import DGElasticPullToRefresh
protocol GTZMainTabelViewDelegate {
    
    /// 下拉刷新的delegate
    func tabelViewPullToRefreshWithActionHandler();
}


class GTZMainTabelView: UITableView {
    
    var deletarget : GTZMainTabelViewDelegate!
    weak var vm:GTZMainTabelViewModel!
    init(frame: CGRect, style: UITableViewStyle, RefreshLoading:Bool) {
        super.init(frame: frame, style: style)
        self.delegate = vm
        self.dataSource = vm
//        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.separatorColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 231/255.0, alpha: 1.0)
        self.backgroundColor = UIColor(red: 250/255.0, green: 250/255.0, blue: 251/255.0, alpha: 1.0)
        if RefreshLoading{
            let loadingView = DGElasticPullToRefreshLoadingViewCircle()
            loadingView.tintColor = COLOR_NAV_TEXT
            self.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
                self?.deletarget.tabelViewPullToRefreshWithActionHandler()
                }, loadingView: loadingView)
            self.dg_setPullToRefreshFillColor(COLOR_APP_MAIN)
            self.dg_setPullToRefreshBackgroundColor(self.backgroundColor!)
        }
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        self.dg_removePullToRefresh()
    }
    
    /// 结束刷新
    func stopLoading() {
        self.dg_stopLoading()
    }
    
    
}
