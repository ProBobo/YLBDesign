//
//  YLBServiceManager.h
//  YLBModule_Example
//
//  Created by yulibo on 2020/3/12.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLBServiceManager : NSObject
+ (instancetype)sharedInstance;

- (void)registerService:(Protocol *)service implClass:(Class)implClass;
- (id)createService:(Protocol *)service;
- (void)impService:(Protocol *)service target:(id)target;
- (NSMutableArray *)impOfProtocol:(Protocol *)service;
@end

NS_ASSUME_NONNULL_END
