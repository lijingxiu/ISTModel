//
//  AppDelegate.h
//  ISTProject
//
//  Created by steven_l on 15/4/9.
//  Copyright (c) 2015年 steven_l. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) MainTabBarController *mainTabBarVC;
@property (nonatomic, strong) SunboxSoft_IPhoneBaseNavigationController  *rootNavigation;

+ (AppDelegate *)shareDelegate;

@end

