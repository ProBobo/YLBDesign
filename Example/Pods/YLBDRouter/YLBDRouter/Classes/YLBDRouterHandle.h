//
//  YLBDRouterHandle.h
//  JLRoutes
//
//  Created by 余礼钵 on 2022/10/4.
//

#import <Foundation/Foundation.h>
#import "YLBDRouterConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface YLBDRouterHandle : NSObject
+ (void)registerRouterWithScheme:(NSString *)scheme;
@end

NS_ASSUME_NONNULL_END
