//
//  NavigationController.swift
//  RunTimeDemo-Swift
//
//  Created by yunna on 2018/4/4.
//  Copyright © 2018年 yunna. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController,UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let target = self.interactivePopGestureRecognizer?.delegate
        let pan = UIPanGestureRecognizer(target: target, action: Selector(("handleNavigationTransition:")))
        pan.delegate = self
        self.view.addGestureRecognizer(pan)
        // 禁止使用系统自带的滑动手势
        self.interactivePopGestureRecognizer?.isEnabled = false;
    }

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if (self.childViewControllers.count == 1) {
            // 表示用户在根控制器界面，就不需要触发滑动手势，
            return false;
        }
        return true;
    }
}














