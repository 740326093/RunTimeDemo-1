//
//  UIView+JHExtension.m
//  RunTimeDemo-OC
//
//  Created by yunna on 2018/4/4.
//  Copyright © 2018年 yunna. All rights reserved.
//

#import "UIView+JHExtension.h"
#import <objc/runtime.h>
static const void *RunTimeViewID = @"RunTimeViewID";
static const void *RunTimeViewParam = @"RunTimeViewParam";

@implementation UIView (JHExtension)

- (NSString *)viewID{
    NSString *ID = objc_getAssociatedObject(self, &RunTimeViewID);
    return ID;
}
- (void)setViewID:(NSString *)viewID{
    objc_setAssociatedObject(self, &RunTimeViewID, viewID, OBJC_ASSOCIATION_COPY_NONATOMIC);
}



- (NSDictionary *)viewParam{
    NSDictionary *param = objc_getAssociatedObject(self, &RunTimeViewParam);
    return param;
}
- (void)setViewParam:(NSDictionary *)viewParam{
     objc_setAssociatedObject(self, &RunTimeViewParam, viewParam, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


@end



















