//
//  GTZNetWorkCacheRequest.swift
//  GTZSwiftProject
//  网络缓存类
//  Created by guangai on 2017/6/17.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit
import Alamofire

struct  GTZData{
    ///< key
    public var key: String?
    ///< 数据值
    public var value: Data?
    ///< 文件名称
    public var filename: String?
    ///< 文件大小
    public var size: Int32?
    ///< 修改时间
    public var modTime: Int32?
    ///< 最后一次访问时间
    public var accessTime: Int32?
    ///< 附加数据
    public var extendedData: Data?
    
}

class GTZNetWorkCacheRequest: GTZNetWorkBaseRequest {
    
    
    
    /// 开始网络请求数据
    ///
    /// - Parameter isFromCache: 是否从本地读取缓存
    func startRequestForCache(isFromCache:Bool) {
        //不允许从本地读取数据
        if !isFromCache {
            self.startRequest()
            return
        }
        //允许从本地读取数据
        if let data:GTZData = self.getResponseDataForCache() {
            ///如果本地存在缓存
            if self.configTimeDifference(date: data.modTime) {
                //如果过期
                self.startRequest()
            } else {
                //如果没有过期
                self.requestSuccess(data:data.value!)
            }
        } else {
            //如果本地没有缓冲
            self.startRequest()
        }
    }
    
    
    /// 重写网络请求的方法
    override func startRequest() {
        sessionManager.request(self.url, method: self.method, parameters: self.parameters, encoding:URLEncoding.default, headers: self.headers).responseJSON { (returnResult) in
            switch returnResult.result.isSuccess {
            case true:
                //请求成功的回调
                if let JSON = returnResult.data {
                    ///回调
                    self.requestSuccess(data: JSON )
                    ///缓存数据
                    self.saveResponseDataForCache(data: JSON)
                }
            case false:
                //请求失败的回调
                self.requestFailure(error: returnResult.result.error!)
            }
        }
    }
    
    /// 从本地读取数据
    ///
    /// - Returns: 数据
    func getResponseDataForCache() -> GTZData? {
        
        let itmeData = GTZNetworkCache.getFileWithKey(key: self.url)
        if (itmeData == nil){
            return nil
        }
        
        let gtzdata = GTZData(key: itmeData?.key, value: itmeData?.value, filename: itmeData?.filename, size: itmeData?.size, modTime: itmeData?.modTime, accessTime: itmeData?.accessTime, extendedData: itmeData?.extendedData)
        
        if self.isEnableInterfaceDebug {
            GTZLog(message: "从本地读取数据：path:\(String(describing: GTZNetworkCache.getFilePath()))key：\(self.url),data:\(String(describing: gtzdata.value))")
        }
        return gtzdata
    }
    
    /// 缓存数据
    ///
    /// - Parameter data: 网络数据
    func saveResponseDataForCache(data:Data) {
        if let isSave = GTZNetworkCache.saveFileWithKey(key: self.url, file: data) {
            if isSave {
                if self.isEnableInterfaceDebug {
                    GTZLog(message: "数据保存到本地：key：\(self.url),data:\(String(describing: data))")
                }
            }
        }
    }
    
    
    /// 计算两个时间差
    ///
    /// - Parameter date: 保存文件的时间
    /// - Returns: 返回是否过期，TRUE为过期 false没有过期
    func configTimeDifference(date:Int32?)->Bool {
        if let date:Int32 = date {
            //将保存的时间戳转化成时间
            let timeInterval:TimeInterval = TimeInterval(date)
            let modDate = Date(timeIntervalSince1970: timeInterval)
            //获取现在时间
            let newDate = Date()
            //计算两个时间差、单位毫秒
            let time:TimeInterval = newDate.timeIntervalSince(modDate)
            //如果时间差大于设置的缓存时间则表示过期
            if Int64(time) > GTZNetworkConfig.shared.GTZ_cacheTime {
                return true
            }
            return false
        }
        return true
    }
    
}
