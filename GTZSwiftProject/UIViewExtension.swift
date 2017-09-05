//
//  UIVIew.swift
//  GTZSwiftProject
//
//  Created by guangai on 2017/6/12.
//  Copyright © 2017年 GTZ. All rights reserved.
//

import UIKit

extension UIView{
    
    /// view的宽度
    var WIDTH:CGFloat {
        return self.frame.size.width
    }
    
    /// view的高度
    var HEIGHT:CGFloat {
        return self.frame.size.height
    }
    
    /// view的x
    var FrameX:CGFloat {
        return self.frame.origin.x
    }
    
    /// view的y
    var FrameY:CGFloat {
        return self.frame.origin.y
    }
}
