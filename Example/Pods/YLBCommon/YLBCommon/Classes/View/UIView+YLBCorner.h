//
//  UIView+YLBCorner.h
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/31.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YLBCorner)

#pragma mark - 设置圆角
- (void)ylb_Set_View_Left_Right_Corner:(CGSize)cornerRadii;
- (void)ylb_Set_View_Corner:(CGSize)cornerRadii corners:(UIRectCorner)corners;
- (void)ylb_Set_View_TopLeft_ArcCenter:(CGPoint)center radius:(CGFloat)radius;
@end

NS_ASSUME_NONNULL_END
