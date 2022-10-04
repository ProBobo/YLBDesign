//
//  UIScrollView+YLBAdjustment.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/23.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "UIScrollView+YLBAdjustment.h"

@implementation UIScrollView (YLBAdjustment)

+ (void)stopAdjustmentWithScrollView:(UIScrollView *)scrollView controller:(UIViewController *)controller {
#ifdef __IPHONE_11_0
    if (@available(iOS 11.0, *)) {
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
#else
    if ((NO)) {
#endif
    } else {
        controller.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (void)stopAdjustmentWithScrollView:(UIScrollView *)scrollView controller:(UIViewController *)controller {
    [UIScrollView stopAdjustmentWithScrollView:scrollView controller:controller];
}
    
@end
