//
//  UIView+YLBCreateImage.h
//  YLBCommon_Example
//
//  Created by yulibo on 2020/4/3.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YLBCreateImage)

/**
 将View上的控件合成image
 */
+ (UIImage *)imageWithView:(UIView *)view;
/**
 生成渐变色图片：通过坐标生成
*/
+ (UIImage *)createGradientColorImageWithBounds:(CGRect)bounds
                                         colors:(NSArray *)colors
                                     startPoint:(CGPoint)startPoint
                                       endPoint:(CGPoint)endPoint;
/**
 生成渐变色图片：通过UIView生成
*/
+ (UIImage *)createGradientColorImageWithView:(UIView *)view
                                       colors:(NSArray *)colors
                                   startPoint:(CGPoint)startPoint
                                     endPoint:(CGPoint)endPoint;

@end

NS_ASSUME_NONNULL_END
