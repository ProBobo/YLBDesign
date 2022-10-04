//
//  YLBLabelImageButton.h
//  YLBProUI_Example
//
//  Created by yulibo on 2020/3/26.
//  Copyright © 2020 ProBobo. All rights reserved.
//

#import "YLBBaseButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface YLBLabelImageButton : YLBBaseButton
@property(nonatomic, strong) UILabel *ylbTitleLabel;
@property(nonatomic, strong) UIImageView *ylbImageView;

- (void)setButtonRect:(CGRect)buttonRect titleRect:(CGRect)titleRect imageViewRect:(CGRect)imageViewRect;
@end

NS_ASSUME_NONNULL_END
