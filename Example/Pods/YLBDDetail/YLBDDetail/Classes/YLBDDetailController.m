//
//  YLBDDetailController.m
//  YLBDDetail
//
//  Created by 余礼钵 on 2022/10/4.
//

#import "YLBDDetailController.h"
#import <YLBCommon/YLBCommon.h>

#import <YLBModule/YLBModuleManager.h>
#import <YLBModule/YLBServiceManager.h>
#import <YLBDServices/YLBDRouterProtocol.h>
#import <YLBDServices/YLBDDetailImpProtocol.h>
#import <JLRoutes/JLRoutes.h>

@interface YLBDDetailController ()
@property(nonatomic, copy) void (^refreshCallback)(NSDictionary *dict);
@property(nonatomic, strong)NSString *moduleName;
@end

@implementation YLBDDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self setupSubviews];
}
- (void)setupSubviews {
    [self setupButton];
    [self setupButton2];
}

- (void)setupButton {
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(0, 0, 100, 30);
    btn.center = CGPointMake(self.view.ylb_width/2.0, self.view.ylb_height/2.0);
    [btn setTitle:@"返回到首页" forState:UIControlStateNormal];
    [btn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    btn.backgroundColor = UIColor.lightGrayColor;
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(btnMethod:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setupButton2 {
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(0, 0, 100, 30);
    btn.center = CGPointMake(self.view.ylb_width/2.0, self.view.ylb_height/2.0 + 50);
    [btn setTitle:@"下一页" forState:UIControlStateNormal];
    [btn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    btn.backgroundColor = UIColor.lightGrayColor;
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(btnMethod2:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnMethod:(UIButton *)sender {
    
    // 路由通信：消息回传
    if (self.refreshCallback) {
        NSDictionary *dict = @{
            @"moduleName":YLB_PROTECT_STR(self.moduleName),
        };
        self.refreshCallback(dict);
    }
    
    //模块通信：消息回传
    [self ylb_impProtocol];
    
    //读取json配置文件
    NSDictionary *dict;
    dict = [[self class] obtainJson];
    NSString *scheme = dict[@"scheme"];
    
    NSString *urlStr = @"back";//[NSString stringWithFormat:@"%@://native/%@", scheme, @"home"];
    [[JLRoutes routesForScheme:scheme] routeURL:[NSURL URLWithString:urlStr] withParameters:@{
        @"YLBDVCRouteBackPage":@"home",
    }];
}

- (void)btnMethod2:(UIButton *)sender {
    //读取json配置文件
    NSDictionary *dict;
    dict = [[self class] obtainJson];
    NSString *scheme = dict[@"scheme"];
    __weak __typeof(self)weakSelf = self;
    
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

#pragma mark - 实现YLBDDetailImpProtocol协议
- (void)ylb_impProtocol {
    NSMutableArray *targetArray = [[YLBServiceManager sharedInstance] impOfProtocol:@protocol(YLBDDetailImpProtocol)];
    for (int i = 0; i < targetArray.count; i++) {
        id<YLBDDetailImpProtocol> ylbdDetail = [targetArray objectAtIndex:i];
        if ([ylbdDetail respondsToSelector:@selector(impFromDetail:)]) {
            
            NSDictionary *dict = @{
                @"moduleName":YLB_PROTECT_STR(self.moduleName),
            };
            
            [ylbdDetail impFromDetail:dict];
        }
    }
}

@end
