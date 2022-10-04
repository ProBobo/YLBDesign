//
//  YLBImageButton.m
//  YLBProUI_Example
//
//  Created by yulibo on 2020/3/27.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "YLBImageButton.h"

@interface YLBImageButton ()
@property(nonatomic, assign) CGRect buttonRect;
@property(nonatomic, assign) CGRect imageViewRect;

@end

@implementation YLBImageButton

#pragma mark - dealloc
- (void)dealloc {
    
}

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupCurrentView];
    }
    return self;
}

- (void)setupCurrentView {
    [super setupCurrentView];
    _ylbImageView = [[UIImageView alloc] init];
    _ylbImageView.userInteractionEnabled = NO;
    [self addSubview:_ylbImageView];
}

#pragma mark - 设置UI
- (void)layoutSubviews {
    [super layoutSubviews];
    
}

#pragma mark - 设置button和imageView的坐标
- (void)setButtonRect:(CGRect)buttonRect imageViewRect:(CGRect)imageViewRect {
    _buttonRect = buttonRect;
    _imageViewRect = imageViewRect;
    
    self.frame = _buttonRect;
    _ylbImageView.frame = _imageViewRect;;
}

@end
