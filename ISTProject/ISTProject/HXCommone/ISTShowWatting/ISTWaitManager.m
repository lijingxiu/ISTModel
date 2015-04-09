//
//  ISTWaitManager.m
//  RongHeiPhone
//
//  Created by liqiang on 14-7-23.
//  Copyright (c) 2014年 sunboxsoft. All rights reserved.
//

#import "ISTWaitManager.h"

@implementation ISTWaitManager

+ (id) sharedService
{
	static  ISTWaitManager *_sharedInst = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInst=[[ISTWaitManager alloc] init];
    });
    return _sharedInst;
}

- (id) init
{
	if (self = [super init])
	{
    }
	return self;
}

- (void)showWaittingViewWithCustomView:(UIView *)view  afterDelay:(NSTimeInterval)delay
{
    [self removeWaittingView:view];
    
    UIView *waitingView = [[UIView alloc] initWithFrame:view.bounds];
    waitingView.tag = 346;
	waitingView.backgroundColor = [UIColor clearColor];
	waitingView.alpha = 1.0;
	
    UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 125)];
    colorView.alpha = 0.7;
    colorView.layer.cornerRadius = 5;
    colorView.backgroundColor =[UIColor blackColor];
    [waitingView addSubview:colorView];
    colorView.center = waitingView.center;
    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 30)];
//    [label setBackgroundColor:[UIColor clearColor]];
//    [label setCenter:CGPointMake(waitingView.bounds.size.width/2.0, waitingView.center.y+35)];
//    [label setTextAlignment:UITextAlignmentCenter];
//    [label setFont:[UIFont systemFontOfSize:16.0f]];
//    [label setTextColor:[UIColor whiteColor]];
//    [label setText:@"正在加载中..."];
//    [waitingView addSubview:label];
//    [label release];
	
	UIActivityIndicatorView *active = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
	active.center = colorView.center;
	[waitingView addSubview:active];
	[active startAnimating];
    
    [view addSubview:waitingView];
}

- (void)showWaittingViewWithCustomView:(UIView *)view  withTitle:(NSString *)title afterDelay:(NSTimeInterval)delay
{
    [self removeWaittingView:view];
    
    UIView *waitingView = [[UIView alloc] initWithFrame:view.bounds];
    waitingView.tag = 346;
	waitingView.backgroundColor = [UIColor clearColor];
	waitingView.alpha = 1.0;
	
    UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 125)];
    colorView.alpha = 0.7;
    colorView.layer.cornerRadius = 5;
    colorView.backgroundColor =[UIColor blackColor];
    [waitingView addSubview:colorView];
    colorView.center = waitingView.center;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(view.bounds), 30)];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setCenter:CGPointMake(waitingView.bounds.size.width/2.0, waitingView.center.y+35)];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont systemFontOfSize:16.0f]];
    [label setTextColor:[UIColor whiteColor]];
    [label setText:title];
    [waitingView addSubview:label];
	
	UIActivityIndicatorView *active = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
	active.center = colorView.center;
	[waitingView addSubview:active];
	[active startAnimating];
    
    [view addSubview:waitingView];
}


- (void)removeWaittingView:(UIView *)view
{
    UIView *wv  = [view viewWithTag:346];
	if(wv)
	{
		[wv removeFromSuperview];
	}
}

- (void)showStatusStrWithStr:(NSString *)title  afterDelay:(float)delay
{
    CGSize size = [title sizeWithFont:[UIFont systemFontOfSize:16.0f] constrainedToSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
   
    UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width +20, size.height +10)];
    colorView.center = CGPointMake(kScreen_Width/2, kScreen_Height*0.8);
    colorView.alpha = 0.7;
    colorView.layer.cornerRadius = 5;
    colorView.backgroundColor =[UIColor blackColor];
    [[AppDelegate shareDelegate].window addSubview:colorView];
    
    UILabel *alertLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    alertLb.textAlignment = NSTextAlignmentCenter;
    alertLb.center = CGPointMake(colorView.bounds.size.width/2, colorView.bounds.size.height/2);
    alertLb.text = title;
    alertLb.font = [UIFont systemFontOfSize:16.0f];
    alertLb.backgroundColor = [UIColor clearColor];
    alertLb.textColor = [UIColor whiteColor];
    [colorView addSubview:alertLb];
    [colorView performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:delay];

}




@end
