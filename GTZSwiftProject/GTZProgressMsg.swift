//
//  GTZProgressMsg.swift
//  GTZSwiftProject
//
//  Created by guangai on 2017/6/20.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit

enum HUDCategroy {
    case error,success
}

class GTZProgressMsg: UIView {

    var loadLabelFont:CGFloat = 14.0
    var loadViewW:CGFloat = 2/3*SCREEN_WIDTH
    let bgColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
    
    /// 加载动画imageViwe
    lazy var loadImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        return imageView
    }()
    
    /// 加载view
    lazy var loadViwe:UIView = {
        let view = UIView()
        view.backgroundColor = self.bgColor
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 4
        return view
    }()
    
    /// 加载提示语
    lazy var loadLabel:UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor.white
        lab.font = UIFont.systemFont(ofSize: self.loadLabelFont)
        lab.textColor = UIColor.white
        lab.textAlignment = .center
        lab.numberOfLines = 1
        return lab
    }()

    init() {
        super.init(frame: CGRect.zero)
        self.frame = UIScreen.main.bounds
    }
    
    
    func hudErrorMsg(msg:String,categroy:HUDCategroy) {
        UIApplication.shared.keyWindow?.addSubview(self)
        self.addSubview(loadViwe)
        switch categroy {
        case .error:
            self.loadImageView.image = UIImage(named: "errorHUD")
            break
        case .success:
            self.loadImageView.image = UIImage(named: "successHUD")
            break
        }
        let labW = self.loadLabel.getLabWidth(labelStr: msg, font: UIFont.systemFont(ofSize: self.loadLabelFont), height: 40)
        var subViewWidht = labW + self.loadImageView.WIDTH
        if subViewWidht > (loadViewW-CGFloat(45)) {
            subViewWidht = loadViewW-CGFloat(45)
            self.loadLabel.numberOfLines = 2
        }
        self.loadLabel.text = msg
        self.loadImageView.frame = CGRect(x: (loadViewW-subViewWidht)/2, y: 10, width: 30, height: 30)
        self.loadLabel.frame = CGRect(x: self.loadImageView.FrameX+self.loadImageView.WIDTH+15, y: 0, width: subViewWidht-45, height: 50)
        //添加imageView与label
        self.loadViwe.addSubview(self.loadLabel)
        self.loadViwe.addSubview(self.loadImageView)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
            self.removeAllSubviews()
            self.removeFromSuperview()
        })
    }
    
    deinit {
        GTZLog(message: "移除视图")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
