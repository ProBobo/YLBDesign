//
//  YLBDDetailAppDelegate.m
//  YLBDDetail
//
//  Created by 余礼钵 on 2022/10/4.
//

#import "YLBDDetailAppDelegate.h"
#import <YLBModule/YLBModuleManager.h>
#import <YLBModule/YLBServiceManager.h>
#import <YLBDServices/YLBDDetailProtocol.h>

@interface YLBDDetailAppDelegate ()<YLBModuleProtocol>

@end

@implementation YLBDDetailAppDelegate

+ (void)load {
    //注册模块
    [[YLBModuleManager sharedInstance] registerModuleClass:[self class]];
    
    //注册服务
    [[YLBServiceManager sharedInstance] registerService:@protocol(YLBDDetailProtocol) implClass:NSClassFromString(@"YLBDDetailController")];
}

- (NSInteger)ylb_modulePriority {
    return 1000;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    return YES;
}

@end
