//
//  NSString+YLBAttribute.h
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/31.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YLBAttribute)
/**
 获取带有不同样式的文字内容
 @param stringArray 字符串数组
 @param attributeArray 样式数组
 */
+ (NSAttributedString *)ylb_attributedStringWithStringArray:(NSArray*)stringArray attributeArray:(NSArray *)attributeArray;
/**
获取富文本的宽高： 适用于换行的情况，宽度、高度不受限制的情况
*/
+ (CGRect)ylb_rectWithAttributedString:(NSAttributedString *)attributedString;
/**
获取富文本的宽高： 适用于换行的情况，高度不受限制的情况
*/
+ (CGRect)ylb_rectWithAttributedString:(NSAttributedString *)attributedString maxWidth:(CGFloat)maxWidth;
/**
获取富文本的宽高： 适用于换行的情况，宽度、高度自定义的情况
*/
+ (CGRect)ylb_rectWithAttributedString:(NSAttributedString *)attributedString boundingRectWithSize:(CGSize)boundingRectWithSize;
#pragma mark - 计算包含行间距的富文本
/*
 *  设置行间距和字间距
 *
 *  @param string    字符串
 *  @param lineSpace 行间距
 *  @param kern      字间距
 *  @param font      字体大小
 *
 *  @return 富文本
 */
- (NSAttributedString *)setAttributedWithString:(NSString *)string WithLineSpace:(CGFloat)lineSpace kern:(CGFloat)kern font:(UIFont *)font;

/* 获取富文本的宽高
 *
 * @param string    文字
 * @param lineSpace 行间距
 * @param kern      字间距
 * @param font      字体大小
 * @param width     文本宽度
 *
 * @return size
 */
- (CGSize)getAttributionHeightWithString:(NSString *)string lineSpace:(CGFloat)lineSpace kern:(CGFloat)kern font:(UIFont *)font width:(CGFloat)width;
@end

NS_ASSUME_NONNULL_END
