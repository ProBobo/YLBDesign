//
//  YLBDRouterHandle.m
//  JLRoutes
//
//  Created by 余礼钵 on 2022/10/4.
//

#import "YLBDRouterHandle.h"

#import <JLRoutes/JLRoutes.h>
//#import <YLBCommon/YLBCommon.h>

#define YLBDIsString(s) !((s == nil || [s isKindOfClass:[NSNull class]] || ([s isKindOfClass:[NSString class]] && s.length == 0)))

@implementation YLBDRouterHandle

+ (void)load {
//    [self registerRouteWithScheme:scheme];
    //自动注册
    NSDictionary *dict;
    dict = [YLBDRouterHandle obtainJson];//读取json配置文件
    NSString *scheme = dict[@"scheme"];
    [YLBDRouterHandle registerRouterWithScheme:scheme];
}

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static YLBDRouterHandle *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}

+ (NSDictionary *)pathOfCalassName {
    NSDictionary *dict;
    dict = [self obtainJson];
    return dict;
}

+ (void)registerRouterWithScheme:(NSString *)scheme {
    //正常跳转
    [JLRoutes routesForScheme:scheme][@"/:host/:path"] = ^BOOL(NSDictionary *parameters) {
        [self handleRouter:parameters];
        return YES;
    };
    
    //注册返回上层页面 Router, 使用 [JLRoutes openURL:kYLBDVCRouteSegueBack] 返回上一页 或 [JLRoutes openURL:kYLBDVCRouteSegueBack parameters:@{kYLBDVCRouteBackIndex: @(2)}]  返回前两页
    [[JLRoutes routesForScheme:scheme] addRoute:kYLBDVCRouteSegueBack handler:^BOOL(NSDictionary * _Nonnull parameters) {
        return [self backRouterParameters:parameters];
    }];
    
    [[JLRoutes routesForScheme:scheme] addRoute:kYLBDVCRouteIndexRoot handler:^BOOL(NSDictionary * _Nonnull parameters) {
        return [self backRouterParameters:parameters];
    }];
    
}

+ (void)handleRouter:(NSDictionary *)params {
    NSString *path = params[@"path"];
    //判断是否为空
    if (path.length > 0) {
        //tab底部栏
        if ([path isEqualToString:kYLBDHome] || [path isEqualToString:kYLBDMine]) {
            [self selectedTabBarParams:params];
        }
        else {//默认跳转vc
            [self skipToVCParams:params];
        }
    }
}

#pragma mark - 跳转vc
+ (void)skipToVCParams:(NSDictionary *)params {
    NSString *path = params[@"path"];
    //判断是否为空
    if (path.length > 0) {
        NSString *className = [self pathOfCalassName][path];
        if (className.length > 0) {
            [self routerClassName:className parameters:params];
        }
    }
}

#pragma mark - 切换tab底部栏
+ (void)selectedTabBarParams:(NSDictionary *)params {
    NSString *path = params[@"path"];
    //判断是否为空
    if (path.length > 0) {
        //说明是首页tab底部栏页面
        if ([path isEqualToString:kYLBDHome]) {
            [self selectedTabBarParams:params index:0];
        }
        if ([path isEqualToString:kYLBDMine]) {
            UITabBarController* tabBarVC = (UITabBarController* )[self YLBDController];
            if ([tabBarVC isKindOfClass:[UITabBarController class]] && index >= 0 && tabBarVC.viewControllers.count >= 1) {
                NSInteger index = tabBarVC.viewControllers.count - 1;
                [self selectedTabBarParams:params index:index];
            }
        }
    }
}

+ (void)selectedTabBarParams:(NSDictionary *)params index:(NSInteger)index {
    // 处理 UITabBarControllerIndex 切换;
    UITabBarController* tabBarVC = (UITabBarController* )[self YLBDController];
    if ([tabBarVC isKindOfClass:[UITabBarController class]] && index >= 0 && tabBarVC.viewControllers.count >= index) {
        UIViewController* indexVC = tabBarVC.viewControllers[index];
        if ([indexVC isKindOfClass:[UINavigationController class]]) {
            indexVC = ((UINavigationController *)indexVC).topViewController;
        }
        //传参
        [self setupParams:params vc:indexVC];
        tabBarVC.selectedIndex = index;
    }
}

#pragma mark - 查找VC
+ (UIViewController *)YLBDController {
    return UIApplication.sharedApplication.delegate.window.rootViewController;
}

+ (UIViewController *)YLBDFindVisibleViewController {

    UIViewController* currentViewController = [self YLBDController];

    BOOL runLoopFind = YES;
    while (runLoopFind) {
        if (currentViewController.presentedViewController) {
            currentViewController = currentViewController.presentedViewController;
        } else {
            if ([currentViewController isKindOfClass:[UINavigationController class]]) {
                currentViewController = ((UINavigationController *)currentViewController).visibleViewController;
            } else if ([currentViewController isKindOfClass:[UITabBarController class]]) {
                currentViewController = ((UITabBarController* )currentViewController).selectedViewController;
            } else {
                break;
            }
        }
    }

    return currentViewController;
}

#pragma mark - 对VC参数进行赋值
+ (void)setupParams:(NSDictionary *)params vc:(UIViewController* )vc {
    
    for (NSString *key in params.allKeys) {
        BOOL hasKey = [vc respondsToSelector:NSSelectorFromString(key)];
        BOOL notNil = params[key] != nil;
        if (hasKey && notNil) {
            [vc setValue:params[key] forKey:key];
        }
    };
}

#pragma mark - Router处理
// 当查找到指定 Router 时, 触发路由回调逻辑; 找不到已注册 Router 则直接返回 NO; 如需要的话, 也可以在这里注册一个全局未匹配到 Router 执行的回调进行异常处理;
+ (BOOL)routerClassName:(NSString *)className parameters:(NSDictionary* )parameters {
    //统一初始化控制器,传参和跳转;
    UIViewController* vc = [self vcWithClassName:className parameters: parameters];
    if (vc) {
        [self routerToVC:vc parameters:parameters];
        return YES;
    } else {
        return NO;
    }
}
// 根据 Router 映射到的类名实例化控制器;
+ (UIViewController *)vcWithClassName:(NSString *)className parameters:(NSDictionary* )parameters {
    
    id vc = [[NSClassFromString(className) alloc] init];
    if (![vc isKindOfClass:[UIViewController class]]) {
        vc = nil;
    }
    //参数赋值
    [self setupParams:parameters vc:vc];
    
    return vc;
}

+ (UIViewController *)vcWithClassName:(NSString *)className {
    id vc = [self vcWithClassName:className parameters:@{}];
    return vc;
}

// 跳转和参数设置;
+ (void)routerToVC:(UIViewController *)vc parameters:(NSDictionary *)parameters {
    
    UIViewController* currentVC = [self YLBDFindVisibleViewController];
    NSString *segue = parameters[kYLBDVCRouteSegue] ? parameters[kYLBDVCRouteSegue] : kYLBDVCRouteSeguePush; //  决定 present 或者 Push; 默认值 Push
    BOOL animated = parameters[kYLBDVCRouteAnimated] ? [parameters[kYLBDVCRouteAnimated] boolValue] : YES;  // 转场动画;
//    YLBDLog(@"%s 跳转: %@ %@ %@",__func__ ,currentVC, segue,vc);
    
    if ([segue isEqualToString:kYLBDVCRouteSeguePush]) { //PUSH
        if (currentVC.navigationController) {
            NSString *backIndexString = [NSString stringWithFormat:@"%@",parameters[kYLBDVCRouteBackIndex]];
            UINavigationController* nav = currentVC.navigationController;
            if ([backIndexString isEqualToString:kYLBDVCRouteIndexRoot]) {
                NSMutableArray *vcs = [NSMutableArray arrayWithObject:nav.viewControllers.firstObject];
                [vcs addObject:vc];
                [nav setViewControllers:vcs animated:animated];
                
            } else if ([backIndexString integerValue] && [backIndexString integerValue] < nav.viewControllers.count) {
                //移除掉指定数量的 VC, 在Push;
                NSMutableArray *vcs = [nav.viewControllers mutableCopy];
                [vcs removeObjectsInRange:NSMakeRange(vcs.count - [backIndexString integerValue], [backIndexString integerValue])];
                nav.viewControllers = vcs;
                [nav pushViewController:vc animated:YES];
            } else {
                [nav pushViewController:vc animated:animated];
                nav.hidesBottomBarWhenPushed = YES;
            }
        }
        else { //由于无导航栏, 直接执行 Modal
            BOOL needNavigation = parameters[kYLBDVCRouteSegueNeedNavigation] ? NO : YES;
            if (needNavigation) {
                UINavigationController* navigationVC = [[UINavigationController alloc] initWithRootViewController:vc];
                //vc.modalPresentationStyle = UIModalPresentationFullScreen;
                [currentVC presentViewController:navigationVC animated:YES completion:nil];
            }
            else {
                //vc.modalPresentationStyle = UIModalPresentationFullScreen;
                [currentVC presentViewController:vc animated:animated completion:nil];
            }
        }
    }
    else { //Modal
        BOOL needNavigation = parameters[kYLBDVCRouteSegueNeedNavigation] ? parameters[kYLBDVCRouteSegueNeedNavigation] : NO;
        if (needNavigation) {
            UINavigationController* navigationVC = [[UINavigationController alloc] initWithRootViewController:vc];
            //vc.modalPresentationStyle = UIModalPresentationFullScreen;
            [currentVC presentViewController:navigationVC animated:animated completion:nil];
        }
        else {
            //vc.modalPresentationStyle = UIModalPresentationFullScreen;
            [currentVC presentViewController:vc animated:animated completion:nil];
        }
    }
}

#pragma mark - 返回上层页面回调;
+ (BOOL)backRouterParameters:(NSDictionary *)parameters {
    BOOL animated = parameters[kYLBDVCRouteAnimated] ? [parameters[kYLBDVCRouteAnimated] boolValue] : YES;
    NSString *backIndexString = parameters[kYLBDVCRouteBackIndex] ? [NSString stringWithFormat:@"%@",parameters[kYLBDVCRouteBackIndex]] : nil;  // 指定返回个数, 优先处理此参数;
    id backPage = parameters[kYLBDVCRouteBackPage] ? parameters[kYLBDVCRouteBackPage] : nil; // 指定返回到某个页面,
    if (backPage) {
        backPage = [self pathOfCalassName][backPage];//将key转化成对应的vc名称
    }
    NSInteger backPageOffset = parameters[kYLBDVCRouteBackPageOffset] ? [parameters[kYLBDVCRouteBackPageOffset] integerValue] : 0; // 指定返回到的页面并进行偏移;
    UIViewController* visibleVC = [self YLBDFindVisibleViewController];
    UINavigationController* navigationVC = visibleVC.navigationController;
    if (navigationVC) {
        // 处理 pop 按索引值处理;
        if (YLBDIsString(backIndexString)) {
            if ([backIndexString isEqualToString:kYLBDVCRouteIndexRoot]) {//返回根
                [navigationVC popToRootViewControllerAnimated:animated];
            }
            else {
                NSUInteger backIndex = backIndexString.integerValue;
                NSMutableArray* vcs = navigationVC.viewControllers.mutableCopy;
                if (vcs.count > backIndex) {
                    [vcs removeObjectsInRange:NSMakeRange(vcs.count - backIndex, backIndex)];
                    [navigationVC setViewControllers:vcs animated:animated];
                    return YES;
                }
                else {
                    return NO; //指定返回索引值超过当前导航控制器包含的子控制器;
                }
            }
        }
        else if (backPage) { //处理返回指定的控制器, 可以处理
            NSMutableArray *vcs = navigationVC.viewControllers.mutableCopy;
            NSInteger pageIndex = NSNotFound;
            //页面标识为字符串
            if ([backPage isKindOfClass:[NSString class]]) {
                for (int i=0; i<vcs.count; i++) {
                    if ([vcs[i] isKindOfClass:NSClassFromString(backPage)]) {
                        pageIndex = i;
                        break;
                    }
                }
            }
            //页面标识为vc实例
            else if ([backPage isKindOfClass:[UIViewController class]]) {
                for (int i=0; i<vcs.count; i++) {
                    if (vcs[i] == backPage) {
                        pageIndex = i;
                        break;
                    }
                }
            }
            //有指定页面，根据参数跳转
            if (pageIndex != NSNotFound) {
                NSUInteger backIndex = (vcs.count-1) - pageIndex + backPageOffset;
                if (vcs.count > backIndex) {
                    [vcs removeObjectsInRange:NSMakeRange(vcs.count-backIndex, backIndex)];
                    [navigationVC setViewControllers:vcs animated:animated];
                    return YES;
                }
            }
            //指定页面不存在，return NO，可用于判断当前vc栈里有没有当前页面。
        }
        else {
            [navigationVC popViewControllerAnimated:animated];
            return YES;
        }
    }
    else {
        [visibleVC dismissViewControllerAnimated:animated completion:nil];
        return YES;
    }
    return NO;
}

#pragma mark - 读取json文件
- (NSDictionary *)obtainJson {
    return [YLBDRouterHandle obtainJson];
}

+ (NSDictionary *)obtainJson {
//    NSString *mainBundleDirectory = [[NSBundle mainBundle] bundlePath];
//    NSString *path =[mainBundleDirectory stringByAppendingPathComponent:@".json"];
//    NSURL *url = [NSURL fileURLWithPath:path];
//    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
//    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//    YLBDLog(@"%@",dic);
    NSDictionary *dict = [self readLocalFileWithName:@"ClassName"];
//    YLBDLog(@"%@",dict);
    return dict;
}

+ (NSDictionary *)readLocalFileWithName:(NSString *)name {
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

@end
