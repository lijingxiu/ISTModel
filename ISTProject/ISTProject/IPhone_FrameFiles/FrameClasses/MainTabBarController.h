//
//  BaseTabBarController.h
//  WoAiPhoneApp
//
//  Created by 雷克 on 10-11-19.
//  Copyright 2010 Sharppoint Group Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STTabBarView.h"
#import "SunboxSoft_IPhoneBaseNavigationController.h"


@interface MainTabBarController : UITabBarController <
    STTabBarTouchDelegate>
@property (nonatomic, strong) STTabBarView *customTabbarView;


- (void)loadMenuItems;
- (void)doLogin;

@end 