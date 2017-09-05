//
//  GTZSignInViweCell.swift
//  GTZSwiftProject
//
//  Created by guangai on 2017/6/13.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit

class GTZSignInViweCell: UITableViewCell {

    @IBOutlet var monthDayLab: UILabel!
    @IBOutlet var wifiName: UILabel!
    @IBOutlet var dataLab: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setCellViewsWith(model:GTZSignInModel) {
        self.monthDayLab.text = model.wifiDate
    }
    
}
