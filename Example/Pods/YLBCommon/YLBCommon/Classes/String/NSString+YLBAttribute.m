//
//  NSString+YLBAttribute.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/31.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "NSString+YLBAttribute.h"

@implementation NSString (YLBAttribute)

+ (NSAttributedString *)ylb_attributedStringWithStringArray:(NSArray*)stringArray attributeArray:(NSArray *)attributeArray {
    // 定义要显示的文字内容
    NSString * string = [stringArray componentsJoinedByString:@""];//拼接传入的字符串数组
    // 通过要显示的文字内容来创建一个带属性样式的字符串对象
    NSMutableAttributedString * result = [[NSMutableAttributedString alloc] initWithString:string];
    NSInteger startIndex = 0;
    for(NSInteger i = 0; i < stringArray.count; i++){
        // 将某一范围内的字符串设置样式
        NSString *currentStr = stringArray[i];
        [result setAttributes:attributeArray[i] range:NSMakeRange(startIndex, currentStr.length)];
        startIndex = startIndex + currentStr.length;
    }
    // 返回已经设置好的带有样式的文字
    return [[NSAttributedString alloc] initWithAttributedString:result];
}

/**
获取富文本的宽高： 适用于换行的情况，宽度、高度不受限制的情况
*/
+ (CGRect)ylb_rectWithAttributedString:(NSAttributedString *)attributedString {
    CGRect rect = [attributedString boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    return rect;
}
/**
获取富文本的宽高： 适用于换行的情况，高度不受限制的情况
*/
+ (CGRect)ylb_rectWithAttributedString:(NSAttributedString *)attributedString maxWidth:(CGFloat)maxWidth {
    CGRect rect = [attributedString boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    return rect;
}
/**
获取富文本的宽高： 适用于换行的情况，宽度、高度自定义的情况
*/
+ (CGRect)ylb_rectWithAttributedString:(NSAttributedString *)attributedString boundingRectWithSize:(CGSize)boundingRectWithSize {
    CGRect rect = [attributedString boundingRectWithSize:boundingRectWithSize options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    return rect;
}
#pragma mark - 计算包含行间距的富文本
//设置行间距和字间距
- (NSAttributedString *)setAttributedWithString:(NSString *)string WithLineSpace:(CGFloat)lineSpace kern:(CGFloat)kern font:(UIFont *)font {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //调整行间距
    paragraphStyle.lineSpacing = lineSpace;
    NSDictionary *attriDict = @{
        NSParagraphStyleAttributeName:paragraphStyle,
        NSKernAttributeName:@(kern),
        NSFontAttributeName:font
    };
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:string attributes:attriDict];
    return attributedString;
}

// 获取富文本的宽高
- (CGSize)getAttributionHeightWithString:(NSString *)string lineSpace:(CGFloat)lineSpace kern:(CGFloat)kern font:(UIFont *)font width:(CGFloat)width {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpace;
    NSDictionary *attriDict = @{
        NSParagraphStyleAttributeName:paragraphStyle,
        NSKernAttributeName:@(kern),
        NSFontAttributeName:font
    };
    CGSize size = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attriDict context:nil].size;
    return size;
}
@end
