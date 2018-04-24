//
//  UIScrollView+JHEmptyDataSet.h
//  EmptyDataRefreshDemo
//
//  Created by yunna on 2018/1/5.
//  Copyright © 2018年 yunna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>

typedef void(^ClickBlock)(void);

@interface UIScrollView (JHEmptyDataSet)<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (nonatomic) ClickBlock clickBlock;                // 点击事件
@property (nonatomic, assign) CGFloat offset;               // 垂直偏移量
@property (nonatomic, strong) NSString *emptyText;          // 空数据显示内容
@property (nonatomic, strong) UIImage *emptyImage;          // 空数据的图片


- (void)setupEmptyData:(ClickBlock)clickBlock;
- (void)setupEmptyDataText:(NSString *)text tapBlock:(ClickBlock)clickBlock;
- (void)setupEmptyDataText:(NSString *)text verticalOffset:(CGFloat)offset tapBlock:(ClickBlock)clickBlock;
- (void)setupEmptyDataText:(NSString *)text verticalOffset:(CGFloat)offset emptyImage:(UIImage *)image tapBlock:(ClickBlock)clickBlock;

@end













