//
//  UIScrollView+YLBAdjustment.h
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/23.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (YLBAdjustment)
+ (void)stopAdjustmentWithScrollView:(UIScrollView *)scrollView controller:(UIViewController *)controller;
- (void)stopAdjustmentWithScrollView:(UIScrollView *)scrollView controller:(UIViewController *)controller;
@end

NS_ASSUME_NONNULL_END
