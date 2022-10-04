//
//  YLBBundleManager.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/28.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "YLBBundleManager.h"

@interface YLBBundleManager ()
@property(nonatomic, strong) NSBundle *bundle;
@end

@implementation YLBBundleManager

- (NSBundle *)ylb_rigisterBundleForClass:(Class)aClass URLForResource:(NSString *)podName {
    NSURL *url = [[NSBundle bundleForClass:aClass] URLForResource:podName withExtension:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithURL:url];
    self.bundle = bundle;
    return bundle;
}

- (NSBundle *)ylb_bundle {
    return self.bundle;
}
@end
