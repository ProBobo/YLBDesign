//
//  NSString+YLBSize.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/31.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "NSString+YLBSize.h"

@implementation NSString (YLBSize)
+ (CGFloat)ylb_stringHeight:(UIFont *)font {
    NSString *theString = @"aA自适应0123456789";
    CGSize size = [theString sizeWithAttributes:@{NSFontAttributeName:font}];
    return size.height;
}
- (CGFloat)ylb_stringHeight:(UIFont *)font {
    CGSize size = [self sizeWithAttributes:@{NSFontAttributeName:font}];
    return size.height;
}
- (CGSize)ylb_stringSize:(UIFont *)font {
    CGSize size = [self sizeWithAttributes:@{NSFontAttributeName:font}];
    return size;
}

////获取当前文本的宽高： 适用于不换行的情况，宽度、高度不受限制的情况
- (CGSize)ylb_sizeWithSringFont:(UIFont *)font {
    return [NSString ylb_sizeWithSring:self font:font];
}
///获取当前文本的宽高： 适用于不换行的情况，宽度、高度不受限制的情况
+ (CGSize)ylb_sizeWithSring:(NSString *)text font:(UIFont *)font
{
    return [self ylb_sizeWithSring:text font:font maxWidth:MAXFLOAT];
}
///获取当前文本的宽高： 适用于换行的情况，高度不受限制的情况
+ (CGSize)ylb_sizeWithSring:(NSString *)text font:(UIFont *)font maxWidth:(CGFloat)maxWidth
{
    return [self ylb_sizeWithSring:text font:font boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT)];
}
///获取当前文本的宽高： 适用于换行的情况，宽度、高度自定义的情况
+ (CGSize)ylb_sizeWithSring:(NSString *)text font:(UIFont *)font boundingRectWithSize:(CGSize)boundingRectWithSize
{
    NSDictionary *attrDict = @{NSFontAttributeName:font};
    CGSize size = [text boundingRectWithSize:boundingRectWithSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrDict context:nil].size;
    return size;
}
@end
