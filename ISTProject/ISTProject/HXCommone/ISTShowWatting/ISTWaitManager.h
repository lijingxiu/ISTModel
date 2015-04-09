//
//  ISTWaitManager.h
//  RongHeiPhone
//
//  Created by liqiang on 14-7-23.
//  Copyright (c) 2014年 sunboxsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ISTWaitManager : NSObject

+ (id) sharedService;

//显示waitview到这个view 如果是dalay是-1的话就是如果不手动移除的话 用不移除
- (void)showWaittingViewWithCustomView:(UIView *)view  afterDelay:(NSTimeInterval)delay;

- (void)showWaittingViewWithCustomView:(UIView *)view  withTitle:(NSString *)title afterDelay:(NSTimeInterval)delay;

//移除waittingView
- (void)removeWaittingView:(UIView *)view;

- (void)showStatusStrWithStr:(NSString *)title  afterDelay:(float)delay;

@end
