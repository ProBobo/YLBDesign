//
//  YLBAnimationDelegateManager.h
//  Pods-YLBCommon_Example
//
//  Created by yulibo on 2020/10/9.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/CoreAnimation.h>
NS_ASSUME_NONNULL_BEGIN

@protocol YLBAnimationWeakDelegate <NSObject>

@optional
- (void)animationDidStart:(CAAnimation *)anim;
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag;

@end

/**
 iOS核心动画内存泄漏CAKeyframeAnimation解决方案:
 1、引入代理
 YLBAnimationWeakDelegate
 
 2、创建对应实例
 CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
 YLBAnimationDelegateManager * manager = [YLBAnimationDelegateManager new]; //创建实例
 manager.delegate = self; //进行弱引用
 moveAnimation.delegate = manager; //进行强引用
*/

@interface YLBAnimationDelegateManager : NSObject<CAAnimationDelegate>
@property (weak, nonatomic) id<YLBAnimationWeakDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
