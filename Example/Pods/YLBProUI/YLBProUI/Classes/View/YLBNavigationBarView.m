//
//  YLBNavigationBarView.m
//  YLBProUI_Example
//
//  Created by yulibo on 2020/9/27.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "YLBNavigationBarView.h"
#import <YLBCommon/YLBCommon.h>

@implementation YLBNavigationBarView

+ (instancetype)createView {
    YLBNavigationBarView *bar = [[YLBNavigationBarView alloc] init];
    bar.frame = CGRectMake(0, 0, YLB_SCREEN_WIDTH, YLBStatusBarHeight + YLBNavigationBarHeight);
    return bar;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    
    self.backgroundColor = UIColor.whiteColor;
    
    _leftButton = [[UIButton alloc] init];
    _leftButton.backgroundColor = UIColor.clearColor;
//    [_leftButton setImage:[UIImage imageNamed:@"arrow_left"] forState:UIControlStateNormal];
    [self addSubview:_leftButton];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.backgroundColor = UIColor.clearColor;
    _titleLabel.font = [UIFont boldSystemFontOfSize:18];
    _titleLabel.textColor = YLBHexColor(0x333333);
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLabel];
    
    _rightButton = [[UIButton alloc] init];
    _rightButton.backgroundColor = UIColor.clearColor;
    [self addSubview:_rightButton];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _leftButton.frame = CGRectMake(0, YLBStatusBarHeight, YLBNavigationBarHeight, YLBNavigationBarHeight);
    _titleLabel.frame = CGRectMake(_leftButton.ylb_maxX, YLBStatusBarHeight, YLB_SCREEN_WIDTH - YLBNavigationBarHeight * 2, YLBNavigationBarHeight);
    _titleLabel.ylb_centerX = self.ylb_width / 2.0;
    _rightButton.frame = CGRectMake(YLB_SCREEN_WIDTH - YLBNavigationBarHeight, YLBStatusBarHeight, YLBNavigationBarHeight, YLBNavigationBarHeight);
}

@end
