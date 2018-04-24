//
//  UIView+JHExtension.swift
//  RunTimeDemo-Swift
//
//  Created by yunna on 2018/4/4.
//  Copyright © 2018年 yunna. All rights reserved.
//

import UIKit

struct RunTimeViewKey {
    static let RunTimeViewID = UnsafeRawPointer.init(bitPattern: "RunTimeViewID".hashValue)
    static let RunTimeViewParam = UnsafeRawPointer.init(bitPattern: "RunTimeViewParam".hashValue)
}

extension UIView {
    var ViewID: String? {
        set {
            objc_setAssociatedObject(self, RunTimeViewKey.RunTimeViewID!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
       
        }
        get {
            return  objc_getAssociatedObject(self, RunTimeViewKey.RunTimeViewID!) as? String
        }
    }
    
   
    
    var ViewParam: Dictionary<String, Any>? {
        set {
            objc_setAssociatedObject(self, RunTimeViewKey.RunTimeViewParam!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            
        }
        get {
            return  objc_getAssociatedObject(self, RunTimeViewKey.RunTimeViewParam!) as? Dictionary
        }
    }
    
 
}



































