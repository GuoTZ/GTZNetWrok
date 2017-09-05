//
//  GTZNetWorkPostRequest.swift
//  GTZSwiftProject
//  post请求
//  Created by guangai on 2017/6/17.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit
import Alamofire

class GTZNetWorkPostRequest: GTZNetWorkBaseRequest {

    /// post请求,无请求头,使用闭包传值
    ///
    /// - Parameters:
    ///   - url: url
    ///   - parameters: 入参数
    ///   - successBlock: 成功回调
    ///   - failureBlock: 失败回调
    init(url:String,parameters: Dictionary<String, Any>?,successBlock: @escaping ((Data) -> Void), failureBlock: @escaping ((Error) -> Void)) {
        super.init(url: url, method: .post, parameters: parameters, isHeaders: false, successBlock: successBlock, failureBlock: failureBlock, delegate: nil)
    }
    /// post请求,无请求头,使用代理传值
    ///
    /// - Parameters:
    ///   - url: url
    ///   - parameters: 入参数
    ///   - delegate: 代理协议
    init(url:String,parameters: Dictionary<String, Any>?,delegate:GTZNetWorkRequestDelegate) {
        super.init(url: url, method: .get, parameters: parameters, isHeaders: false, successBlock: nil, failureBlock: nil, delegate: delegate)
    }
    
    
    
    /// post请求,有请求头,使用闭包传值
    ///
    /// - Parameters:
    ///   - url: url
    ///   - parameters: 入参数
    ///   - successBlock: 成功回调
    ///   - failureBlock: 失败回调
    init(Headersurl:String,parameters: Dictionary<String, Any>?,successBlock: @escaping ((Data) -> Void), failureBlock: @escaping ((Error) -> Void)) {
        super.init(url: Headersurl, method: .post, parameters: parameters, isHeaders: true, successBlock: successBlock, failureBlock: failureBlock, delegate: nil)
    }
    /// post请求,有请求头,使用代理传值
    ///
    /// - Parameters:
    ///   - url: url
    ///   - parameters: 入参数
    ///   - delegate: 代理协议
    init(Headersurl:String,parameters: Dictionary<String, Any>?,delegate:GTZNetWorkRequestDelegate) {
        super.init(url: Headersurl, method: .post, parameters: parameters, isHeaders: true, successBlock: nil, failureBlock: nil, delegate: delegate)
    }
    
    required init(url: String, method: HTTPMethod, parameters: Dictionary<String, Any>?, isHeaders: Bool, successBlock: ((Data) -> Void)?, failureBlock: ((Error) -> Void)?, delegate: GTZNetWorkRequestDelegate?) {
        fatalError("init(url:method:parameters:isHeaders:successBlock:failureBlock:delegate:) has not been implemented")
    }
    

    

    
}
