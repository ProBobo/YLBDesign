//
//  NSString+YLBSize.h
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/31.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//NSString计算宽高
@interface NSString (YLBSize)
/**
 获取字符串高度
 */
+ (CGFloat)ylb_stringHeight:(UIFont *)font;
/**
获取字符串高度
*/
- (CGFloat)ylb_stringHeight:(UIFont *)font;
/**
获取字符串宽高
*/
- (CGSize)ylb_stringSize:(UIFont *)font;
/**
 获取当前文本的宽高： 适用于不换行的情况，宽度、高度不受限制的情况
 */
- (CGSize)ylb_sizeWithSringFont:(UIFont *)font;
/**
 获取当前文本的宽高： 适用于不换行的情况，宽度、高度不受限制的情况
 */
+ (CGSize)ylb_sizeWithSring:(NSString *)text font:(UIFont *)font;
/**
 获取当前文本的宽高： 适用于换行的情况，高度不受限制的情况
 */
+ (CGSize)ylb_sizeWithSring:(NSString *)text font:(UIFont *)font maxWidth:(CGFloat)width;
/**
 获取当前文本的宽高： 适用于换行的情况，宽度、高度自定义的情况
 */
+ (CGSize)ylb_sizeWithSring:(NSString *)text font:(UIFont *)font boundingRectWithSize:(CGSize)boundingRectWithSize;
@end

NS_ASSUME_NONNULL_END
