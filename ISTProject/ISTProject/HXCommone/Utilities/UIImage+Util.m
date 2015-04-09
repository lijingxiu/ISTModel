//
//  UIImage+Util.m
//  BSports
//
//  Created by 柳文杰 on 15/1/31.
//  Copyright (c) 2015年 ist. All rights reserved.
//

#import "UIImage+Util.h"

@implementation UIImage (Util)
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    //UIGraphicsBeginImageContext(rect.size);
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
- (UIImage *)imageWithTintColor:(UIColor *)color{

    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [color setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;

}
-(UIImage *)stretchableImage{
    return [self stretchableImageWithLeftCapWidth:self.size.width*0.5 topCapHeight:self.size.height*0.5];
}
@end
