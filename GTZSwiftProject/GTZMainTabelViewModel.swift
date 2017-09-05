//
//  GTZMainTabelViewModel.swift
//  GTZSwiftProject
//
//  Created by guangai on 2017/6/12.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit

class GTZMainTabelViewModel: NSObject,UITableViewDataSource,UITableViewDelegate,GTZMainTabelViewDelegate {
    weak var tableView : GTZMainTabelView!
    weak var target : GTZMainTabelViewController!
    var block:((Void)->Void)!
    init(target:GTZMainTabelViewController,tableView:GTZMainTabelView,block:@escaping (Void)->Void) {
        super.init()
        self.target = target;
        self.block = block
        self.tableView = tableView
        self.tableView.deletarget = self
    }
    
    func tabelViewPullToRefreshWithActionHandler() {
        print("下拉刷新")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cellIdentifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        return cell!
    }

}
