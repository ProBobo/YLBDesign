//
//  YLBImaginaryLine.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/30.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "YLBImaginaryLine.h"
#import "YLBCommonDefines.h"

@implementation YLBImaginaryLine

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect { //可以通过 setNeedsDisplay 方法调用 drawRect:
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 设置线条样式
    CGContextSetLineCap(context, kCGLineCapRound);
    // 绘制线条宽度
    CGContextSetLineWidth(context, 1.0);
    // 绘制线条颜色
    UIColor *color = UIColor.lightGrayColor;
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    // 开始绘制
    CGContextBeginPath(context);
    // 设置虚线绘制起点
    CGContextMoveToPoint(context, 3.0, self.frame.size.height/2);
    // lengths的值｛4,6｝表示先绘制4个点，再跳过6个点，如此反复
    CGFloat lengths[] = {4,6};
    // 虚线的起始点
    CGContextSetLineDash(context, 0, lengths,2);
    // 绘制虚线的终点
    CGContextAddLineToPoint(context, self.frame.size.width - 3,self.frame.size.height/2);
    // 绘制
    CGContextStrokePath(context);
    // 关闭图像
    CGContextClosePath(context);
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
@end
