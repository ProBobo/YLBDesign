//
//  UIImage+YLBSystemShareToWX.h
//  YLBCommon_Example
//
//  Created by yulibo on 2020/5/30.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YLBSystemShareToWX)
#pragma mark - 压缩一张图片 最大宽高1280 类似于微信算法
+ (UIImage *)getJPEGImagerImg:(UIImage *)image;
#pragma mark - 压缩多张图片 最大宽高1280 类似于微信算法
+ (NSArray *)getJPEGImagerImgArr:(NSArray *)imageArr;
#pragma mark - 压缩一张图片 自定义最大宽高
+ (UIImage *)getJPEGImagerImg:(UIImage *)image compressibilityFactor:(CGFloat)compressibilityFactor;
#pragma mark - 压缩多张图片 自定义最大宽高
+ (NSArray *)getJPEGImagerImgArr:(NSArray *)imageArr compressibilityFactor:(CGFloat)compressibilityFactor;
#pragma mark - 根据宽高压缩图片
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
@end

NS_ASSUME_NONNULL_END
