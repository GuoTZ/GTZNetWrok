//
//  ConstantMacro.swift
//  GTZSwiftProject
//
//  Created by guangai on 2017/6/12.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit

/// 设备宽度
let SCREEN_WIDTH  = UIScreen.main.bounds.width

/// 设备高度
let SCREEN_HEIGHT = UIScreen.main.bounds.height

/// app主色调
let COLOR_APP_MAIN = UIColor.white

/// app导航栏文字
let COLOR_NAV_TEXT = UIColor(red: 78/255.0, green: 221/255.0, blue: 200/255.0, alpha: 1.0)

/// APP的代理
let app_delegate = UIApplication.shared.delegate as! AppDelegate

/// 依次打印 类_方法_行_数据
///
/// - Parameters:
///   - message: 要打印的数据
///   - fileName: 文件所在路径
///   - methodName: 方法名
///   - linNumber: 所在行
func GTZLog<T>(message:T,fileName:String=#file,methodName: String=#function,linNumber:Int=#line) {
    
    #if DEBUG
        let logStr:String = (fileName as NSString).pathComponents.last!.replacingOccurrences(of: "swift", with: "")
        print("类:\(logStr),方法:\(methodName),行:\(linNumber)数据:\(message)")
    #endif
}











