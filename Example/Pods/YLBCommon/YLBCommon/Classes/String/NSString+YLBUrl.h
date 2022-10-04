//
//  NSString+YLBUrl.h
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/26.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YLBUrl)
+ (NSString*)urlEncode:(id<NSObject>)value;
+ (NSString *)urlDecode:(id<NSObject>)value;
@end

NS_ASSUME_NONNULL_END
