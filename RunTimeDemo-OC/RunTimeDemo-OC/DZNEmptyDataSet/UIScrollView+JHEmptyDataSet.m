//
//  UIScrollView+DREmptyDataSet.m
//  EmptyDataRefreshDemo
//
//  Created by chenzhen on 2017/4/7.
//  Copyright © 2017年 yunna. All rights reserved.
//

#import "UIScrollView+JHEmptyDataSet.h"
#import <objc/runtime.h>

static const void *KClickBlock = @"clickBlock";
static const void *KEmptyText = @"emptyText";
static const void *KOffSet = @"offset";
static const void *Kimage = @"emptyImage";
 
@implementation UIScrollView (JHEmptyDataSet)

#pragma mark - Getter Setter

- (ClickBlock)clickBlock{
    return objc_getAssociatedObject(self, &KClickBlock);
}

- (void)setClickBlock:(ClickBlock)clickBlock{
    
    objc_setAssociatedObject(self, &KClickBlock, clickBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)emptyText{
    return objc_getAssociatedObject(self, &KEmptyText);
}

- (void)setEmptyText:(NSString *)emptyText{
    objc_setAssociatedObject(self, &KEmptyText, emptyText, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGFloat)offset{
    
    NSNumber *number = objc_getAssociatedObject(self, &KOffSet);
    return number.floatValue;
}

- (void)setOffset:(CGFloat)offset{
    
    NSNumber *number = [NSNumber numberWithDouble:offset];
    
    objc_setAssociatedObject(self, &KOffSet, number, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


- (UIImage *)emptyImage{
    return objc_getAssociatedObject(self, &Kimage);
}

- (void)setEmptyImage:(UIImage *)emptyImage{
    objc_setAssociatedObject(self, &Kimage, emptyImage, OBJC_ASSOCIATION_COPY_NONATOMIC);
}



- (void)setupEmptyData:(ClickBlock)clickBlock{
    self.clickBlock = clickBlock;
    self.emptyDataSetSource = self;
    if (clickBlock) {
        self.emptyDataSetDelegate = self;
    }
}


- (void)setupEmptyDataText:(NSString *)text tapBlock:(ClickBlock)clickBlock{
    
    self.clickBlock = clickBlock;
    self.emptyText = text;
    
    self.emptyDataSetSource = self;
    if (clickBlock) {
        self.emptyDataSetDelegate = self;
    }
}


- (void)setupEmptyDataText:(NSString *)text verticalOffset:(CGFloat)offset tapBlock:(ClickBlock)clickBlock{
    
    self.emptyText = text;
    self.offset = offset;
    self.clickBlock = clickBlock;
    
    self.emptyDataSetSource = self;
    if (clickBlock) {
        self.emptyDataSetDelegate = self;
    }
}


- (void)setupEmptyDataText:(NSString *)text verticalOffset:(CGFloat)offset emptyImage:(UIImage *)image tapBlock:(ClickBlock)clickBlock{
    
    self.emptyText = text;
    self.offset = offset;
    self.emptyImage = image;
    self.clickBlock = clickBlock;
    
    self.emptyDataSetSource = self;
    self.emptyDataSetDelegate = self;
    
}

#pragma mark - DZNEmptyDataSetSource

// 空白界面的标题
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    NSString *text = self.emptyText?:@"没有找到任何数据";
    UIFont *font = [UIFont systemFontOfSize:17.0];
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
    [attStr addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    [attStr addAttribute:NSForegroundColorAttributeName value:JHWordColorDark range:NSMakeRange(0, text.length)];
    
    return attStr;
}

// 空白页的图片
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
    return self.emptyImage?:[UIImage imageNamed:@"mine"];
}

//是否允许滚动，默认NO
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    return YES;
}

// 垂直偏移量
- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView{
    return self.offset;
}


#pragma mark - DZNEmptyDataSetDelegate

- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view{
    if (self.clickBlock) {
        self.clickBlock();
    }
}


@end

