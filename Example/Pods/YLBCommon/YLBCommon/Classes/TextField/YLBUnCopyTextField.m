//
//  YLBUnCopyTextField.m
//  Pods-YLBCommon_Example
//
//  Created by yulibo on 2020/8/20.
//

#import "YLBUnCopyTextField.h"

@implementation YLBUnCopyTextField

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(paste:))//禁止粘贴
        return NO;
    if (action == @selector(select:))// 禁止选择
        return NO;
    if (action == @selector(selectAll:))// 禁止全选
        return NO;
    return [super canPerformAction:action withSender:sender];
}

@end
