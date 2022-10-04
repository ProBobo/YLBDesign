//
//  NSString+YLBUrl.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/26.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "NSString+YLBUrl.h"

@implementation NSString (YLBUrl)

+ (NSString*)urlEncode:(id<NSObject>)value {
    //make sure param is a string
    if ([value isKindOfClass:[NSNumber class]]) {
        value = [(NSNumber*)value stringValue];
    }

    NSAssert([value isKindOfClass:[NSString class]], @"request parameters can be only of NSString or NSNumber classes. '%@' is of class %@.", value, [value class]);

    NSString *str = (NSString *)value;
    
    return [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

//#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_7_0 || __MAC_OS_X_VERSION_MIN_REQUIRED >= __MAC_10_9
//    return [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//
//#else
//    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
//                                                                                 NULL,
//                                                                                 (__bridge CFStringRef)str,
//                                                                                 NULL,
//                                                                                 (CFStringRef)@"!*'();:@&=+$,/?%#[]",
//                                                                                 kCFStringEncodingUTF8));
//#endif
}
+ (NSString *)urlDecode:(id<NSObject>)value {
    //make sure param is a string
    if ([value isKindOfClass:[NSNumber class]]) {
        value = [(NSNumber*)value stringValue];
    }

    NSAssert([value isKindOfClass:[NSString class]], @"request parameters can be only of NSString or NSNumber classes. '%@' is of class %@.", value, [value class]);

    NSString *str = (NSString *)value;
    return [str stringByRemovingPercentEncoding];
}

@end
