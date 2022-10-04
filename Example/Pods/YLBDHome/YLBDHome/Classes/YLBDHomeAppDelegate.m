//
//  YLBDHomeAppDelegate.m
//  YLBDServices
//
//  Created by 余礼钵 on 2022/10/4.
//

#import "YLBDHomeAppDelegate.h"
#import <YLBModule/YLBModuleManager.h>
#import <YLBModule/YLBServiceManager.h>
#import <YLBDServices/YLBDHomeProtocol.h>

@interface YLBDHomeAppDelegate ()<YLBModuleProtocol>

@end

@implementation YLBDHomeAppDelegate

+ (void)load {
    //注册模块
    [[YLBModuleManager sharedInstance] registerModuleClass:[self class]];
    
    //注册服务
    [[YLBServiceManager sharedInstance] registerService:@protocol(YLBDHomeProtocol) implClass:NSClassFromString(@"YLBDHomeController")];
}

- (NSInteger)ylb_modulePriority {
    return 1000;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    return YES;
}

@end
