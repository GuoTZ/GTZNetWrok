//
//  GTZSignInViweModel.swift
//  GTZSwiftProject
//
//  Created by guangai on 2017/6/12.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit
import YYKit
class GTZSignInViweModel: GTZMainTabelViewModel {

    var arr:Array<Dictionary<String,String>>!
    var tableArray = Array<GTZSignInModel>()
    
    override init(target: GTZMainTabelViewController, tableView: GTZMainTabelView, block: @escaping (Void) -> Void) {
        super.init(target: target, tableView: tableView, block: block)
        self.tableView.register(UINib.init(nibName: GTZSignInViweCell.className(), bundle: nil), forCellReuseIdentifier: "cellId")
        self.readDataWithFile()
    }
    
    func readDataWithFile() {
        DispatchQueue.global().async {
            // code
//            let arr = GTZWriteFile.readFileArray()
//            for dict:Dictionary<String,String> in arr {
//                let model:GTZSignInModel = GTZSignInModel()
//                model.wifiDate = dict["wifiDate"]!
//                model.wifiMonthDay = dict["wifiMonthDay"]!
//                model.wifiName = dict["wifiName"]!
//                self.tableArray.append(model)
//            }
            DispatchQueue.main.async {
                // 主线程中
                self.tableView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:GTZSignInViweCell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! GTZSignInViweCell
        cell.setCellViewsWith(model: self.tableArray[indexPath.row])
        return cell
    }
    
}
