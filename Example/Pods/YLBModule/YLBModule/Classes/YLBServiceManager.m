//
//  YLBServiceManager.m
//  YLBModule_Example
//
//  Created by yulibo on 2020/3/12.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "YLBServiceManager.h"

@interface YLBServiceManager ()
@property (nonatomic, strong) NSMutableDictionary *totalServiceDic;
@property (nonatomic, strong) NSMutableDictionary *totalTargetDic;
@property (nonatomic, strong) NSRecursiveLock *lock;
@end

static NSString * const kService = @"service";
static NSString * const kImpl = @"impl";

@implementation YLBServiceManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static YLBServiceManager *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}

#pragma mark - 初始化
- (NSRecursiveLock *)lock {
    if (!_lock) {
        _lock = [[NSRecursiveLock alloc] init];
    }
    return _lock;
}
- (NSMutableDictionary *)totalServiceDic {
    if (!_totalServiceDic) {
        _totalServiceDic = [NSMutableDictionary dictionary];
    }
    return _totalServiceDic;
}

- (NSMutableDictionary *)totalTargetDic {
    if (!_totalTargetDic) {
        _totalTargetDic = [NSMutableDictionary dictionary];
    }
    return _totalTargetDic;
}

- (NSDictionary *)transcriptServiceDic {
    [self.lock lock];
    NSDictionary *dic = [self.totalServiceDic copy];
    [self.lock unlock];
    return dic;
}

- (void)registerService:(Protocol *)service implClass:(Class)implClass {
    //参数不能为空
    if (!service || !implClass) {
        return;
    }
    //没有实现协议
//    if (![implClass conformsToProtocol:service]) {
//        return;
//    }
    
    if ([self isExistService:service]) {
        //说明已经注册过协议
        return;
    }
    
    NSString *key = NSStringFromProtocol(service);
    NSString *value = NSStringFromClass(implClass);
    if (key.length > 0 && value.length > 0) {
        [self.lock lock];
        /*
         @{
             @"service":@"implClass"
         }
         */
        [self.totalServiceDic addEntriesFromDictionary:@{key:value}];
        [self.lock unlock];
    }
}

- (id)createService:(Protocol *)service {
    if (!service) {
        return nil;
    }
    
    id implInstance = nil;
    Class implClass = [self getImplClass:service];
        
    if ([[implClass class] respondsToSelector:@selector(sharedInstance)]) {
        implInstance = [[implClass class] sharedInstance];
    }
    else {
        implInstance = [[implClass alloc] init];
    }
    return implInstance;
}

- (void)impService:(Protocol *)service target:(nonnull id)target {
    //参数不能为空
    if (!service || !target) {
        return;
    }
    //一个对象对应多个方法

    NSMutableArray *targetArray = [self getImpTargetArray:service];
    id value = target;
    BOOL isContain = NO;
    for (int i = 0; i < targetArray.count; i++) {
        if ([targetArray containsObject:target]) {
            isContain = YES;
        }
    }
    if (isContain == NO) {
        /*
         如果数组只想保留一个对象，则可以使用[targetArray removeAllObjects];
         */
        [targetArray removeAllObjects];
        [targetArray addObject:value];
        NSString *key = NSStringFromProtocol(service);
        [self.totalTargetDic setValue:targetArray forKey:key];
    }
}

- (NSMutableArray *)impOfProtocol:(Protocol *)service {
    NSMutableArray *targetArray = [self getImpTargetArray:service];
    return targetArray;
}

- (BOOL)isExistService:(Protocol *)service {
    NSString *key = NSStringFromProtocol(service);
    NSString *implName = [[self transcriptServiceDic] objectForKey:key];
    if (implName.length > 0) {
        return YES;
    }
    return NO;
}

- (Class)getImplClass:(Protocol *)service {
    NSString *key = NSStringFromProtocol(service);
    NSString *implName = [[self transcriptServiceDic] objectForKey:key];
    if (implName.length > 0) {
        return NSClassFromString(implName);
    }
    return nil;
}

- (NSMutableArray *)getImpTargetArray:(Protocol *)service {
    /*
     可以把协议以及协议里方法完全字符串，然后放入json文件中，以实现Module之间彻底的独立运行，不再需要引入.h文件。
     通过NSStringFromProtocol和NSSelectorFromString方法。
     */
    NSString *key = NSStringFromProtocol(service);
    
    NSMutableArray *targetArray = [self.totalTargetDic objectForKey:key];
    NSMutableArray *resultArray = [@[] mutableCopy];
    //判断是否实现协议，如果实现了协议，返回对象
    for (int i = 0; i < targetArray.count; i++) {
        id target = [targetArray objectAtIndex:i];
        if (target) {
            [resultArray addObject:target];
        }
    }
    targetArray = resultArray;
    [self.totalTargetDic setValue:targetArray forKey:key];
    
    if (targetArray.count > 0) {
        return targetArray;
    }
    return [@[] mutableCopy];
}

@end
