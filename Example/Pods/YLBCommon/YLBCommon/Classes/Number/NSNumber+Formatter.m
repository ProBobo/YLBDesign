//
//  NSNumber+Formatter.m
//  YLBCommon
//
//  Created by yulibo on 2020/11/24.
//

#import "NSNumber+Formatter.h"

@implementation NSNumber (Formatter)
- (NSString *)adaptDoubleToStringFromNumber {
    NSNumber *num = self;
    if (num == nil) {
        return @"";
    }
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSString *resultStr = [formatter stringFromNumber:num];
    return resultStr;
}

//解决NSNumber和NSString转化double失真问题
- (NSString *)stringWithoutSeparatorFromNumber {
    NSNumber *num = self;
    if (num == nil) {
        return @"";
    }
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    [formatter setGroupingSeparator:@""];//避免出现“，”分隔符
    NSString *strD = [formatter stringFromNumber:num];
    return strD;
}
@end
