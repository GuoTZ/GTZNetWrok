//
//  GTZNetworkCache.swift
//  GTZSwiftProject
//  基于YYCache的缓存
//  按照请求的URL缓存
//  Created by guangai on 2017/6/16.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit
import YYKit

class GTZNetworkCache: NSObject {

    static let NetworkResponseCache = "NetworkResponseCache"
    static var dataCache = YYCache.init(name: GTZNetworkCache.NetworkResponseCache)
    static let downloadDir:String? = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask,true).last
    static var diskCache = YYKVStorage(path: GTZNetworkCache.downloadDir!, type: YYKVStorageType.sqLite)

    /**
     *  根据某个值删除缓存
     *
     *  @param key key
     */
    class func removAllCacheForKey(key:String) {
        GTZNetworkCache.diskCache?.removeItem(forKey: key)
    }
    /**
     *  清除所有数据
     *  GuoTZ
     */
    class func removAllCache() {
        GTZNetworkCache.diskCache?.removeAllItems()
    }
    /**
     存储文件
     GuoTZ
     @param key      缓存数据对应的key值
     @param file     文件
     @param fileName 文件名称
     @return 存储的位置
     */
    class func saveFileWithKey(key:String,file:Data) -> Bool? {
        
        return GTZNetworkCache.diskCache?.saveItem(withKey: key, value: file)
    }
    
    /**
     得到存储的文件
     @param key 存储的key 一般url
     GuoTZ
     @return 返回文件
     */
    class func getFileWithKey(key:String)->YYKVStorageItem? {
        return  GTZNetworkCache.diskCache?.getItemForKey(key)
    }
    /**
     得到文件储存路径
     GuoTZ
     @return 返回路径
     */
    class func getFilePath() -> String? {
        return GTZNetworkCache.diskCache?.path
    }
    
    
}













