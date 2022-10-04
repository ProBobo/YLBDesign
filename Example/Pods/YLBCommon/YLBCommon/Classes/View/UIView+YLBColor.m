//
//  UIView+YLBColor.m
//  Pods-YLBCommon_Example
//
//  Created by yulibo on 2020/4/2.
//

#import "UIView+YLBColor.h"

@implementation UIView (YLBColor)

#pragma mark - 修改字体渐变色
/*
 view 是要设置渐变字体的控件   bgView是view的父视图  colors是渐变的组成颜色  startPoint是渐变开始点 endPoint结束点
 */
+ (void)ylbTextGradientview:(UIView *)view bgView:(UIView *)bgView gradientColors:(NSArray *)colors gradientStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    
    CAGradientLayer* gradientLayer1 = [CAGradientLayer layer];
    gradientLayer1.frame = view.frame;
    gradientLayer1.colors = colors;
    gradientLayer1.startPoint =startPoint;
    gradientLayer1.endPoint = endPoint;
    [bgView.layer addSublayer:gradientLayer1];
    gradientLayer1.mask = view.layer;
    view.frame = gradientLayer1.bounds;
}
 
/*
 control 是要设置渐变字体的控件   bgView是control的父视图  colors是渐变的组成颜色  startPoint是渐变开始点 endPoint结束点
 */
+ (void)ylbTextGradientControl:(UIControl *)control bgView:(UIView *)bgView gradientColors:(NSArray *)colors gradientStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
 
    CAGradientLayer* gradientLayer1 = [CAGradientLayer layer];
    gradientLayer1.frame = control.frame;
    gradientLayer1.colors = colors;
    gradientLayer1.startPoint =startPoint;
    gradientLayer1.endPoint = endPoint;
    [bgView.layer addSublayer:gradientLayer1];
    gradientLayer1.mask = control.layer;
    control.layer.frame = gradientLayer1.bounds;
}

@end
