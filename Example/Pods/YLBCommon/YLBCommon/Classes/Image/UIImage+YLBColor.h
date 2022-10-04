//
//  UIImage+YLBColor.h
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/27.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YLBColor)
/**
 修改图片轮廓颜色
 */
- (UIImage *)ylb_imageWIthTintColor:(UIColor *)tintColor;
@end

NS_ASSUME_NONNULL_END
