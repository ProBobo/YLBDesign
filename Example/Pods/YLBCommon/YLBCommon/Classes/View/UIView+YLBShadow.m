//
//  UIView+YLBShadow.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/31.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "UIView+YLBShadow.h"
#import <objc/runtime.h>

static char ylbGradientLayerKey;

@implementation UIView (YLBShadow)

- (void)setYlb_gradientLayer:(CAGradientLayer *)ylb_gradientLayer {
    objc_setAssociatedObject(self, &ylbGradientLayerKey, ylb_gradientLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CAGradientLayer *)ylb_gradientLayer {
    return objc_getAssociatedObject(self, &ylbGradientLayerKey);
}

- (void)ylb_Set_Gradient_Color:(NSArray *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint
{
    //实现背景渐变
    
    if (!self.ylb_gradientLayer) {
        //初始化CAGradientlayer对象，使它的大小为UIView的大小
        self.ylb_gradientLayer = [CAGradientLayer layer];
        //将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
        [self.layer insertSublayer:self.ylb_gradientLayer atIndex:0];
    }
    self.ylb_gradientLayer.frame = self.bounds;
    //设置渐变区域的起始和终止位置（范围为0-1）
//    gradientLayer.startPoint = CGPointMake(0, 0);
//    gradientLayer.endPoint = CGPointMake(0, 1);
    self.ylb_gradientLayer.startPoint = startPoint;
    self.ylb_gradientLayer.endPoint = endPoint;
    
    //设置颜色数组
//    gradientLayer.colors = @[(__bridge id)[UIColor blueColor].CGColor,
//                                  (__bridge id)[UIColor redColor].CGColor];
    self.ylb_gradientLayer.colors = colors;
    
    //设置颜色分割点（范围：0-1）
//    gradientLayer.locations = @[@(0.5f), @(1.0f)];
}

// 添加四边阴影效果
+ (void)ylb_addShadowToViewWithCornerRadius:(CGFloat)cornerRadius originalView:(UIView *)originalView withColor:(UIColor *)originalColor {
    // 阴影颜色
    originalView.layer.shadowColor = originalColor.CGColor;
    // 阴影偏移，
    originalView.layer.shadowOffset = CGSizeMake(0,0);
    // 阴影透明度
    originalView.layer.shadowOpacity = 0.5;
    // 阴影半径
    originalView.layer.shadowRadius = cornerRadius;
    
}
// 添加底部单边阴影效果
+ (void)ylb_addOneLineShadowToViewWithCornerRadius:(CGFloat)cornerRadius originalView:(UIView *)originalView withColor:(UIColor *)originalColor {
    originalView.layer.shadowColor = originalColor.CGColor;
    originalView.layer.shadowOffset = CGSizeMake(0,0);
    originalView.layer.shadowOpacity = 0.5;
    originalView.layer.shadowRadius = cornerRadius;
    // 单边阴影 顶边
    float shadowPathWidth = originalView.layer.shadowRadius;
    CGRect shadowRect = CGRectMake(0, CGRectGetHeight(originalView.frame)-shadowPathWidth/2.0, originalView.bounds.size.width, shadowPathWidth);
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:shadowRect];
    originalView.layer.shadowPath = path.CGPath;
}

// 添加底部单边阴影效果，自定义透明度
+ (void)ylb_addOneLineShadowToViewWithCornerRadius:(CGFloat)cornerRadius originalView:(UIView *)originalView withColor:(UIColor *)originalColor shadowOpacity:(float)shadowOpacity {
    originalView.layer.shadowColor = originalColor.CGColor;
    originalView.layer.shadowOffset = CGSizeMake(0,0);
    originalView.layer.shadowOpacity = shadowOpacity;
    originalView.layer.shadowRadius = cornerRadius;
    // 单边阴影 顶边
    float shadowPathWidth = originalView.layer.shadowRadius;
    CGRect shadowRect = CGRectMake(0, CGRectGetHeight(originalView.frame)-shadowPathWidth/2.0, originalView.bounds.size.width, shadowPathWidth);
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:shadowRect];
    originalView.layer.shadowPath = path.CGPath;
}

// 自定义阴影效果
+ (void)ylb_addCustomShadowToViewWithOriginalView:(UIView *)originalView
                                     cornerRadius:(CGFloat)cornerRadius
                                      shadowColor:(UIColor *)shadowColor
                                     shadowOffset:(CGSize)shadowOffset
                                    shadowOpacity:(float)shadowOpacity {
    // 阴影半径
    originalView.layer.shadowRadius = cornerRadius;
    // 阴影颜色
    originalView.layer.shadowColor = shadowColor.CGColor;
    // 阴影偏移
    originalView.layer.shadowOffset = shadowOffset;
    // 阴影透明度
    originalView.layer.shadowOpacity = shadowOpacity;
    
}

@end
