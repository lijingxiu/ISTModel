//
//  UIView+Util.m
//  UsedCar
//
//  Created by Alan on 13-10-25.
//  Copyright (c) 2013年 Alan. All rights reserved.
//

#import "UIView+Util.h"
//#import "AMBlurView.h"

@implementation UIView (Util)

- (CGFloat)minX {
	return self.frame.origin.x;
}

- (void)setMinX:(CGFloat)x {
	CGRect frame = self.frame;
	frame.origin.x = x;
	self.frame = frame;
}

- (CGFloat)minY {
	return self.frame.origin.y;
}

- (void)setMinY:(CGFloat)y {
	CGRect frame = self.frame;
	frame.origin.y = y;
	self.frame = frame;
}

- (CGFloat)maxX {
	return self.frame.origin.x + self.frame.size.width;
}

- (void)setMaxX:(CGFloat)x {
	CGRect frame = self.frame;
	frame.origin.x = x - frame.size.width;
	self.frame = frame;
}

- (CGFloat)maxY {
	return self.frame.origin.y + self.frame.size.height;
}

- (void)setMaxY:(CGFloat)y {
	CGRect frame = self.frame;
	frame.origin.y = y - frame.size.height;
	self.frame = frame;
}

- (CGFloat)centerX {
	return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
	self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
	return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
	self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)width {
	return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
	CGRect frame = self.frame;
	frame.size.width = width;
	self.frame = frame;
}

- (CGFloat)height {
	return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
	CGRect frame = self.frame;
	frame.size.height = height;
	self.frame = frame;
}

- (CGFloat)ttScreenX {
	CGFloat x = 0;
	for (UIView* view = self; view; view = view.superview) {
		x += view.minX;
	}
	return x;
}

- (CGFloat)ttScreenY {
	CGFloat y = 0;
	for (UIView* view = self; view; view = view.superview) {
		y += view.minY;
	}
	return y;
}

- (CGFloat)screenViewX {
	CGFloat x = 0;
	for (UIView* view = self; view; view = view.superview) {
		x += view.minX;
		
		if ([view isKindOfClass:[UIScrollView class]]) {
			UIScrollView* scrollView = (UIScrollView*)view;
			x -= scrollView.contentOffset.x;
		}
	}
	
	return x;
}

- (CGFloat)screenViewY {
	CGFloat y = 0;
	for (UIView* view = self; view; view = view.superview) {
		y += view.minY;
		
		if ([view isKindOfClass:[UIScrollView class]]) {
			UIScrollView* scrollView = (UIScrollView*)view;
			y -= scrollView.contentOffset.y;
		}
	}
	return y;
}

- (CGRect)screenFrame {
	return CGRectMake(self.screenViewX, self.screenViewY, self.width, self.height);
}

- (CGPoint)origin {
	return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
	CGRect frame = self.frame;
	frame.origin = origin;
	self.frame = frame;
}

- (CGSize)size {
	return self.frame.size;
}

- (void)setSize:(CGSize)size {
	CGRect frame = self.frame;
	frame.size = size;
	self.frame = frame;
}

- (CGPoint)centerBounds {
	return CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
}

- (void)setCenterBounds:(CGPoint)centerBounds {
	
}

- (UIView*)subviewWithFirstResponder {
	if ([self isFirstResponder])
		return self;
	
	for (UIView *subview in self.subviews) {
		UIView *view = [subview subviewWithFirstResponder];
		if (view) return view;
	}
	
	return nil;
}

- (UIView*)subviewWithClass:(Class)cls {
	if ([self isKindOfClass:cls])
		return self;
	
	for (UIView* subview in self.subviews) {
		UIView* view = [subview subviewWithClass:cls];
		if (view) return view;
	}
	
	return nil;
}

- (UIView*)superviewWithClass:(Class)cls {
	if ([self isKindOfClass:cls]) {
		return self;
	} else if (self.superview) {
		return [self.superview superviewWithClass:cls];
	} else {
		return nil;
	}
}

- (void)removeAllSubviews {
	while (self.subviews.count) {
		UIView* child = self.subviews.lastObject;
		[child removeFromSuperview];
	}
}

- (UIImage *)screenshot{
    //支持retina高分的关键
    if(UIGraphicsBeginImageContextWithOptions != NULL)
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.0);
    else
        UIGraphicsBeginImageContext(self.bounds.size);
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

/** 全局区域头部视图 */
- (UIView *)sectionViewWithFrame:(CGRect)frame title:(NSString *)title
{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    //view.backgroundColor = kColorGray3;
    
	UILabel *labSection = [[UILabel alloc] initWithClearFrame:CGRectMake(20, 0, view.width - 20, view.height)];
    labSection.text = title;
    //labSection.textColor = kColorBlue;
    
    [view addSubview:labSection];
    
    return view;
}

/** 设置背景图片 */
- (void)setBackgroundImage:(UIImage *)image
{
    UIImageView *iv = [[UIImageView alloc] initWithImage:image];
	[self setBackgroundView:iv];
}

///** 设置背景模糊 */
//- (void)setBackgroundBlur:(UIColor *)color
//{
//    UIView *bgView = [[AMBlurView alloc] initWithFrame:self.bounds];
//    [(AMBlurView *)bgView setBlurTintColor:color];
//    [self setBackgroundView:bgView];
//}

/** 设置背景视图 */
- (void)setBackgroundView:(UIView *)bgView
{
	static int kBackgroundViewTag = 0x06746292;
	self.backgroundColor = [UIColor clearColor];

	bgView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	bgView.tag = kBackgroundViewTag;

	UIView* oldView = [self viewWithTag:kBackgroundViewTag];
    if (oldView)
        [oldView removeFromSuperview];
	
    [self insertSubview:bgView atIndex:0];
}


//初始化透明背景的View
- (id)initWithClearFrame:(CGRect)frame{
	self = [self initWithFrame:frame];
	self.backgroundColor = [UIColor clearColor];
	return self;
}

//初始化一根线
- (id)initLineWithFrame:(CGRect)frame color:(UIColor *)color{
    self = [self initWithFrame:frame];
	self.backgroundColor = color;
	return self;
}

/** super UIViewController */ 
- (UIViewController*)viewController {
	for (UIView* next = [self superview]; next; next = next.superview) {
		UIResponder* nextResponder = [next nextResponder];
		if ([nextResponder isKindOfClass:[UIViewController class]]) {
			return (UIViewController*)nextResponder;
		}
	}
	return nil;
}

/** 文字组织视图结构 */
- (void)dumpViewIntoString:(NSMutableString *)str view:(UIView *)view level:(int)level
{
    for (int i = 0; i < level; i++)
        [str appendString:@"--"];
    [str appendFormat:@"[%d] %@ %@\n", level, [view.class description], NSStringFromCGRect(view.frame)];
    for (UIView *v in view.subviews)
        [self dumpViewIntoString:str view:v level:level + 1];
}

/** 文字视图结构 */
- (NSString *)stringViewStruct
{
    NSMutableString *str = [NSMutableString string];
    [self dumpViewIntoString:str view:self level:0];
    return str;
}

/** 图片组织视图结构 */
- (void)dumpViewIntoImages:(NSMutableArray *)imgs view:(UIView *)view
{
    
    UIImage *img = [view screenshot];
    if (img)
        [imgs addObject:img];
    for (UIView *v in view.subviews)
        [self dumpViewIntoImages:imgs view:v];
}

/** 图片视图结构 */
- (NSMutableArray *)imageViewStruct
{
    NSMutableArray *imgs = [NSMutableArray array];
    [self dumpViewIntoImages:imgs view:self];
    return imgs;
}

@end

@implementation UIButton (Util)

//保持图片不变形，从坐标点调整偏移
- (UIEdgeInsets)setImageEdgeInsetsFromOriginOffSet:(CGVector)vector imageSize:(CGSize)size
{
    //dx = -((self.width-size.width)/2.0-dx);
    float offsetX = self.width - size.width;
    float offsetY = self.height - size.height;
    
    UIEdgeInsets edgeInsets =  UIEdgeInsetsMake(vector.dy, vector.dx, offsetY - vector.dy, offsetX - vector.dx);
    return edgeInsets;
}

//保持图片不变形，从中心点调整偏移
- (UIEdgeInsets)setImageEdgeInsetsFromCenterOffSet:(CGVector)vector imageSize:(CGSize)size
{
    float offsetX = self.width - size.width;
    float offsetY = self.height - size.height;
    UIEdgeInsets edgeInsets =  UIEdgeInsetsMake(offsetY/2.0 + vector.dy, offsetX/2.0 + vector.dx, offsetY/2.0 - vector.dy, offsetX/2.0 - vector.dx);
    
    return edgeInsets;
}
@end




























