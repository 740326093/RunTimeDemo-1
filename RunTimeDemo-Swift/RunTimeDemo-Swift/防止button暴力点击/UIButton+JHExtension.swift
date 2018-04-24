//
//  UIButton+JHExtension.swift
//  RunTimeDemo-Swift
//
//  Created by yunna on 2018/4/3.
//  Copyright © 2018年 yunna. All rights reserved.
//

import UIKit

struct RunTimeButtonKey {
    ///连续两次点击相差时间
    static let timeInterval = UnsafeRawPointer.init(bitPattern: "timeInterval".hashValue)
    
    ///点击区域
    static let topNameKey = UnsafeRawPointer.init(bitPattern: "topNameKey".hashValue)
    static let rightNameKey = UnsafeRawPointer.init(bitPattern: "rightNameKey".hashValue)
    static let bottomNameKey = UnsafeRawPointer.init(bitPattern: "bottomNameKey".hashValue)
    static let leftNameKey = UnsafeRawPointer.init(bitPattern: "leftNameKey".hashValue)
    
    ///携带参数
    static let RunTimeButtonParam = UnsafeRawPointer.init(bitPattern: "RunTimeButtonParam".hashValue)
    
}
//MARK: -- 防止暴力点击 --
extension UIButton {
  
    private static let changeFunction: () = {
        //交换方法
        let systemMethod = class_getInstanceMethod(UIButton.classForCoder(), #selector(UIButton.sendAction(_:to:for:)))
        let swizzMethod = class_getInstanceMethod(UIButton.classForCoder(), #selector(UIButton.mySendAction(_:to:for:)))
        method_exchangeImplementations(systemMethod!, swizzMethod!)
        
        print("changeFunction")
        
    }()
    
    //添加属性,在设置 timeInterval 的时候 修改button的执行事件
    var timeInterval: CGFloat? {
        set {
            objc_setAssociatedObject(self, RunTimeButtonKey.timeInterval!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            UIButton.changeFunction
        }
        
        get {
            
            return  objc_getAssociatedObject(self, RunTimeButtonKey.timeInterval!) as? CGFloat
        }
        
    }
    
    
    
    @objc private dynamic func mySendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
        self.isUserInteractionEnabled = false
        let time:TimeInterval = TimeInterval(timeInterval ?? 0.0)
        DispatchQueue.main.asyncAfter(deadline:.now() + time) {
            self.isUserInteractionEnabled = true
        }
        mySendAction(action, to: target, for: event)
    }
    
    
    
}

//MARK: -- 扩大点击响应事件 --
extension UIButton {
    
    var topEdge: CGFloat? {
        set {
            objc_setAssociatedObject(self, RunTimeButtonKey.topNameKey!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            UIButton.changeFunction
        }
        
        get {
            
            return  objc_getAssociatedObject(self, RunTimeButtonKey.topNameKey!) as? CGFloat
        }
    }
     var leftEdge: CGFloat? {
        set {
            objc_setAssociatedObject(self, RunTimeButtonKey.leftNameKey!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            UIButton.changeFunction
        }
        
        get {
            
            return  objc_getAssociatedObject(self, RunTimeButtonKey.leftNameKey!) as? CGFloat
        }
    }
     var rightEdge: CGFloat? {
        set {
            objc_setAssociatedObject(self, RunTimeButtonKey.rightNameKey!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            UIButton.changeFunction
        }
        
        get {
            
            return  objc_getAssociatedObject(self, RunTimeButtonKey.rightNameKey!) as? CGFloat
        }
    }
    
    var bottomEdge: CGFloat? {
        set {
            objc_setAssociatedObject(self, RunTimeButtonKey.bottomNameKey!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            UIButton.changeFunction
        }
        
        get {
            
            return  objc_getAssociatedObject(self, RunTimeButtonKey.bottomNameKey!) as? CGFloat
        }
    }
    
    
    /// 扩大点击区域
    ///
    /// - Parameters:
    ///   - top: 上
    ///   - right: 右
    ///   - bottom: 下
    ///   - left: 左
    func setEnlargeEdge(top:CGFloat,right:CGFloat,bottom:CGFloat,left:CGFloat)  {
        self.topEdge = top
        self.rightEdge = right
        self.bottomEdge = bottom
        self.leftEdge = left
        
    }
    
    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let left = self.leftEdge ?? 0
        let right = self.rightEdge ?? 0
        let bottom = self.bottomEdge ?? 0
        let top = self.topEdge ?? 0
        
        let rect:CGRect = CGRect(x: self.bounds.origin.x - left,
                             y: self.bounds.origin.y - top,
                             width: self.bounds.size.width + left + right, height: self.bounds.size.height + top + bottom)
        
        
        return rect.contains(point) ? self : nil
    }
 
}


//MARK: -- 携带参数 --
extension UIButton {
    var buttonParam: Dictionary<String, Any>? {
        set {
            objc_setAssociatedObject(self, RunTimeButtonKey.RunTimeButtonParam!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        
        get {
            return  objc_getAssociatedObject(self, RunTimeButtonKey.RunTimeButtonParam!) as? Dictionary
        }
    }
}































