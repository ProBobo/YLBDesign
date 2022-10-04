//
//  YLBDMineAppDelegate.m
//  YLBDMine
//
//  Created by 余礼钵 on 2022/10/4.
//

#import "YLBDMineAppDelegate.h"
#import <YLBModule/YLBModuleManager.h>
#import <YLBModule/YLBServiceManager.h>
#import <YLBDServices/YLBDMineProtocol.h>

@interface YLBDMineAppDelegate ()<YLBModuleProtocol>

@end

@implementation YLBDMineAppDelegate

+ (void)load {
    //注册模块
    [[YLBModuleManager sharedInstance] registerModuleClass:[self class]];
    
    //注册服务
    [[YLBServiceManager sharedInstance] registerService:@protocol(YLBDMineProtocol) implClass:NSClassFromString(@"YLBDMineController")];
}

- (NSInteger)ylb_modulePriority {
    return 1000;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    return YES;
}

@end
