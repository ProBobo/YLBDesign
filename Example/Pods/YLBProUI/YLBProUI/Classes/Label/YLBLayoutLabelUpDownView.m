//
//  YLBLayoutLabelUpDownView.m
//  YLBProUI_Example
//
//  Created by yulibo on 2020/4/14.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "YLBLayoutLabelUpDownView.h"
#import <YLBCommon/YLBCommon.h>
@interface YLBLayoutLabelUpDownView ()
@property(nonatomic, assign) CGFloat topSpace;
@property(nonatomic, assign) CGFloat topLabelHeight;
@property(nonatomic, assign) CGFloat middleSpace;
@property(nonatomic, assign) CGFloat bottomLabelHeight;
@end

@implementation YLBLayoutLabelUpDownView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)createUpDownLabelViewWithFrame:(CGRect)frame topSpace:(CGFloat)topSpace topLabelHeight:(CGFloat)topLabelHeight middleSpace:(CGFloat)middleSpace bottomLabelHeight:(CGFloat)bottomLabelHeight {
    YLBLayoutLabelUpDownView *upDwonView = [[YLBLayoutLabelUpDownView alloc] initWithFrame:frame topSpace:(CGFloat)topSpace topLabelHeight:topLabelHeight middleSpace:middleSpace bottomLabelHeight:bottomLabelHeight];
    return upDwonView;
}

- (instancetype)initWithFrame:(CGRect)frame topSpace:(CGFloat)topSpace topLabelHeight:(CGFloat)topLabelHeight middleSpace:(CGFloat)middleSpace bottomLabelHeight:(CGFloat)bottomLabelHeight {
    self = [super initWithFrame:frame];
    if (self) {
        self.topSpace = topSpace;
        self.topLabelHeight = topLabelHeight;
        self.middleSpace = middleSpace;
        self.bottomLabelHeight = bottomLabelHeight;
        [self setupUpDownLabels];
        [self setupUpDownSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUpDownLabels];
    }
    return self;
}

- (void)resetWithFrame:(CGRect)frame topSpace:(CGFloat)topSpace topLabelHeight:(CGFloat)topLabelHeight middleSpace:(CGFloat)middleSpace bottomLabelHeight:(CGFloat)bottomLabelHeight {
    self.topSpace = topSpace;
    self.topLabelHeight = topLabelHeight;
    self.middleSpace = middleSpace;
    self.bottomLabelHeight = bottomLabelHeight;
    self.frame = frame;
    
    _topLabel.frame = CGRectMake(0, self.topSpace, self.ylb_width, self.topLabelHeight);
    _bottomLabel.frame = CGRectMake(0, _topLabel.ylb_maxY + self.middleSpace, self.ylb_width, self.bottomLabelHeight);
}

- (void)setupUpDownLabels {
    _topLabel = [[UILabel alloc] init];
    _topLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_topLabel];
    
    _bottomLabel = [[UILabel alloc] init];
    _bottomLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_bottomLabel];
}

- (void)setupUpDownSubviews {
    _topLabel.frame = CGRectMake(0, self.topSpace, self.ylb_width, self.topLabelHeight);
    _bottomLabel.frame = CGRectMake(0, _topLabel.ylb_maxY + self.middleSpace, self.ylb_width, self.bottomLabelHeight);
    
}

@end
