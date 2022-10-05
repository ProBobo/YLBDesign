//
//  YLBDesignNavigationController.m
//  YLBDesign
//
//  Created by 余礼钵 on 2022/10/4.
//

#import "YLBDesignNavigationController.h"

@interface YLBDesignNavigationController ()

@end

@implementation YLBDesignNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - 关于旋转的设置
//是否自动旋转
-(BOOL)shouldAutorotate{
    return self.topViewController.shouldAutorotate;//TYRCTCameraPanelViewController
}

//支持哪些屏幕方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.topViewController supportedInterfaceOrientations];
}

//默认方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [self.topViewController preferredInterfaceOrientationForPresentation];
}

#pragma mark - 设置底部导航栏是否隐藏
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSInteger count = self.viewControllers.count;
    if (count > 0) {
        //pushViewController后隐藏tabBar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated
{
    NSInteger count = viewControllers.count;
    if (count > 1) {
        //pushViewController后隐藏tabBar
        viewControllers.lastObject.hidesBottomBarWhenPushed = YES;
    }
    [super setViewControllers:viewControllers animated:animated];
}

@end
