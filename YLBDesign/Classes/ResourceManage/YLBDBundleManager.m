//
//  YLBDBundleManager.m
//  YLBDesign
//
//  Created by 余礼钵 on 2022/10/4.
//

#import "YLBDBundleManager.h"

@implementation YLBDBundleManager

+ (NSBundle *)ylbd_bunlde {
    NSString *resourceName = @"YLBDesign";
    NSURL *url = [[NSBundle bundleForClass:[self class]] URLForResource:resourceName withExtension:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithURL:url];
    return bundle;
}
@end
