//
//  YLBModuleManager.h
//  YLBModule
//
//  Created by yulibo on 2020/3/11.
//

#import <Foundation/Foundation.h>
#import "YLBModuleProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface YLBModuleManager : NSObject<YLBModuleProtocol>
+ (instancetype)sharedInstance;

//@property (strong, nonatomic) UIWindow *window;
//@property(nonatomic, copy) UIWindow * (^getUIWindow)(void);
@property(nonatomic, weak) id<YLBModuleProtocol> delegate;
- (void)registerModuleClass:(Class)moduleClass;

@end

NS_ASSUME_NONNULL_END
