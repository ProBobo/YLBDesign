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

#import "UIImage+YLBDesign.h"

@interface YLBDesignTabBarController ()<UITabBarControllerDelegate>
@property(nonatomic, strong) NSMutableArray *childVCArray;
@end

@implementation YLBDesignTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.backgroundColor = UIColor.whiteColor;//设置底部导航栏为白色
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

#pragma mark - 关于旋转的设置
//是否自动旋转
-(BOOL)shouldAutorotate {
    return self.selectedViewController.shouldAutorotate;
}

//支持哪些屏幕方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.selectedViewController supportedInterfaceOrientations];
}

//默认方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
}

@end
