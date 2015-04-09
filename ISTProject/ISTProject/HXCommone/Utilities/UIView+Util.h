//
//  UIView+Util.h
//  UsedCar
//
//  Created by Alan on 13-10-25.
//  Copyright (c) 2013年 Alan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Util)

/* frame.origin.x */
@property (nonatomic) CGFloat minX;

/* frame.origin.y */
@property (nonatomic) CGFloat minY;

/* frame.origin.x + frame.size.width */
@property (nonatomic) CGFloat maxX;

/* frame.origin.y + frame.size.height */
@property (nonatomic) CGFloat maxY;

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

/* center for bounds */
@property (nonatomic) CGPoint centerBounds;

- (UIView*)subviewWithFirstResponder;
- (UIView*)subviewWithClass:(Class)cls;
- (UIView*)superviewWithClass:(Class)cls;

- (void)removeAllSubviews;

/** 全局区域头部视图 */
- (UIView *)sectionViewWithFrame:(CGRect)frame title:(NSString *)title;

/** 设置背景图片 */
- (void)setBackgroundImage:(UIImage *)image;
///** 设置背景模糊 */
//- (void)setBackgroundBlur:(UIColor *)color;
/** 设置背景视图 */
- (void)setBackgroundView:(UIView *)bgView;


- (id)initWithClearFrame:(CGRect)frame;
- (id)initLineWithFrame:(CGRect)frame color:(UIColor *)color;

- (UIViewController *)viewController;

//- (void)addSubviewReleased:(UIView *)view;

- (UIImage *)screenshot;

- (NSString *)stringViewStruct;
- (NSMutableArray *)imageViewStruct;


@end

@interface UIButton (Util)
- (UIEdgeInsets)setImageEdgeInsetsFromOriginOffSet:(CGVector)vector imageSize:(CGSize)size;
- (UIEdgeInsets)setImageEdgeInsetsFromCenterOffSet:(CGVector)vector imageSize:(CGSize)size;

@end
