//
//  YLBHorizontalView.h
//  YLBProUI_Example
//
//  Created by yulibo on 2020/4/14.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLBHorizontalView : UIView
/**
 创建视图
 @param superViewFrame 父视图的frame
 @param leftSpace 左边距
 @param rightSpace 右边距
 */
+ (instancetype)createViewWithSuperViewFrame:(CGRect)superViewFrame height:(CGFloat)height leftSpace:(CGFloat)leftSpace rightSpace:(CGFloat)rightSpace;
/**
 初始化视图
 */
- (instancetype)initWithSuperViewFrame:(CGRect)superViewFrame height:(CGFloat)height leftSpace:(CGFloat)leftSpace rightSpace:(CGFloat)rightSpace;
/**
 重新设置宽度
 */
- (void)resetWidthWihSuperViewFrame:(CGRect)superViewFrame;
/**
 传入间距生成视图：
 主要在tableView的Cell中添加时在layoutSubviews方法中重新设置宽高，因为初始化时cell传入的宽高为0
 */
- (void)resetWidthWihSuperViewFrame:(CGRect)superViewFrame height:(CGFloat)height leftSpace:(CGFloat)leftSpace rightSpace:(CGFloat)rightSpace;
@end

NS_ASSUME_NONNULL_END
