//
//  UIButton+JHExtension.m
//  RunTimeDemo-OC
//
//  Created by yunna on 2018/4/3.
//  Copyright © 2018年 yunna. All rights reserved.
//

#import "UIButton+JHExtension.h"
#import <objc/runtime.h>
@implementation UIButton (JHExtension)

+ (void)load{
    Method originalMethod = class_getInstanceMethod([self class], @selector(sendAction:to:forEvent:));
    Method swizzledMethod = class_getInstanceMethod([self class], @selector(JH_SendAction:to:forEvent:));
    method_exchangeImplementations(originalMethod, swizzledMethod);
}


#pragma mark -- 时间间隔 --
static const void *ButtonDurationTime = @"ButtonDurationTime";
- (NSTimeInterval)durationTime{
    NSNumber *number = objc_getAssociatedObject(self, &ButtonDurationTime);
    return number.doubleValue;
}
- (void)setDurationTime:(NSTimeInterval)durationTime{
    NSNumber *number = [NSNumber numberWithDouble:durationTime];
    objc_setAssociatedObject(self, &ButtonDurationTime, number, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)JH_SendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    
    self.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.durationTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.userInteractionEnabled = YES;
    });
    
    [self JH_SendAction:action to:target forEvent:event];
}



#pragma mark -- 扩大 UIButton 的点击范围 --
static const void *topNameKey = @"topNameKey";
static const void *rightNameKey = @"rightNameKey";
static const void *bottomNameKey = @"bottomNameKey";
static const void *leftNameKey = @"leftNameKey";


- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left{
    
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargedRect
{
    NSNumber *topEdge = objc_getAssociatedObject(self, &topNameKey);
    NSNumber *rightEdge = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber *bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber *leftEdge = objc_getAssociatedObject(self, &leftNameKey);
    
    if (topEdge && rightEdge && bottomEdge && leftEdge) {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    }
    else
    {
        return self.bounds;
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds)) {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}

#pragma mark -- 携带多参数 --
static const void *RunTimeButtonParam = @"RunTimeButtonParam";
- (NSDictionary*)ButtonParam{
    NSDictionary *param = objc_getAssociatedObject(self, &RunTimeButtonParam);
    return param;
}
- (void)setButtonParam:(NSDictionary *)ButtonParam{
    objc_setAssociatedObject(self, &RunTimeButtonParam, ButtonParam, OBJC_ASSOCIATION_COPY_NONATOMIC);
}









@end
