//
//  YLBHorizontalControl.m
//  YLBProUI_Example
//
//  Created by yulibo on 2020/4/19.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "YLBHorizontalControl.h"
#import <YLBCommon/YLBCommon.h>

@interface YLBHorizontalControl ()
@property(nonatomic, assign) CGFloat titleLeftSpace;
@property(nonatomic, assign) CGFloat titleHeight;
@property(nonatomic, assign) CGFloat imageEdgeInsets;
@property(nonatomic, assign) CGFloat middleSpace;
@property(nonatomic, assign) CGFloat imageRightSpace;
@property(nonatomic, assign) CGFloat imageWidth;
@property(nonatomic, assign) CGFloat imageHeight;
@end

@implementation YLBHorizontalControl

- (instancetype)initWithFrame:(CGRect)frame
               titleLeftSpace:(CGFloat)titleLeftSpace
                  titleHeight:(CGFloat)titleHeight
                  middleSpace:(CGFloat)middleSpace
              imageRightSpace:(CGFloat)imageRightSpace
                   imageWidth:(CGFloat)imageWidth
                  imageHeight:(CGFloat)imageHeight {
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLeftSpace = titleLeftSpace;
        self.titleLeftSpace = titleHeight;
        self.middleSpace = middleSpace;
        self.imageRightSpace = imageRightSpace;
        self.imageWidth = imageWidth;
        self.imageHeight = imageHeight;
        [self setupHorizontalControlSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupHorizontalControlSubviews];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _rightImageView.frame = CGRectMake(self.ylb_width - self.imageRightSpace - self.imageWidth, 0, self.imageWidth, self.imageHeight);
    _rightImageView.ylb_centerY = self.ylb_height/2.0;
    
    self.ylbTitleLabel.frame = CGRectMake(self.titleLeftSpace, 0, self.ylb_width - self.titleLeftSpace - self.imageRightSpace - self.imageWidth - self.middleSpace, self.titleHeight);
    self.ylbTitleLabel.ylb_centerY = self.ylb_height/2.0;
    
}

- (void)setupHorizontalControlSubviews {
    _ylbTitleLabel = [[UILabel alloc] init];
    [self addSubview:_ylbTitleLabel];
    
    _rightImageView = [[UIImageView alloc] init];
    [self addSubview:_rightImageView];
}

- (void)resetFrame:(CGRect)frame
               titleLeftSpace:(CGFloat)titleLeftSpace
                  titleHeight:(CGFloat)titleHeight
                  middleSpace:(CGFloat)middleSpace
              imageRightSpace:(CGFloat)imageRightSpace
                   imageWidth:(CGFloat)imageWidth
                  imageHeight:(CGFloat)imageHeight {
    self.frame = frame;
    self.titleLeftSpace = titleLeftSpace;
    self.titleHeight = titleHeight;
    self.middleSpace = middleSpace;
    self.imageRightSpace = imageRightSpace;
    self.imageWidth = imageWidth;
    self.imageHeight = imageHeight;
    
    _rightImageView.frame = CGRectMake(self.ylb_width - self.imageRightSpace - self.imageWidth, 0, self.imageWidth, self.imageHeight);
    _rightImageView.ylb_centerY = self.ylb_height/2.0;
    
    self.ylbTitleLabel.frame = CGRectMake(self.titleLeftSpace, 0, self.ylb_width - self.titleLeftSpace - self.imageRightSpace - self.imageWidth - self.middleSpace, self.titleHeight);
    self.ylbTitleLabel.ylb_centerY = self.ylb_height/2.0;
    
}

@end
