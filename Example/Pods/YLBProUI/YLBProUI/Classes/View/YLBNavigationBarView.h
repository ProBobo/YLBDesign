//
//  YLBNavigationBarView.h
//  YLBProUI_Example
//
//  Created by yulibo on 2020/9/27.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLBNavigationBarView : UIView
@property(nonatomic, strong) UIButton *leftButton;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UIButton *rightButton;
+ (instancetype)createView;
@end

NS_ASSUME_NONNULL_END
