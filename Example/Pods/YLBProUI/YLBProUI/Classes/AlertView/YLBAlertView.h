//
//  YLBAlertView.h
//  YLBProUI_Example
//
//  Created by yulibo on 2020/3/27.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, YLBAlertViewAlignment) {
    YLBAlertViewAlignmentNone = 0,
    YLBAlertViewAlignmentCenter
};

@interface YLBAlertView : UIView
/**
 点击空白处是否移除弹框
 */
@property(nonatomic, assign) BOOL isTouchEnable;
/**
 创建弹框
 */
+ (instancetype)createAlertView;
/**
 显示弹框
 */
- (void)showView:(UIView *)view alignment:(YLBAlertViewAlignment)alignment;
- (void)showView:(UIView *)view alignment:(YLBAlertViewAlignment)alignment atIndex:(NSInteger)index;
/**
 移除弹框
 */
- (void)hideView;
/**
 移除弹框的回调方法：主要用于手动释放全局变量weakSelf.alertView = nil;局部变量可以不设置，系统将会自动释放。
 示例代码：
 @property(nonatomic, strong) YLBAlertView *alertView;
 
 YLBAlertView *alertView = [YLBAlertView createAlertView];
 _alertView = alertView;
 [alertView setBackgroundViewColor:bgColor];
 [alertView showView:showView alignment:YLBAlertViewAlignmentCenter];
 __weak __typeof(self)weakSelf = self;
 alertView.hideViewBlock = ^{
     weakSelf.alertView = nil;//全局变量需要手动释放设置为nil，局部变量可以不设置为nil
 };
 
 */
@property(nonatomic, copy) void (^hideViewBlock)(void);
/**
 设置背景颜色及透明度
 */
- (void)setBackgroundViewColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
