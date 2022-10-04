//
//  UIView+YLBFrame.h
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/24.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YLBFrame)

@property(nonatomic, assign) CGFloat ylb_x;
@property(nonatomic, assign) CGFloat ylb_y;
@property(nonatomic, assign) CGFloat ylb_width;
@property(nonatomic, assign) CGFloat ylb_height;
@property(nonatomic, assign) CGPoint ylb_origin;

@property (nonatomic, assign) CGFloat ylb_centerX;
@property (nonatomic, assign) CGFloat ylb_centerY;

@property(nonatomic, assign) CGSize ylb_size;

@property(nonatomic, assign) CGFloat ylb_leftSpace;
@property(nonatomic, assign) CGFloat ylb_topSpace;
@property(nonatomic, assign) CGFloat ylb_rightSpace;
@property(nonatomic, assign) CGFloat ylb_bottomSpace;

@property(nonatomic, assign) CGFloat ylb_maxX;
@property(nonatomic, assign) CGFloat ylb_maxY;
/**
 目前的设计：1、ylb_maxWidth必须大于0，0表示关闭ylb_maxWidth设置；2、调用ylb_width才可以启用ylb_maxWidth
 */
@property(nonatomic, assign) CGFloat ylb_maxWidth;

- (void)ylb_becomeCenterInSuperView:(UIView *)superView;

@end

NS_ASSUME_NONNULL_END
