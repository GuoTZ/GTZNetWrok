//
//  UIButtonExtension.swift
//  GTZSwiftProject
//
//  Created by guangai on 2017/6/12.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit

extension UIButton {
    func setBackgroundColor(backgroundColor:UIColor, state:UIControlState) {
        self.setImage(UIColor.imageWIthColor(color: backgroundColor), for: state)
    }
}
