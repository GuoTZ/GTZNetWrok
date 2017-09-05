//
//  WIFIObject.swift
//  GTZSwiftProject
//  WIFI 的单例
//  Created by guangai on 2017/6/9.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit

class WIFIObject: NSObject {

    open var wifiName:String = ""
    
    open var wifiID:String = ""
    
    open var wifiDate:String = ""
    
    
    
    
    private static let sharedInstance = WIFIObject()
    class var shared:WIFIObject {
        return sharedInstance
    }
    
}
