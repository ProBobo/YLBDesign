//
//  YLBBundleManager.h
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/28.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLBBundleManager : NSObject

/**

 注册Pod编译后产生的Bundle路径
 
 @param aClass 当前的类，传[self class]即可
 @param podName 编译后Pod库产生的bundle名称（对应Pod库的名称），例如Pod的名称为YLBResource，对应的podName名称就是YLBResource
 */
- (NSBundle *)ylb_rigisterBundleForClass:(Class)aClass URLForResource:(NSString *)podName;
/**
 获取bundle
 */
- (NSBundle *)ylb_bundle;
@end

NS_ASSUME_NONNULL_END
