//
//  NSString+General.h
//  YLBCommon
//
//  Created by yulibo on 2022/1/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (General)
- (instancetype)trim;
- (instancetype)filterSpace;
- (BOOL)equalsIgnoreCase:(NSString *)str;
+ (BOOL)isEmpty:(NSString *)str;
+ (BOOL)isNotEmpty:(NSString *)str;
@end

NS_ASSUME_NONNULL_END
