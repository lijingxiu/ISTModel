//
//  UIImage+Util.h
//  BSports
//
//  Created by 柳文杰 on 15/1/31.
//  Copyright (c) 2015年 ist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Util)
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
- (UIImage *)imageWithTintColor:(UIColor *)color;

- (UIImage *)stretchableImage;
@end
