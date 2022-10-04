//
//  YLBLabelImageButton.m
//  YLBProUI_Example
//
//  Created by yulibo on 2020/3/26.
//  Copyright © 2020 ProBobo. All rights reserved.
//

#import "YLBLabelImageButton.h"

@interface YLBLabelImageButton ()
@property(nonatomic, assign) CGRect buttonRect;
@property(nonatomic, assign) CGRect imageViewRect;
@property(nonatomic, assign) CGRect titleRect;
@end

@implementation YLBLabelImageButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupCurrentView];
    }
    return self;
}

- (void)setupCurrentView {
    [super setupCurrentView];
    
    _ylbTitleLabel = [[UILabel alloc] init];
    _ylbTitleLabel.userInteractionEnabled = NO;
    [self addSubview:_ylbTitleLabel];
    
    _ylbImageView = [[UIImageView alloc] init];
    _ylbImageView.userInteractionEnabled = NO;
    [self addSubview:_ylbImageView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

- (void)setButtonRect:(CGRect)buttonRect titleRect:(CGRect)titleRect imageViewRect:(CGRect)imageViewRect {
    _buttonRect = buttonRect;
    _titleRect = titleRect;
    _imageViewRect = imageViewRect;
    
    self.frame = _buttonRect;
    _ylbTitleLabel.frame = _titleRect;
    _ylbImageView.frame = _imageViewRect;
}
@end
