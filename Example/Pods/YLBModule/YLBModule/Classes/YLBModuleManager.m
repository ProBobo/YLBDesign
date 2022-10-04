//
//  YLBModuleManager.m
//  YLBModule
//
//  Created by yulibo on 2020/3/11.
//

#import "YLBModuleManager.h"

@interface YLBModuleManager ()

@property(nonatomic, strong) NSMutableArray *moduleArray;

@end

@implementation YLBModuleManager
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static YLBModuleManager *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}
#pragma mark - 初始化
- (NSMutableArray *)moduleArray {
    if (!_moduleArray) {
        _moduleArray = [@[] mutableCopy];
    }
    return _moduleArray;
}
//- (UIWindow *)window {
//    if (self.getUIWindow) {
//        return self.getUIWindow();
//    }
//    return nil;
//}
#pragma mark - 注册模块类
- (void)registerModuleClass:(Class)moduleClass {
    //注册的类不能为空
    if (!moduleClass) {
        return;
    }
    
    //必须实现协议，否则注册失败
    if (![moduleClass conformsToProtocol:@protocol(YLBModuleProtocol)]) {
        return;
    }
    
    id<YLBModuleProtocol>moduleInstance = [[moduleClass alloc] init];
    [self.moduleArray addObject:moduleInstance];
    
    //排序：升序
    [self.moduleArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        id<YLBModuleProtocol> moduleInstance1 = obj1;
        id<YLBModuleProtocol> moduleInstance2 = obj2;
        NSInteger modulePriority1 = 0;
        NSInteger modulePriority2 = 0;
        
        if ([moduleInstance1 respondsToSelector:@selector(ylb_modulePriority)]) {
            modulePriority1 = [moduleInstance1 ylb_modulePriority];
        }
        if ([moduleInstance2 respondsToSelector:@selector(ylb_modulePriority)]) {
            modulePriority2 = [moduleInstance2 ylb_modulePriority];
        }
        
        NSComparisonResult comparisonResult = NSOrderedSame;
        if (modulePriority1 < modulePriority2) {
            comparisonResult = NSOrderedAscending;
        }
        else if (modulePriority1 == modulePriority2) {
            comparisonResult = NSOrderedSame;
        }
        else if (modulePriority1 > modulePriority2) {
            comparisonResult = NSOrderedDescending;
        }
        return comparisonResult;
        
    }];
}
#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    BOOL result = YES;
    for (id<YLBModuleProtocol>moduleInstance in self.moduleArray) {
        if ([moduleInstance respondsToSelector:_cmd]) {
            result = [moduleInstance application:application didFinishLaunchingWithOptions:launchOptions];
        }
    }
    return result;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    for (id<YLBModuleProtocol>moduleInstance in self.moduleArray) {
        if ([moduleInstance respondsToSelector:_cmd]) {
            [moduleInstance applicationWillResignActive:application];
        }
    }
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    for (id<YLBModuleProtocol>moduleInstance in self.moduleArray) {
        if ([moduleInstance respondsToSelector:_cmd]) {
            [moduleInstance applicationDidEnterBackground:application];
        }
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    for (id<YLBModuleProtocol>moduleInstance in self.moduleArray) {
        if ([moduleInstance respondsToSelector:_cmd]) {
            [moduleInstance applicationWillEnterForeground:application];
        }
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    for (id<YLBModuleProtocol>moduleInstance in self.moduleArray) {
        if ([moduleInstance respondsToSelector:_cmd]) {
            [moduleInstance applicationDidBecomeActive:application];
        }
    }
}

- (void)applicationWillTerminate:(UIApplication *)application {
    for (id<YLBModuleProtocol>moduleInstance in self.moduleArray) {
        if ([moduleInstance respondsToSelector:_cmd]) {
            [moduleInstance applicationWillTerminate:application];
        }
    }
}

#pragma mark - 手动添加
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    for (id<YLBModuleProtocol>moduleInstance in self.moduleArray) {
        if ([moduleInstance respondsToSelector:_cmd]) {
            [moduleInstance applicationDidReceiveMemoryWarning:application];
        }
    }
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    
    BOOL result = YES;
    for (id<YLBModuleProtocol>moduleInstance in self.moduleArray) {
        if ([moduleInstance respondsToSelector:_cmd]) {
            result = [moduleInstance application:app openURL:url options:options];
        }
    }
    return result;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    for (id<YLBModuleProtocol>moduleInstance in self.moduleArray) {
        if ([moduleInstance respondsToSelector:_cmd]) {
            [moduleInstance application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
        }
    }
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    for (id<YLBModuleProtocol>moduleInstance in self.moduleArray) {
        if ([moduleInstance respondsToSelector:_cmd]) {
            [moduleInstance application:application didFailToRegisterForRemoteNotificationsWithError:error];
        }
    }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    for (id<YLBModuleProtocol>moduleInstance in self.moduleArray) {
        if ([moduleInstance respondsToSelector:_cmd]) {
            [moduleInstance application:application didReceiveRemoteNotification:userInfo];
        }
    }
}

// 静默推送必须实现此方法
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(nonnull void (^)(UIBackgroundFetchResult))completionHandler {
    for (id<YLBModuleProtocol>moduleInstance in self.moduleArray) {
        if ([moduleInstance respondsToSelector:_cmd]) {
            [moduleInstance application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
        }
    }
}
//iOS10以前的通知方法
- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void (^)(void))completionHandler {
    for (id<YLBModuleProtocol>moduleInstance in self.moduleArray) {
        if ([moduleInstance respondsToSelector:_cmd]) {
            [moduleInstance application:application handleActionWithIdentifier:identifier forRemoteNotification:userInfo completionHandler:completionHandler];
        }
    }
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 100000
//iOS10新增的方法：处理前台收到的通知
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler API_AVAILABLE(ios(10.0)) {
    for (id<YLBModuleProtocol>moduleInstance in self.moduleArray) {
        if ([moduleInstance respondsToSelector:_cmd]) {
            [moduleInstance userNotificationCenter:center willPresentNotification:notification withCompletionHandler:completionHandler];
        }
    }
}
//iOS10新增的方法：处理后台点击的通知
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler API_AVAILABLE(ios(10.0)) {
    for (id<YLBModuleProtocol>moduleInstance in self.moduleArray) {
        if ([moduleInstance respondsToSelector:_cmd]) {
            [moduleInstance userNotificationCenter:center didReceiveNotificationResponse:response withCompletionHandler:completionHandler];
        }
    }
}
#endif

@end
