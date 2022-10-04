//
//  UIColor+YLBColor.h
//  YLBCommon_Example
//
//  Created by yulibo on 2020/4/20.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (YLBColor)
+ (UIColor *)ylb_RGBANumeratorColorWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b alpha:(CGFloat)a;
@end

NS_ASSUME_NONNULL_END
