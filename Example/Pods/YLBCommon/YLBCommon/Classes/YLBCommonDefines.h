//
//  YLBCommonDefines.h
//  YLBCommon
//
//  Created by yulibo on 2020/3/19.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#ifndef YLBCommonDefines_h
#define YLBCommonDefines_h


#pragma mark - 判断是否为iPhoneX

#ifdef __IPHONE_11_0

// 判断是否为iPhone X 系列，这样写消除在Xcode10上的警告。
#define YLB_IPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

#else

#define YLB_IPHONE_X NO

#endif

#pragma mark - 判断系统版本
#define YLBDeviceVersion [[[UIDevice currentDevice] systemVersion] floatValue]

#pragma mark - 导航栏高度

// 状态栏高度
//#define YLBStatusBarHeight UIApplication.sharedApplication.statusBarFrame.size.height
#define YLBStatusBarHeight \
({\
float statusBarHeight = 0;\
if (@available(iOS 13.0, *)) {\
    if (@available(iOS 15.0, *)) {\
        NSSet *set = [[UIApplication sharedApplication] connectedScenes];\
        UIWindowScene *windowScene = [set anyObject];\
        UIStatusBarManager *statusBarManager =  windowScene.statusBarManager;\
        statusBarHeight = statusBarManager.statusBarFrame.size.height;\
    }\
    else {\
        UIStatusBarManager *statusBarManager = [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager;\
        statusBarHeight = statusBarManager.statusBarFrame.size.height;\
    }\
}\
else {\
    statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;\
}\
statusBarHeight;\
})
// 导航栏高度
#define YLBNavigationBarHeight 44
// 底部栏高度
#define YLBTabBarHeight (YLB_IPHONE_X ? (49 + 34) : 49)

// 打印日志
#ifdef DEBUG //测试环境
#define YLBDLog(fmt,...) NSLog((@"%s [gLine %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else //生产环境
#define YLBDLog(...)
#endif

//防止字符串为nil
#define YLB_PROTECT_STR(x) (x == nil ? @"" : x)
#define YLB_CHANG_TO_STR(x) [NSString stringWithFormat:@"%@",x]

#pragma mark - iPhone屏幕宽高
// 屏幕宽度
#define YLB_SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
// 屏幕高度
#define YLB_SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#pragma mark - 颜色
// RGBA颜色
#define YLBRGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(1.0)]
// RGBA颜色
#define YLBRGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
// 随机颜色
#define YLBRandomColor YLBRGBAColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), 1)
// 十六进制颜色
#define YLBHexColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
// 十六进制颜色，带透明值
#define YLBHexAColor(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

#endif /* YLBCommonDefines_h */
