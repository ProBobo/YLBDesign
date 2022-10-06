//
//  YLBDesignAppDelegate.m
//  YLBDesign
//
//  Created by 余礼钵 on 2022/10/4.
//

#import "YLBDesignAppDelegate.h"
#import <YLBModule/YLBModuleManager.h>
#import <YLBModule/YLBServiceManager.h>
#import <YLBDServices/YLBDHomeProtocol.h>
#import <YLBDServices/YLBDRouterProtocol.h>

#import "YLBDesignTabBarController.h"

@interface YLBDesignAppDelegate ()<YLBModuleProtocol>

@end

@implementation YLBDesignAppDelegate
+ (void)load {
    //注册模块
    [[YLBModuleManager sharedInstance] registerModuleClass:[self class]];
    
    //注册服务
    
    //路由服务
    [[YLBServiceManager sharedInstance] registerService:@protocol(YLBDRouterProtocol) implClass:NSClassFromString(@"YLBDRouterHandle")];
}

- (NSInteger)ylb_modulePriority {
    return 500;//不同的模块返回的值可以不同，数值越小越先加载
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //设置根视图
    YLBDesignTabBarController *tabBarVC = [[YLBDesignTabBarController alloc] init];
    UIApplication.sharedApplication.delegate.window.rootViewController = tabBarVC;
    
    return YES;
}

@end
