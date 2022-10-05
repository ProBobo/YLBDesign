# YLBDesign

## Author

余礼钵

## License

YLBDesign is available under the MIT license. See the LICENSE file for more info.

# YLBDesign架构：从开发到跨端架构师，实现iOS开发对Android进行跨端开发，一套代码多端使用。

本文架构由作者本人经过多年对架构的探索和理解，从理论依据到源代码实现，并在开发项目的实际应用中逐步完善，形成了一套对项目的组件化，模块的独立化，并且完全实现了插件化（热更新方案）的架构方案。特别是插件化（热更新）方案，会让人眼前一亮，可以`使iOS开发迅速转变为跨端开发，对移动端进行统一`。

# YLBDesign开源架构

YLBDesign项目：[https://github.com/ProBobo/YLBDesign](https://github.com/ProBobo/YLBDesign)

# 为什么开源

在作者看来，iOS架构因为资料少，所以大大增加了开发的掌握成本，所以普及率也不高。然而一些大型的项目或多或少需要解决一些代码复用和模块独立的问题。为了提升开发效率，架构在一些项目发展的后期就显得非常重要。因此，开源架构就有其现实意义。

对iOS架构，作者也进行了自己的思考：因为`架构不是一种单一的技术或者组件，而是一系列组件、模块、资源、理论的综合体`。因为需要把业务代码当作一个完整的管理对象，所以架构更像是`一个代码和资源的管理系统`。所以很多时候一些开源库只是实现了架构中的一部分功能，而不是全部内容。

# 前言

在此作者提供了iOS架构开源代码。让希望能掌握iOS架构的人少奋斗几年，迅速掌握，并实现跨端开发。

相信很多人在探索iOS架构的过程中都会发现没有现成的完整的开源架构方案，基本都是开源了一些可以实现架构的部分组件，而没有形成真正的可以完美解决项目模块化，热更新的方案。所以很多时候完美的架构方案还停留在理论阶段。

由于iOS架构并不是很普及，很多人甚至都没有听说过什么是iOS架构，对组件化和模块化更是一窍不通。当碰到项目需要掌握基本组件化能力的时候就会显得很被动。然而掌握组件化并不是一个很容易的过程，虽然它只是iOS架构开始的入门阶段。

最麻烦的事，可能是想要开始iOS架构，却发现相关的资料并不是很丰富，大部分都是探讨的内容。所以作者特意开源了代码。

# YLBDesign的架构组件

`架构组件是构成架构的具体代码基础。`
`架构包括：架构组件、业务模块组件、资源等。`

这里需要说明的是，`架构组件只是架构理论的一部分，可以是自研的组件，也可以是开源的组件。作为架构应该可以支持同类型功能的不同组件，实现架构组件的替换，所以架构还会一直发展和丰富。`作者尽量使用开源组件，因为作者相信现在的App基本都会使用开源库，因此可以实现无缝连接。当没有合适的开源组件可以使用时，作者会使用自研的开源组件。

**可以选择的组件**

模块通信：YLBModule、BeeHive
路由跳转：JLRoutes、MGJRouter
插件化(热更新)：小程序（[https://nativesupport.dcloud.net.cn/README](https://nativesupport.dcloud.net.cn/README)）、React Native、自研小程序语言、自研跨端语言

**YLBDesign使用的架构组件**

为了使作者的架构理论能完全实现，作者在参考BeeHive的基础上自研了YLBModule模块通信。
建议大家使用作者在YLBDesign中使用的架构组件，这样可以确保和作者所实现的效果一致，以免出现效果上的不一致而困惑。
作者所建立的iOS架构支持线上修复App页面问题，不需要每次修复问题都上线AppStore，小程序在这方面有天然优势（后期会对这方面做详细描述）。

模块通信：YLBModule（[https://github.com/ProBobo/YLBModule](https://github.com/ProBobo/YLBModule)）

路由跳转：JLRoutes（[https://github.com/joeldev/JLRoutes](https://github.com/joeldev/JLRoutes)）、YLBDRouter（[https://github.com/YuliboTeam/YLBDRouter](https://github.com/YuliboTeam/YLBDRouter)）

插件化(热更新)：小程序（[https://nativesupport.dcloud.net.cn/README](https://nativesupport.dcloud.net.cn/README)）

>说明：这里只有小程序没有进行组件化封装，而是使用官方文档进行集成，主要是为了便于理解，和官方文档保持一致。当然，要对小程序进行Pod组件化封装也是能做到的。由于uni-app提供的小程序依赖包太大，有1.6G，上传Github受到限制，当然下载也会很消耗时间。所以作者提供了小程序的集成链接：[https://nativesupport.dcloud.net.cn/README](https://nativesupport.dcloud.net.cn/README)。

**为什么使用uni-app的小程序**

引用牛顿的话：站在巨人的肩膀上。

作者受微信小程序和支付宝小程序启发，发现小程序作为App中web页面的替代品，支持在线更新，可以在架构中充当插件的角色，实现跨端开发。这时候又发现uni-app支持App集成小程序，所以采用了uni-app的小程序。按照uni-app的说法，uni-app先于微信开发出了小程序。
>[uni-app官网原话：很多人以为小程序是微信先推出的，其实，DCloud才是这个行业的开创者。](https://uniapp.dcloud.net.cn/history.html)

App小程序可以快速转化为微信小程序或者支付宝小程序等：小程序作为一个独立开发的语言，应用也非常广泛，掌握以后不仅可以在iOS、Android端使用，也可以独立开发小程序。uni-app还支持发布为前端web项目。

>这是关于uni-app的描述：开发者编写一套代码，可发布到iOS、Android、Web（响应式）、以及各种小程序（微信/支付宝/百度/头条/飞书/QQ/快手/钉钉/淘宝）、快应用等多个平台。

1、有完整的开发文档，容易掌握。
2、`一套代码，多端运行`。
2.1、支持在iOS端、Android端、H5端运行。
2.2、使用的是前端开发语言，可以进行跨端开发。
2.3、可以实现App小程序快速转化为微信、支付宝等主流小程序。
2.4、有独立的开发工具，可以独立修改小程序，无需编译iOS项目进行发版。
2.5、有自己的插件市场。
3、替代H5，优化用户体验。

# 模块通信：YLBModule

`YLBModule实现了模块通信以及模块消息回传。`
`每个模块都可以独立为一个App，模块和模块之间没有依赖关系。`
为了使模块具有App的能力，我们需要给模块设计生命周期，模块需要有自己的AppDelegate，并且模块间的通信需要通过`通信接口协议(protocol)`实现。

我们需要在模块的AppDelegate里面注册通信接口协议，同时需要指定`模块接口类`。即在AppDelegate中需要使`通信接口协议`和`模块接口类`相对应，这样通过通信接口协议就可以找到对应模块。

`通信接口协议`将会放在`YLBDServices组件`中。

**YLBModule使用说明**
>注意：YLBModule依赖库在YLBDBasePod组件中建立依赖关系，对YLBDBasePod进行依赖即可对YLBModule进行依赖。

1、主工程YLBDesign引入YLBModule依赖库（即对YLBDBasePod进行依赖）。
2、在主工程的AppDelegate中引入YLBAppDelegate.h文件，并继承YLBAppDelegate
```
@import UIKit;
#import <YLBModule/YLBAppDelegate.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate : YLBAppDelegate <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

NS_ASSUME_NONNULL_END
```
在didFinishLaunchingWithOptions里面调用super方法
```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    //super的位置决定当前AppDelegate的优先级是否最高，放在最底部表示当前AppDelegate优先级最高
    [super application:application didFinishLaunchingWithOptions:launchOptions];
    
    return YES;
}
```
3、创建首页模块YLBDHome，并引入YLBModule依赖库。
4、在YLBDHome中创建YLBDHomeAppDelegate，用于管理模块生命周期。
5、创建YLBDServices组件，并创建YLBDHomeProtocol协议文件。
6、注册模块：实现模块生命周期
```
[[YLBModuleManager sharedInstance] registerModuleClass:[self class]];
```
7、注册服务：通过服务协议可以找到服务类
```
[[YLBServiceManager sharedInstance] registerService:@protocol(YLBDHomeProtocol) implClass:NSClassFromString(@"YLBDHomeController")];
```
8、通过服务协议(YLBDHomeProtocol)获取服务类(YLBDHomeController)
```
//
//  YLBDesignTabBarController.m
//  YLBDesign
//
//  Created by 余礼钵 on 2022/10/2.
//

#import "YLBDesignTabBarController.h"
#import "YLBDesignNavigationController.h"

#import <YLBCommon/YLBCommon.h>
#import <YLBModule/YLBServiceManager.h>
#import <YLBDServices/YLBDHomeProtocol.h>
#import <YLBDServices/YLBDMineProtocol.h>

@interface YLBDesignTabBarController ()<UITabBarControllerDelegate>
@property(nonatomic, strong) NSMutableArray *childVCArray;
@end

@implementation YLBDesignTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    [self setUpChildViewController];
}

#pragma mark - 设置tab
- (void)setUpChildViewController {
    id<YLBDHomeProtocol> homeVC = [[YLBServiceManager sharedInstance] createService:@protocol(YLBDHomeProtocol)];
    UIImage *homeSelectImage = [UIImage imageNamed:@"icon_tabbar_uikit_selected"];
    UIImage *homeNormalImage= [UIImage imageNamed:@"icon_tabbar_uikit"];
    [self setUpChildController:(UIViewController *)homeVC image:homeSelectImage selectImage:homeNormalImage title:@"首页"];
    
    
    id<YLBDMineProtocol> mineVC = [[YLBServiceManager sharedInstance] createService:@protocol(YLBDMineProtocol)];
    UIImage *mineSelectImage = [UIImage imageNamed:@"icon_tabbar_lab_selected"];
    UIImage *mineNormalImage= [UIImage imageNamed:@"icon_tabbar_lab"];
    [self setUpChildController:(YLBDesignNavigationController *)mineVC image:mineSelectImage selectImage:mineNormalImage title:@"我的"];
    
    self.viewControllers = self.childVCArray;
}

- (void)setUpChildController:(UIViewController *)vc image:(UIImage *)image selectImage:(UIImage *)selectImage title:(NSString *)title {
    
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.badgeValue = nil;
    vc.tabBarItem.selectedImage = selectImage;
    
    YLBDesignNavigationController *navi = [[YLBDesignNavigationController alloc] initWithRootViewController:vc];
    [self.childVCArray addObject:navi];
    
}

- (NSMutableArray *)childVCArray {
    if (!_childVCArray) {
        _childVCArray = [@[] mutableCopy];
    }
    return _childVCArray;;
}

@end

```


# 业务模块组件

首页模块
`YLBDHome`

```
pod 'YLBDHome', :git =>'https://github.com/YuliboTeam/YLBDHome.git'
```

个人中心模块
`YLBDMine`

```
pod 'YLBDMine', :git => 'https://github.com/YuliboTeam/YLBDMine.git'
```

# 架构服务组件
```
pod 'YLBDServices', :git => 'https://github.com/YuliboTeam/YLBDServices.git'
```

# 业务基础组件

`YLBDBasePod`
```
pod 'YLBDBasePod', :git => 'https://github.com/YuliboTeam/YLBDBasePod.git'
```

# 使用的基础开源库
```
pod 'YLBCommon', :git =>'https://github.com/ProBobo/YLBCommon.git'
pod 'YLBProUI', :git => 'https://github.com/YuliboTeam/YLBProUI.git'
pod 'QMUIKit'
```

# 关于小程序的开发

1、uni小程序的应用资源集成方式

[https://nativesupport.dcloud.net.cn/UniMPDocs/UseSdk/ios?id=uni小程序的应用资源集成方式](https://nativesupport.dcloud.net.cn/UniMPDocs/UseSdk/ios?id=uni小程序的应用资源集成方式)

生成的 uni小程序 wgt 资源包可以部署到远程服务器动态下发也可以直接内置到工程中。

2、uni小程序自带`胶囊按钮`，如果想让小程序页面和原生一致，可以在pages.json文件中设置titleNView为false，这样小程序中就不会出现胶囊按钮。

```
{
            "path": "pages/order/order",
            "style": {
                "navigationBarTitleText": "",
                "app-plus": {
                    "titleNView": false,//禁用原生导航栏
                    "bounce":"none"
                    }
            }
}
```


# 文章

[简书：iOS架构：从开发到跨端架构师，实现iOS开发对Android进行跨端开发，一套代码多端使用。](https://www.jianshu.com/p/aa35cb7b4276)
