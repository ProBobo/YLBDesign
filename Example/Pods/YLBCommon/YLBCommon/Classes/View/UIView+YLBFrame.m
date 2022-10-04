//
//  UIView+YLBFrame.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/24.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "UIView+YLBFrame.h"
#import <objc/runtime.h>

static char ylb_leftSpace_key;
static char ylb_topSpace_key;
static char ylb_rightSpace_key;
static char ylb_bottomSpace_key;
static char ylb_maxWidth_key;

@implementation UIView (YLBFrame)

#pragma mark - x
- (void)setYlb_x:(CGFloat)ylb_x {
    CGRect frame = self.frame;
    frame.origin.x = ylb_x;
    self.frame = frame;
}

- (CGFloat)ylb_x {
    return self.frame.origin.x;
}
#pragma mark - y
- (void)setYlb_y:(CGFloat)ylb_y {
    CGRect frame = self.frame;
    frame.origin.y = ylb_y;
    self.frame = frame;
}

- (CGFloat)ylb_y {
    return self.frame.origin.y;
}
#pragma mark - width
- (void)setYlb_width:(CGFloat)ylb_width {
    CGRect frame = self.frame;
    if (self.ylb_maxWidth > 0 && ylb_width > self.ylb_maxWidth) {
        ylb_width = self.ylb_maxWidth;
    }
    frame.size.width = ylb_width;
    self.frame = frame;
}

- (CGFloat)ylb_width {
    return self.frame.size.width;
}
#pragma mark - height
- (void)setYlb_height:(CGFloat)ylb_height {
    CGRect frame = self.frame;
    frame.size.height = ylb_height;
    self.frame = frame;
}

- (CGFloat)ylb_height {
    return self.frame.size.height;
}
#pragma mark - origin
- (void)setYlb_origin:(CGPoint)ylb_origin {
    CGRect frame = self.frame;
    frame.origin = ylb_origin;
    self.frame = frame;
}

- (CGPoint)ylb_origin {
    return self.frame.origin;
}
#pragma mark - centerX
- (void)setYlb_centerX:(CGFloat)ylb_centerX {
    CGPoint center = self.center;
    center.x = ylb_centerX;
    self.center = center;
}
- (CGFloat)ylb_centerX {
    return self.center.x;
}
#pragma mark - centerY
- (void)setYlb_centerY:(CGFloat)ylb_centerY {
    CGPoint center = self.center;
    center.y = ylb_centerY;
    self.center = center;
}
- (CGFloat)ylb_centerY {
    return self.center.y;
}
#pragma mark - size
- (void)setYlb_size:(CGSize)ylb_size {
    CGRect frame = self.frame;
    frame.size = ylb_size;
    self.frame = frame;
}

- (CGSize)ylb_size {
    return self.frame.size;
}
#pragma mark - leftSpace
- (void)setYlb_leftSpace:(CGFloat)ylb_leftSpace {
    objc_setAssociatedObject(self, &ylb_leftSpace_key, @(ylb_leftSpace), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat)ylb_leftSpace {
    return [objc_getAssociatedObject(self, &ylb_leftSpace_key) floatValue];
}
#pragma mark - topSpace
- (void)setYlb_topSpace:(CGFloat)ylb_topSpace {
    objc_setAssociatedObject(self, &ylb_topSpace_key, @(ylb_topSpace), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat)ylb_topSpace {
    return [objc_getAssociatedObject(self, &ylb_topSpace_key) floatValue];
}
#pragma mark - rightSpace
- (void)setYlb_rightSpace:(CGFloat)ylb_rightSpace {
    objc_setAssociatedObject(self, &ylb_rightSpace_key, @(ylb_rightSpace), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat)ylb_rightSpace {
    return [objc_getAssociatedObject(self, &ylb_rightSpace_key) floatValue];
}
#pragma mark - bottomSpace
- (void)setYlb_bottomSpace:(CGFloat)ylb_bottomSpace {
    objc_setAssociatedObject(self, &ylb_bottomSpace_key, @(ylb_bottomSpace), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat)ylb_bottomSpace {
    return [objc_getAssociatedObject(self, &ylb_bottomSpace_key) floatValue];
}
#pragma mark - maxX
- (void)setYlb_maxX:(CGFloat)ylb_maxX {
    
}
- (CGFloat)ylb_maxX {
    return CGRectGetMaxX(self.frame);
}
#pragma mark - maxY
- (void)setYlb_maxY:(CGFloat)ylb_maxY {
    
}
- (CGFloat)ylb_maxY {
    return CGRectGetMaxY(self.frame);
}
#pragma mark - maxWidth
- (void)setYlb_maxWidth:(CGFloat)ylb_maxWidth {
    objc_setAssociatedObject(self, &ylb_maxWidth_key, @(ylb_maxWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat)ylb_maxWidth {
    return [objc_getAssociatedObject(self, &ylb_maxWidth_key) floatValue];
}
#pragma mark - 居中

- (void)ylb_becomeCenterInSuperView:(UIView *)superView {
    self.center = CGPointMake(superView.ylb_width/2.0, superView.ylb_height/2.0);
}

@end
