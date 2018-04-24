//
//  UIScrollView+JHRefresh.h
//  EmptyDataRefreshDemo
//
//  Created by yunna on 2018/1/5.
//  Copyright © 2018年 yunna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (JHRefresh)


/**
 添加刷新事件

 @param headerBlock 头部刷新
 @param footerBlock 底部刷新
 */
- (void)setRefreshWithHeaderBlock:(void(^)(void))headerBlock
                      footerBlock:(void(^)(void))footerBlock;


/**
 开启头部刷新
 */
- (void)headerBeginRefreshing;


/**
 没有更多数据
 */
- (void)footerNoMoreData;


/**
 结束刷新
 */
- (void)endRefresh;


@end
