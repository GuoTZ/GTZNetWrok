//
//  DeliveryListConditionModel.swift
//  GTZSwiftProject
//
//  Created by guangai on 2017/6/17.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit

class DeliveryListConditionModel: NSObject {
    var AddressStartLayer:Int   = 0//装货地址层 1 省 2 市 3 区县 integer
    var AddressStartID:String   = ""//装货地址ID string
    var AddressEndLayer:Int     = 0//卸货地址层 1 省 2 市 3 区县 integer
    var AddressEndID:String     = ""//卸货地址ID string
    var NeedVehicleLength:Double = 0//需车长度 decimal number
    var type:String             = ""//订车类型:Z整车P拼车A可拼整 string
    var PageIndex:Int           = 0//当前页码 integer
    var PageSize:Int            = 0
    
    
    func startDeliveryListCondition(block:((Data)->Void)?) {
        
        let str = self.modelToJSONString()
        let jsonData = str?.data(using: .utf8)
        var dict = Dictionary<String, Any>()
        do {
            let data =  try! JSONSerialization.jsonObject(with: jsonData!, options: .mutableContainers)
            if data is Dictionary<String, Any>{
                dict = data as! Dictionary<String, Any>
            }
        }
        
        let api = GTZNetWorkPostRequest.init(Headersurl: "http://www.56hyd.xin:8081/api/MemDelivery/GetMemDeliveryList", parameters: dict, successBlock: { (data) in
            block!(data)
        }) { (error) in
            
        }
        api.startRequest()
    }
    
}
