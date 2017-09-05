//
//  GTZProgressLoading.swift
//  GTZSwiftProject
//
//  Created by guangai on 2017/6/20.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit

class GTZProgressLoading: UIView {

    var loadLabelFont:CGFloat = 14.0
    var angle = 0.0
    var loadViewW:CGFloat = 100
    let stopBtnW:CGFloat = 25
    let bgColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
    
    /// 加载动画imageViwe
    lazy var loadImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named:"loading"))
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
        lab.numberOfLines = 2
        return lab
    }()

    
    init() {
        super.init(frame: CGRect.zero)
        self.frame = UIScreen.main.bounds
    }
    
    /// 开始加载提示---msg
    func hudLoadingMsg(msg:String?) {
        self.loadImageView.center = CGPoint(x: loadViewW/2, y: loadViewW/2)
        self.loadViwe.addSubview(loadImageView)
        
        if let msg:String = msg {
            self.loadViewW = 120;
            self.loadImageView.center = CGPoint(x: loadViewW/2, y: loadViewW/2-18)
            loadLabel.text = msg
            loadLabel.frame = CGRect(x: 4, y: 84, width: 112, height: 36)
            self.loadViwe.addSubview(loadLabel)
        }
        loadViwe.center = CGPoint(x: SCREEN_WIDTH/2 - loadViewW/2, y: SCREEN_HEIGHT/2 - loadViewW/2)
        loadViwe.frame.size = CGSize(width: loadViewW, height: loadViewW)
        self.addSubview(loadViwe)
        UIApplication.shared.keyWindow?.addSubview(self)
        self.addRotationAnim()
    }
    
    /// 添加动画
    func addRotationAnim() {
        // 1.创建动画
        let rotationAnim = CABasicAnimation(keyPath: "transform.rotation.z")
        // 2.设置动画的属性
        rotationAnim.fromValue = 0
        rotationAnim.toValue = Double.pi * 2
        rotationAnim.repeatCount = MAXFLOAT
        rotationAnim.duration = 1
        // 这个属性很重要 如果不设置当页面运行到后台再次进入该页面的时候 动画会停止
        rotationAnim.isRemovedOnCompletion = false
        
        // 3.将动画添加到layer中
        self.loadImageView.layer.add(rotationAnim, forKey: nil)
    }
    /// 停止动画并移除视图
    func stopRotationAnim() {
        self.loadImageView.layer.removeAllAnimations()
        self.removeAllSubviews()
        self.removeFromSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        GTZLog(message: "移除loadView")
    }
    
}
