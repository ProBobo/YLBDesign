//
//  UIView+YLBCorner.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/31.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "UIView+YLBCorner.h"

@implementation UIView (YLBCorner)

- (void)ylb_Set_View_Left_Right_Corner:(CGSize)cornerRadii {
    //设置切哪个直角
    //    UIRectCornerTopLeft     = 1 << 0,  左上角
    //    UIRectCornerTopRight    = 1 << 1,  右上角
    //    UIRectCornerBottomLeft  = 1 << 2,  左下角
    //    UIRectCornerBottomRight = 1 << 3,  右下角
    //    UIRectCornerAllCorners  = ~0UL     全部角
    //得到view的遮罩路径
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:cornerRadii];
    //创建 layer
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    //赋值
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)ylb_Set_View_Corner:(CGSize)cornerRadii corners:(UIRectCorner)corners {
    //设置切哪个直角
    //    UIRectCornerTopLeft     = 1 << 0,  左上角
    //    UIRectCornerTopRight    = 1 << 1,  右上角
    //    UIRectCornerBottomLeft  = 1 << 2,  左下角
    //    UIRectCornerBottomRight = 1 << 3,  右下角
    //    UIRectCornerAllCorners  = ~0UL     全部角
    //得到view的遮罩路径
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:cornerRadii];
    //创建 layer
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    //赋值
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)ylb_Set_View_TopLeft_ArcCenter:(CGPoint)center radius:(CGFloat)radius {
//    // 创建弧线路径对象
//       UIBezierPath* maskPath = [UIBezierPath bezierPathWithArcCenter:center
//                                                            radius:radius
//                                                        startAngle:3.1415926
//                                                          endAngle:3.1415926 *3/2
//                                                         clockwise:YES];
//    //创建 layer
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    maskLayer.frame = self.bounds;
//    //赋值
//    maskLayer.path = maskPath.CGPath;
//    self.layer.mask = maskLayer;
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:M_PI endAngle:M_PI*3/2.0 clockwise:YES];
    //添加一根线到圆心
    [maskPath addLineToPoint:center];
    //关闭路径，是从终点到起点
    [maskPath closePath];
    [maskPath stroke];
    //使用填充，默认就会自动关闭路径，（终点到起点）
    [maskPath fill];
    
    //创建 layer
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    //赋值
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
