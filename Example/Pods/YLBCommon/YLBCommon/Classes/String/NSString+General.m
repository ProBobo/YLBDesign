//
//  NSString+General.m
//  YLBCommon
//
//  Created by yulibo on 2022/1/10.
//

#import "NSString+General.h"

@implementation NSString (General)
- (instancetype)trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (instancetype)filterSpace {
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (BOOL)equalsIgnoreCase:(NSString *)str {
    NSString *currentStr = [self lowercaseString];
    NSString *otherStr = [str lowercaseString];
    return [currentStr isEqualToString:otherStr];
}

+ (BOOL)isEmpty:(NSString *)str {
    return ![NSString isNotEmpty:str];
}

+ (BOOL)isNotEmpty:(NSString *)str {
    if (str == nil || [str isKindOfClass:[NSNull class]]) {
        return NO;
    }
    if([@"" isEqualToString:[str trim]]) {
        return NO;
    }
    
    if([@"null" equalsIgnoreCase:[str trim]]) {
        return NO;
    }
    
    if([@"<null>" equalsIgnoreCase:[str trim]]) {
        return NO;
    }
    
    if([@"undefined" equalsIgnoreCase:[str trim]]) {
        return NO;
    }
    
    if ([@"(null)" equalsIgnoreCase:[str trim]]) {
        return NO;
    }
    
    return YES;
}
@end
