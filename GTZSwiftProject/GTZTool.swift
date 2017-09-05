//
//  GTZTool.swift
//  GTZSwiftProject
//  工具类 GTZ
//  Created by guangai on 2017/6/9.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit
import SystemConfiguration
class GTZTool: NSObject {

    
    /// 获取wifi名称
    /// GTZ
    /// - Returns: 是否获取成功
    class func getWifiName() -> (success:Bool,ssid:String,name:String) {
        
        if let cfa:NSArray = CNCopySupportedInterfaces() {
            for x in cfa {
                if let dict = CFBridgingRetain(CNCopyCurrentNetworkInfo(x as! CFString)) {
                    let ssid = dict["SSID"]!
                    let nameStr  = dict["BSSID"]!
                    return (true,ssid as! String,nameStr as! String)
                }
            }
        }
        return (false,"","")
    }
    
    
    
    /// 获取时间
    ///
    /// - Returns: 返回时间
    class func configDate() -> String {
        //获取当前时间
        let now = NSDate()
        
        // 创建一个日期格式器
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        print("当前日期时间：\(dformatter.string(from: now as Date))")
        return dformatter.string(from: now as Date)
        
    }
    
    // 获取日期是星期几
    
    func getDateWeekDay() ->Int {
        let dateFmt         = DateFormatter()
        dateFmt.dateFormat  = "yyyy-MM-dd HH:mm:ss"
        let interval        = Int(dateFmt.string(from: NSDate() as Date))
        let days            = Int(interval!/86400)
        let weekday         = ((days + 4)%7+7)%7
        return weekday
    }
    
    /**
     *  获取这个月第一天是星期几
     */
    func getMontFirstWeekDay() ->Int {
        //1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
        let calendar = NSCalendar.current
        //这里注意 swift要用[,]这样方式写
        var com = calendar.dateComponents([.year,.month,.day], from: NSDate() as Date)
        //设置成第一天
        com.day = 1
        let date = calendar.date(from: com)
        //我们大致可以理解为：某个时间点所在的“小单元”，在“大单元”中的位置  ordinalityOfUnit
        let firstWeekDay = calendar.ordinality(of: .weekday, in: .weekOfMonth, for: date!)
        return firstWeekDay! - 1
    }
    
    
    
    /**
     *  获取当前Day
     */
    func getDay() ->Int {
        let calendar = NSCalendar.current
        //这里注意 swift要用[,]这样方式写
        let com = calendar.dateComponents([.year,.month,.day], from: NSDate() as Date)
        return com.day!
    }
    
    
    
    /**
     *  获取当前Month
     */
    func getMonth() ->Int {
        let calendar = NSCalendar.current
        //这里注意 swift要用[,]这样方式写
        let com = calendar.dateComponents([.year,.month,.day], from: NSDate() as Date)
        return com.month!
    }
}
