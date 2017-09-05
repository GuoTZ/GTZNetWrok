//
//  GTZWriteFile.swift
//  GTZSwiftProject
//
//  Created by guangai on 2017/6/9.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit

class GTZWriteFile: NSObject {

    private static let fileName:String = "singin.txt"
    
    /// 获取沙盒路径
    /// GTZ
    /// - Returns: 沙盒路径
    class func documentsPath() -> String {
        let paths:Array<String> = (NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true) as NSArray) as! Array<String>
        return paths[0] as String
    }
    
    /// 获取沙盒路径
    /// GTZ
    /// - Parameter path: 传入的绝对路径
    /// - Returns: 相对沙盒路径
    class func documentsPath(path : String) -> String {
        let paths:Array<String> = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask,true)
        let documentsDirectory:String = paths[0]
        return documentsDirectory + path
    }
    
    
    /// 读取数组
    /// GTZ
    /// - Returns: 数组
    class func readFileArray() -> Array<Dictionary<String,String>> {
        let filePath = GTZWriteFile.documentsPath(path: GTZWriteFile.fileName)
        let arr:NSArray? = NSArray.init(contentsOfFile: filePath)
        if arr != nil {
            return arr  as! Array<Dictionary<String,String>>
        }
        let array:Array<Dictionary<String,String>> = Array()
        
        return array
    }
    
    /// 写数组进缓存
    /// GTZ
    /// - Parameter array: 数组[字典]
    
    class func writeFileArray(array:Array<Dictionary<String,String>>){
        
        let arr:NSArray = array as NSArray
        let filePath = GTZWriteFile.documentsPath(path: GTZWriteFile.fileName)
        arr.write(toFile: filePath, atomically: true)
    }
    
}
