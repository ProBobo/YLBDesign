//
//  NSString+YLBVersion.h
//  YLBCommon_Example
//
//  Created by yulibo on 2020/6/4.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YLBVersion)
/**
 功能：版本判断
 版本格式：1.2.1
 例如：1.1.2和1.2.1.3比较版本
 */
+ (BOOL)isNeedUpdateVersion:(NSString *)localVersion latestVersion:(NSString *)latestVersion;
@end

NS_ASSUME_NONNULL_END
