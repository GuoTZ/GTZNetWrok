//
//  GTZLoadView.swift
//  GTZSwiftProject
//
//  Created by guangai on 2017/6/19.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit

enum GTZLoadState {
    
    /// 正在刷新
    case loading
    ///结束
    case finish
    ///失败
    case failed
}

class GTZLoadView: UIView {

    ///图片名称
    var imageNamed = "加载背景"
    ///文字内容
    var titleString = "努力加载中..."
    ///文字大小
    var font:CGFloat = 15
    ///文字颜色
    let textColor = UIColor(hexString: "666666")
    
    private static let shared = GTZLoadView()
    class var sharedView:GTZLoadView {
        return shared
    }
    
    lazy var imageView :UIImageView = {
        let imageV = UIImageView.init(image: UIImage.init(named: self.imageNamed))
        imageV.frame = CGRect(x: (SCREEN_WIDTH-imageV.WIDTH)/2.0, y: 200, width: imageV.WIDTH, height: imageV.HEIGHT)
        return imageV
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLeb = UILabel(frame: CGRect(x: 0, y: self.imageView.frame.origin.y + self.imageView.HEIGHT + 20, width: self.WIDTH, height: 20))
        titleLeb.font = UIFont.systemFont(ofSize: self.font)
        titleLeb.textAlignment = .center
        titleLeb.text = self.titleString
        titleLeb.textColor = self.textColor
        return titleLeb
    }()
    
    
    lazy var loadingBtn:UIButton = {
        let btn = GTZKit.configButton(frame: CGRect.init(x: SCREEN_WIDTH/2-50.0, y: self.titleLabel.frame.origin.y + self.titleLabel.HEIGHT + 20, width: 100, height: 40), normaltitle: "重新加载", selecttitle: nil, disabltitle: nil, normalColor: UIColor.black, selectColor: nil, disablColor: nil, font: 15, cornerRadius: 3)
    
        return btn
    }()
    
    private init() {
        super.init(frame: CGRect.init(x: 0, y: 65, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        self.backgroundColor = UIColor.white
        self.addSubview(self.imageView)
        self.addSubview(self.titleLabel)
        
    }
    
    
    /// 开始提示
    func startLoading() {
        self.loadingBtn.removeFromSuperview()
        self.titleLabel.text = titleString
        self.imageView.image = UIImage(named: imageNamed)
        let win = UIApplication.shared.keyWindow
        win?.addSubview(self)
        startAnimation()
    }
    
    func startAnimation() {
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
        self.imageView.layer.add(rotationAnim, forKey: nil)
    }
    
    /// 完成
    func finish() {
        self.imageView.layer.removeAllAnimations()
        self.removeAllSubviews()
        self.removeFromSuperview()
        
    }
    
    /// 失败
    func failed() {
        self.titleLabel.text = "哎呀!出错了..."
        self.imageView.layer.removeAllAnimations()
        self.addSubview(self.loadingBtn)
        self.loadingBtn.addTarget(self, action: #selector(self.loadingBtnAction), for: .touchUpInside)
    }
    
    
    func loadingBtnAction() {
        
    }
    
    /// 设置状态
    ///
    /// - Parameter state: 状态：加载中、完成、失败
    func setLoadState(state:GTZLoadState) {
        switch state {
        case .loading:
            self.startLoading()
            break
        case .finish:
            self.finish()
            break
        case .failed:
            self.failed()
            break
        }
    }

    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
