//
//  GTZKit.swift
//  GTZSwiftProject
//
//  Created by guangai on 2017/6/7.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit

class GTZKit: NSObject {

//    public
    /// 创建输入框
    ///
    /// - Parameters:
    ///   - frame: 位置大小
    ///   - title: 默认文字
    ///   - isSecure: 是否是密码显示
    /// - Returns: 返回输入框
    class func configTextField(frame:CGRect,
                         title:String?,
                         isSecure:Bool? ) -> UITextField {
        
        let textField = UITextField(frame: frame)
        textField.borderStyle = .roundedRect;
        /// 是否有默认文字
        if let title:String = title {
            textField.placeholder = title
        }
        /// 是否是密码显示
        if let isSecure:Bool = isSecure {
            textField.isSecureTextEntry = isSecure
        }
        textField.isSecureTextEntry = false
        textField.font = UIFont.systemFont(ofSize: 14)
        return textField
    }
    
    
    /// 创建btn
    ///
    /// - Parameters:
    ///   - frame: 位置坐标
    ///   - normaltitle: 默认文字
    ///   - selecttitle: 选中文字
    ///   - disabltitle: 禁用文字
    ///   - normalColor: 默认字体颜色
    ///   - selectColor: 选中字体颜色
    ///   - disablColor: 禁用字体颜色
    ///   - font: 文字大小
    /// - Returns: 按钮
    class func configButton(frame:CGRect,
                      normaltitle:String,
                      selecttitle:String?,
                      disabltitle:String?,
                      normalColor:UIColor,
                      selectColor:UIColor?,
                      disablColor:UIColor?,
                      font:CGFloat?,
                      cornerRadius:CGFloat?) -> UIButton {
        
        let btn = UIButton(type: .custom);
        btn.frame = frame
        btn.setTitle(normaltitle, for: .normal)
        /// 如果有选中状态的文字
        if let selecttitle:String = selecttitle {
            btn.setTitle(selecttitle, for: .selected)
        }
        /// 如果有禁用状态的文字
        if let disabltitle:String = disabltitle {
            btn.setTitle(disabltitle, for: .disabled)
        }
        if let font:CGFloat = font {
            btn.titleLabel?.font = UIFont.systemFont(ofSize: font)
        }
        btn.setTitleColor(normalColor, for: .normal)
        /// 如果有选中状态的颜色
        if let selectColor:UIColor = selectColor {
            btn.setTitleColor(selectColor, for: .selected)
        }
        /// 如果有禁用状态的颜色
        if let disablColor:UIColor = disablColor {
            btn.setTitleColor(disablColor, for: .disabled)
        }
        
        //圆角矩形
        if let cornerRadius:CGFloat = cornerRadius {
            btn.layer.masksToBounds = true
            btn.layer.cornerRadius = cornerRadius
            btn.layer.borderColor = UIColor.lightGray.cgColor
            btn.layer.borderWidth = 0.5
        }
        
        return btn
    }
    
}
