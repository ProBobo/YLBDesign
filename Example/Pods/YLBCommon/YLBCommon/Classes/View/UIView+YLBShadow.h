//
//  UIView+YLBShadow.h
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/31.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YLBShadow)
@property (nonatomic, strong) CAGradientLayer* ylb_gradientLayer;

#pragma mark - 设置渐变色
/**
 需要在设置frame以后调用
 */
- (void)ylb_Set_Gradient_Color:(NSArray *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;
/**
 添加四边阴影效果
 */
+ (void)ylb_addShadowToViewWithCornerRadius:(CGFloat)cornerRadius originalView:(UIView *)originalView withColor:(UIColor *)originalColor;
/**
 添加底部单边阴影效果
 */
+ (void)ylb_addOneLineShadowToViewWithCornerRadius:(CGFloat)cornerRadius originalView:(UIView *)originalView withColor:(UIColor *)originalColor;
/**
 添加底部单边阴影效果，自定义透明度
 */
+ (void)ylb_addOneLineShadowToViewWithCornerRadius:(CGFloat)cornerRadius originalView:(UIView *)originalView withColor:(UIColor *)originalColor shadowOpacity:(float)shadowOpacity;
/**
 自定义阴影效果
 */
+ (void)ylb_addCustomShadowToViewWithOriginalView:(UIView *)originalView
                                     cornerRadius:(CGFloat)cornerRadius
                                      shadowColor:(UIColor *)shadowColor
                                     shadowOffset:(CGSize)shadowOffset
                                    shadowOpacity:(float)shadowOpacity;

@end

NS_ASSUME_NONNULL_END
