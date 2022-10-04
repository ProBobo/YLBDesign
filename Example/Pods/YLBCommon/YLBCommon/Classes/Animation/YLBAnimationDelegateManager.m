//
//  YLBAnimationDelegateManager.m
//  Pods-YLBCommon_Example
//
//  Created by yulibo on 2020/10/9.
//

#import "YLBAnimationDelegateManager.h"

@implementation YLBAnimationDelegateManager
- (void)animationDidStart:(CAAnimation *)anim {
    if (_delegate && [_delegate respondsToSelector:@selector(animationDidStart:)]) {
        [_delegate animationDidStart:anim];
    }
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (_delegate && [_delegate respondsToSelector:@selector(animationDidStop:finished:)]) {
        [_delegate animationDidStop:anim finished:flag];
    }
}

@end
