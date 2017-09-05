//
//  UILabelExtension.swift
//  GTZSwiftProject
//
//  Created by guangai on 2017/6/19.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit

extension UILabel {
    
    func getLabHeigh() -> CGFloat {
        let statusLabelText: NSString = self.text! as NSString
        let size = CGSize(width:self.WIDTH,height:900)
        let dic:Dictionary<String,UIFont> = [NSFontAttributeName:self.font]
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic, context: nil).size
        return strSize.height
    }
    
    
    
    func getLabWidth(labelStr:String,font:UIFont,height:CGFloat) -> CGFloat {
        
        let statusLabelText: NSString = labelStr as NSString
        
        let size = CGSize(width:900,height:height)
        
        let dic = [NSFontAttributeName:font]
        
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic , context: nil).size
        return strSize.width
        
    }
    

    
}
