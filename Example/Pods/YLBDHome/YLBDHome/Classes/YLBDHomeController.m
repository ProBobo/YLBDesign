//
//  YLBDHomeController.m
//  YLBDHome
//
//  Created by 余礼钵 on 2022/10/4.
//

#import "YLBDHomeController.h"
#import <YLBCommon/YLBCommon.h>

#import <YLBModule/YLBModuleManager.h>
#import <YLBModule/YLBServiceManager.h>
#import <YLBDServices/YLBDRouterProtocol.h>
#import <YLBDServices/YLBDDetailImpProtocol.h>
#import <JLRoutes/JLRoutes.h>

@interface YLBDHomeController ()

@end

@implementation YLBDHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.title = @"首页";
    
    [[YLBServiceManager sharedInstance] impService:@protocol(YLBDDetailImpProtocol) target:self];
    
    [self setupSubviews];
}

- (void)setupSubviews {
    [self setupButton];
}

- (void)setupButton {
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(0, 0, 100, 30);
    btn.center = CGPointMake(self.view.ylb_width/2.0, self.view.ylb_height/2.0);
    [btn setTitle:@"路由跳转" forState:UIControlStateNormal];
    [btn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    btn.backgroundColor = UIColor.lightGrayColor;
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(btnMethod:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnMethod:(UIButton *)sender {
    //读取json配置文件
    NSDictionary *dict;
    dict = [[self class] obtainJson];
    NSString *scheme = dict[@"scheme"];
    
    //路由跳转及通信
    NSString *urlStr = [NSString stringWithFormat:@"%@://native/%@", scheme, @"detail"];
    void (^refreshCallback)(NSDictionary *) = ^(NSDictionary *dict) {
        YLBDLog(@"回调函数，内容：%@", dict);
    };
    
    [[JLRoutes routesForScheme:scheme] routeURL:[NSURL URLWithString:urlStr] withParameters:@{
        @"refreshCallback":refreshCallback,
        @"moduleName":@"YLBDDetail",
    }];
}

#pragma mark - 读取json文件
+ (NSDictionary *)obtainJson {
    id<YLBDRouterProtocol> bfRouter = [[YLBServiceManager sharedInstance] createService:@protocol(YLBDRouterProtocol)];
    if ([bfRouter respondsToSelector:@selector(obtainJson)]) {
        return [bfRouter obtainJson];
    }
    return @{};
}

#pragma mark - 模块通信：消息回传
#pragma mark YLBDDetailImpProtocol
- (void)impFromDetail:(NSDictionary *)dict {
    YLBDLog(@"module dict = %@",YLB_PROTECT_STR(dict));
}

@end
