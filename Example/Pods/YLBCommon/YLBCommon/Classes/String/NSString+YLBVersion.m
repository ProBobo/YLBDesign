//
//  NSString+YLBVersion.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/6/4.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "NSString+YLBVersion.h"

@implementation NSString (YLBVersion)

#pragma mark - 版本判断
//版本格式：1.2.1
//例如，1.1.2和1.2.1.3比较
+ (BOOL)isNeedUpdateVersion:(NSString *)localVersion latestVersion:(NSString *)latestVersion {
    // app版本
    NSString *app_version = localVersion;
    NSString *low_version = latestVersion;
    NSArray *currentVersionArray = [app_version componentsSeparatedByString:@"."];
    NSArray *lowVersionArray = [low_version componentsSeparatedByString:@"."];
    
    BOOL needUpdate = YES;
    //根据数组下标按顺序比大小
    for (NSInteger index = 0; index < [lowVersionArray count]; index++) {
        NSInteger lValue = [[lowVersionArray objectAtIndex:index] integerValue];
        if ([currentVersionArray count] > index) {
            NSInteger cValue = [[currentVersionArray objectAtIndex:index] integerValue];
            if (lValue < cValue) {
                needUpdate = NO;
                break;
            }else if (lValue == cValue){
                needUpdate = NO;//相等不需要升级
            }
            else{
                needUpdate = YES;
                break;
            }
        }
        else{
            needUpdate = YES;
        }
    }
    if (needUpdate) {
        
    }
    
    return needUpdate;
}

@end
