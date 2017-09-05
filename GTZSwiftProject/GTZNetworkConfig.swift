//
//  GTZNetworkConfig.swift
//  GTZSwiftProject
//  配置网络请求的单例
//  在appdelegate适配
//
//  Created by guangai on 2017/6/16.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit

class GTZNetworkConfig: NSObject {

    /**
     *  基础URL
     */
    var GTZ_baseUrl : String? = ""
    /**
     *  是否开启接口打印信息
     */
    var GTZ_isEnableInterfaceDebug = true
    /**
     *  设置请求头，默认为空
     */
    var GTZ_httpHeaders : Dictionary<String, String>? = nil
    /**
     *  请求的超时时间
     */
    var GTZ_timeout : TimeInterval = 10.0
    /**
     *  本地缓存的过期时间，默认一分钟
     */
    var GTZ_cacheTime:Int64 = 60
    
    
    private static let sharedConfig = GTZNetworkConfig()
    class var shared:GTZNetworkConfig {
        return sharedConfig
    }
    
}














