//
//  YLBHorizontalControl.h
//  YLBProUI_Example
//
//  Created by yulibo on 2020/4/19.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//struct YLBInset {
//    CGFloat leftSpace;
//    CGFloat topSapce;
//    CGFloat rightSpace;
//    CGFloat bottomSpace;
//};

@interface YLBHorizontalControl : UIControl
@property(nonatomic, strong) UILabel *ylbTitleLabel;
@property(nonatomic, strong) UIImageView *rightImageView;

- (instancetype)initWithFrame:(CGRect)frame
               titleLeftSpace:(CGFloat)titleLeftSpace
                  titleHeight:(CGFloat)titleHeight
                  middleSpace:(CGFloat)middleSpace
              imageRightSpace:(CGFloat)imageRightSpace
                   imageWidth:(CGFloat)imageWidth
                  imageHeight:(CGFloat)imageHeight;

- (void)resetFrame:(CGRect)frame
    titleLeftSpace:(CGFloat)titleLeftSpace
       titleHeight:(CGFloat)titleHeight
       middleSpace:(CGFloat)middleSpace
   imageRightSpace:(CGFloat)imageRightSpace
        imageWidth:(CGFloat)imageWidth
       imageHeight:(CGFloat)imageHeight;
@end

NS_ASSUME_NONNULL_END
