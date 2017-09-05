//
//  GTZNetWorkRequest.swift
//  GTZSwiftProject
//  网络请求的基类
//  Created by guangai on 2017/6/16.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit
import Alamofire


/// 网络请求回来的协议方法 -- 协议必须继承NSObjectProtocol
protocol GTZNetWorkRequestDelegate: NSObjectProtocol {
    /// 请求成功的协议方法
    /// GuoTZ
    /// - Parameter date: 请求的数据
    func gtzNetWorkRequestsuccess(date:Data)
    
    /// 请求失败的协议方法
    /// GuoTZ
    /// - Parameter error: 错误
    func gtzNetWorkRequestfailure(error:Error)
}

class GTZNetWorkBaseRequest: NSObject {
    
    /// 
    var sessionManager:SessionManager!
    /// 网络请求的url
    var url: String!
    /// 网络请求的方式 get post
    var method:HTTPMethod!
    /// 网络请求的入参
    var parameters:Dictionary<String, Any>?
    /// 网络请求的头   包括token
    var headers:Dictionary<String, String>?
    /// 是否有网络请求头
    var isHeaders:Bool!
    /// 网络请求成功的回调
    var successBlock:((Data)->Void)?
    /// 网络请求失败的回调
    var failureBlock:((Error)->Void)?
    /// 网络请求的代理
    weak var delegate:GTZNetWorkRequestDelegate?
    var isEnableInterfaceDebug:Bool = true
    /// 初始化网络请求
    ///
    /// - Parameters:
    ///   - url: url
    ///   - method: 请求方式
    ///   - parameters: 入参
    ///   - isHeaders: 是否有请求头
    ///   - successBlock: 成功的回调
    ///   - failureBlock: 请求失败的回调
    ///   - delegate: 代理
    required init(url:String,
         method:HTTPMethod,
         parameters:Dictionary<String, Any>?,
         isHeaders:Bool,
         successBlock:((Data)->Void)?,
         failureBlock:((Error)->Void)?,
         delegate:GTZNetWorkRequestDelegate?) {
        super.init()
        let configuration = URLSessionConfiguration.default
        //设置超时时间
        configuration.timeoutIntervalForRequest = GTZNetworkConfig.shared.GTZ_timeout        
        self.sessionManager = Alamofire.SessionManager(configuration: configuration)
        
        
        
        self.url = GTZNetworkConfig.shared.GTZ_baseUrl! + url
        self.method = method
        self.parameters = parameters
        if isHeaders {
            self.headers = GTZNetworkConfig.shared.GTZ_httpHeaders
        } else {
            self.headers = nil
        }
        self.isEnableInterfaceDebug = GTZNetworkConfig.shared.GTZ_isEnableInterfaceDebug
        self.successBlock = successBlock
        self.failureBlock = failureBlock
        self.delegate = delegate
    }
    
    /// 请求成功的处理方法
    ///
    /// - Parameter data: 请求成功返回的数据
    func requestSuccess(data:Data) {
        
        if isEnableInterfaceDebug {
            GTZLog(message: "网络成功方式：:\(self.method) url：\(self.url) 数据:\(data)")
        }
        /// 如果代理存在
        if let delegate = self.delegate {
            delegate.gtzNetWorkRequestsuccess(date: data)
        }
        /// 如果成功闭包的回调存在
        if let successBlock = self.successBlock {
            successBlock(data)
        }
    }
    
    
    /// 请求成功的处理方法
    ///
    /// - Parameter data: 请求成功返回的数据
    func requestFailure(error:Error) {
        if isEnableInterfaceDebug {
            GTZLog(message: "网络失败方式：:\(self.method) url：\(self.url) 错误:\(error.localizedDescription)")
        }
        /// 如果代理存在
        if let delegate = self.delegate {
            delegate.gtzNetWorkRequestfailure(error: error)
        }
        
        /// 如果成功闭包的回调存在
        if let failureBlock = self.failureBlock {
            failureBlock(error)
        }
    }
    
    /// 开始请求数据
    func startRequest() {
        sessionManager.request(self.url, method: self.method, parameters: self.parameters, encoding:URLEncoding.default, headers: self.headers).responseJSON { (returnResult) in
            switch returnResult.result.isSuccess {
            case true:
                //请求成功的回调
                if let JSON = returnResult.data {
                    self.requestSuccess(data: JSON)
                }
            case false:
                //请求失败的回调
                self.requestFailure(error: returnResult.result.error!)
            }
        }
    }
    
    
    /// 上传图片数据
    ///
    /// - Parameter imageList: 图片数组
    func startUpdataImage(imageList:Array<UIImage>) {
        
        Alamofire.upload(multipartFormData: { (formData) in
            //压缩组合图片
            for i in 0..<imageList.count{
                let imageData = UIImageJPEGRepresentation(imageList[i], 0.5)
                formData.append(imageData!, withName: "anyImage_\(i)", fileName: "anyImage_\(i).jpg", mimeType: "image/jpeg")
            }
            
        }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold, to: self.url, method: .post, headers: self.headers) { (encodingResult) in
            
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON(completionHandler: { (response) in
                    if let myJson = response.result.value {
                        if (myJson as! NSObject) as! Decimal == 0 {
                            print("上传成功")
                        }else {
                            print("上传失败")
                        }
                    }
                })
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    func stop() {
        self.sessionManager = nil
    }
    
    
}
