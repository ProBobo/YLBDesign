//
//  YLBColorTitleLabel.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/4/3.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "YLBColorTitleLabel.h"
#import <CoreText/CoreText.h>

@implementation YLBColorTitleLabel

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (void)drawRect:(CGRect)rect {
//    [super drawRect:rect];
    if (!self.text) {
        return;
    }
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context); //保存上下文环境
//     NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
//    paragraphStyle.alignment                = self.textAlignment;//NSTextAlignmentCenter;

    NSDictionary *attributes = @{NSFontAttributeName:self.font, NSForegroundColorAttributeName:self.textColor
//                                 , NSParagraphStyleAttributeName:paragraphStyle
                                 
    };
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:self.text attributes:attributes];
    CGFloat width = CGRectGetWidth(rect);
    CGFloat height = CGRectGetHeight(rect);
    //生成CTFrame
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attributedString);
    CGPathRef path = CGPathCreateWithRect(CGRectMake(0, 0, width, height), NULL);
    CTFrameRef frameRef = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, nil);
    CFArrayRef CTLines = CTFrameGetLines(frameRef); //获取到每一行
    NSInteger lineCount = CFArrayGetCount(CTLines);
    // 绘制每一行的普通文字
    CGFloat lineTop = 0;
    NSMutableArray *emojis = [NSMutableArray array];
    for (NSInteger i = 0; i < lineCount; i++) {
        CTLineRef line = CFArrayGetValueAtIndex(CTLines, i);
        CGFloat ascent, descent, leading;
        CTLineGetTypographicBounds(line, &ascent, &descent, &leading);
        CGFloat runHeight = ascent + fabs(descent) + fabs(leading);
        NSArray *runArray = (__bridge NSArray *)CTLineGetGlyphRuns(line); //获取到每一个glyphRun
        CGFloat startX = 0;
        for (NSInteger j = 0; j< runArray.count; j++) {
            CTRunRef runRef = (__bridge  CTRunRef)runArray[j];
            CFRange runRange = CTRunGetStringRange(runRef);
            NSDictionary * attributes = (NSDictionary *)CTRunGetAttributes(runRef);
            UIFont *font = [attributes objectForKey:@"NSFont"];
            CGFloat runWidth = CTRunGetTypographicBounds(runRef, CFRangeMake(0, 0), 0, 0, 0);
            NSString *str = [self.text substringWithRange:NSMakeRange(runRange.location, runRange.length)];
            if ([font.familyName containsString:@"Emoji"]) { //判断是否是emoji表情
                CGRect temRect = CGRectMake(startX,lineTop, runWidth, runHeight);
                [emojis addObject:@{@"str":str, @"rect":[NSValue valueWithCGRect:temRect]}];
            } else {
                //这里不加上descent/2，文字会往上偏，这里还不清楚为什么，有大佬给指教下吗
                CGRect temRect = CGRectMake(startX,lineTop + descent/2, runWidth, runHeight);
                [str drawInRect:temRect withAttributes:attributes];
            }
            startX +=runWidth;
        }
        lineTop += runHeight;
    }
    //释放资源
    CFRelease(framesetter);
    CFRelease(frameRef);
    CGPathRelease(path);
    //获取图片
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    CGContextClearRect(context, rect);
    //坐标转换
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0f, -1.0f);
    //将图片设置为mark
    CGContextClipToMask(context, rect, imageRef);
    //绘制渐变层
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    NSArray *gradientColors = [self getColors];;
    CGGradientRef gradientRef = CGGradientCreateWithColors(colorSpaceRef, (__bridge CFArrayRef)gradientColors, NULL);
    CGPoint startPoint = CGPointZero;
    CGPoint endPoint = CGPointMake(width, height);
    CGContextDrawLinearGradient(context, gradientRef, startPoint, endPoint,  kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    //释放资源
    CGColorSpaceRelease(colorSpaceRef);
    CGImageRelease(imageRef);
    CGGradientRelease(gradientRef);
    //恢复上下文环境
    CGContextRestoreGState(context);
    //绘制表情
    for (NSDictionary *emoji in emojis) {
        NSString *str = emoji[@"str"];
        CGRect rect = [emoji[@"rect"] CGRectValue];
        [str drawInRect:rect withAttributes:attributes];
    }
}

- (NSArray *)getColors {
    NSArray *colors;// = @[(id)UIColor.blackColor.CGColor,(id)UIColor.greenColor.CGColor];
    colors = @[(id)[UIColor redColor].CGColor, (id)[UIColor greenColor].CGColor, (id)[UIColor blueColor].CGColor];
    return colors;
}

@end
