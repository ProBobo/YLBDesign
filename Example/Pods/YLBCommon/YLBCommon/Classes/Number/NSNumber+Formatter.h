//
//  NSNumber+Formatter.h
//  YLBCommon
//
//  Created by yulibo on 2020/11/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (Formatter)
/**
 处理double数据类型的小数点显示问题，如1.0显示为1.0000...的问题，会出现“，”分隔符，如10000变为10，000
 */
- (NSString *)adaptDoubleToStringFromNumber;

/*
 解决NSNumber和NSString转化double失真问题，避免出现“，”分隔符
 */
- (NSString *)stringWithoutSeparatorFromNumber;
@end

NS_ASSUME_NONNULL_END
