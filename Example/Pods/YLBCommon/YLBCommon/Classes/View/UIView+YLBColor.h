//
//  UIView+YLBColor.h
//  Pods-YLBCommon_Example
//
//  Created by yulibo on 2020/4/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YLBColor)

/*
 view 是要设置渐变字体的控件   bgView是view的父视图  colors是渐变的组成颜色  startPoint是渐变开始点 endPoint结束点
 */
+ (void)ylbTextGradientview:(UIView *)view bgView:(UIView *)bgView gradientColors:(NSArray *)colors gradientStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;
/*
control 是要设置渐变字体的控件   bgView是control的父视图  colors是渐变的组成颜色  startPoint是渐变开始点 endPoint结束点
*/
+ (void)ylbTextGradientControl:(UIControl *)control bgView:(UIView *)bgView gradientColors:(NSArray *)colors gradientStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;
@end

NS_ASSUME_NONNULL_END
