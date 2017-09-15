//
//  UIView+UIView_Util.h
//  ISTIM
//
//  Created by steven on 2017/8/15.
//  Copyright © 2017年 sunboxsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIView_Util)

@property (nonatomic) CGFloat minX;
@property (nonatomic) CGFloat left;

/* frame.origin.y */
@property (nonatomic) CGFloat minY;
@property (nonatomic) CGFloat top;

/* frame.origin.x + frame.size.width */
@property (nonatomic) CGFloat maxX;
@property (nonatomic) CGFloat right;

/* frame.origin.y + frame.size.height */
@property (nonatomic) CGFloat maxY;
@property (nonatomic) CGFloat bottom;

/* frame.size.width */
@property (nonatomic) CGFloat width;

/* frame.size.height */
@property (nonatomic) CGFloat height;

/* center.x */
@property (nonatomic) CGFloat centerX;

/* center.y */
@property (nonatomic) CGFloat centerY;

/* Return the x coordinate on the screen */
@property (nonatomic, readonly) CGFloat ttScreenX;

/* Return the y coordinate on the screen */
@property (nonatomic, readonly) CGFloat ttScreenY;

/* Return the x coordinate on the screen, taking into account scroll views */
@property (nonatomic, readonly) CGFloat screenViewX;

/* Return the y coordinate on the screen, taking into account scroll views */
@property (nonatomic, readonly) CGFloat screenViewY;

/* Return the view frame on the screen, taking into account scroll views */
@property (nonatomic, readonly) CGRect screenFrame;

/* frame.origin */
@property (nonatomic) CGPoint origin;

/* frame.size */
@property (nonatomic) CGSize size;




@end
