//
//  UIImage+YLBDesign.m
//  YLBDesign
//
//  Created by 余礼钵 on 2022/10/4.
//

#import "UIImage+YLBDesign.h"
#import "YLBDBundleManager.h"

@implementation UIImage (YLBDesign)
+ (UIImage *)second_imageNamed:(NSString *)name inBundle:(NSBundle *)bundle {
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    return [UIImage imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
#elif __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_8_0
    return [UIImage imageWithContentsOfFile:[bundle pathForResource:name ofType:@"png"]];
#else
    if ([UIImage respondsToSelector:@selector(imageNamed:inBundle:compatibleWithTraitCollection:)]) {
        return [UIImage imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
    } else {
        return [UIImage imageWithContentsOfFile:[bundle pathForResource:name ofType:@"png"]];
    }
#endif
}

+ (UIImage *)bf_imageNamed:(NSString *)name inBundle:(NSBundle *)bundle folder:(NSString *)folder {
    NSString *fileName = [NSString stringWithFormat:@"%@%@",name,@"@2x"];
    UIImage *image = [self obtainImage:fileName inBundle:bundle folder:folder];
    if(!image) {
        fileName = [NSString stringWithFormat:@"%@%@",name,@""];
        image = [self obtainImage:fileName inBundle:bundle folder:folder];
        if(!image) {
            fileName = [NSString stringWithFormat:@"%@%@",name,@"@3x"];
            image = [self obtainImage:fileName inBundle:bundle folder:folder];
        }
    }
    return image;
}

+ (UIImage *)obtainImage:(NSString *)name inBundle:(NSBundle *)bundle folder:(NSString *)folder {
    UIImage *image = [UIImage imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
    if(!image) {
        // ImageRes对应资源文件夹
        NSString *otherName = name;
        if(folder.length > 0) {
            otherName = [NSString stringWithFormat:@"%@/%@",folder,name];
        }
        image = [UIImage imageWithContentsOfFile:[bundle pathForResource:otherName ofType:@"png"]];
        if(!image) {
            image = [UIImage imageWithContentsOfFile:[bundle pathForResource:otherName ofType:@"jpg"]];
            if(!image) {
                // 特别说明：xcode14中在Pod库中无法读取pdf格式的文件，但是可以读取png和jpg格式的文件。在主工程中也可以读取pdf格式的文件。
                image = [UIImage imageWithContentsOfFile:[bundle pathForResource:otherName ofType:@"pdf"]];
            }
        }
        
    }
    return image;
}

+ (UIImage *)ylbd_imageNamed:(NSString *)name {
    NSBundle *bundle = [YLBDBundleManager ylbd_bunlde];
    NSString *folder = @"ImageRes";
    UIImage *image = [self bf_imageNamed:name inBundle:bundle folder:folder];
    return image;
}
@end
