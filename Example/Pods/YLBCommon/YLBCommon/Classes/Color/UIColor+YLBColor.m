//
//  UIColor+YLBColor.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/4/20.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "UIColor+YLBColor.h"

@implementation UIColor (YLBColor)

+ (UIColor *)ylb_RGBANumeratorColorWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b alpha:(CGFloat)a {
    UIColor *color = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a];
    return color;
}

@end
