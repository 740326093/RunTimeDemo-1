//
//  UIButton+JHExtension.h
//  RunTimeDemo-OC
//
//  Created by yunna on 2018/4/3.
//  Copyright © 2018年 yunna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (JHExtension)
///时间间隔
@property (nonatomic,assign) NSTimeInterval durationTime;

///多参数
@property (nonatomic,strong) NSDictionary *ButtonParam;


/**
 *  扩大 UIButton 的点击范围
 *
 *
 *  @param top    上
 *  @param right  right
 *  @param bottom bottom
 *  @param left   left
 */
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;





@end
