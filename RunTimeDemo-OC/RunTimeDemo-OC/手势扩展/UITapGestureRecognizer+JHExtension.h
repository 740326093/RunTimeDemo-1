//
//  UITapGestureRecognizer+JHExtension.h
//  RunTimeDemo-OC
//
//  Created by yunna on 2018/4/4.
//  Copyright © 2018年 yunna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITapGestureRecognizer (JHExtension)<UIGestureRecognizerDelegate>
/**
 添加点击事件
 
 @param target taeget
 @param action action
 @param duration 时间间隔
 */
- (instancetype)initWithTarget:(id)target action:(SEL)action withDuration:(NSTimeInterval)duration;


///时间间隔
@property (nonatomic,assign) NSTimeInterval duration;





@end
