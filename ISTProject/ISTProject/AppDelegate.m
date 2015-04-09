//
//  AppDelegate.m
//  ISTProject
//
//  Created by steven_l on 15/4/9.
//  Copyright (c) 2015年 steven_l. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//设置单例
+ (AppDelegate *)shareDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //设置导航条
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
    
    [self layoutMainView:nil];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)layoutMainView:(id)sender
{
    
    if(self.rootNavigation)
    {
        [self.rootNavigation.view removeFromSuperview];
        self.rootNavigation = nil;
    }
    
    MainTabBarController *tabbar = [[MainTabBarController alloc] init];
    self.mainTabBarVC = tabbar;
    [_mainTabBarVC loadMenuItems];
    SunboxSoft_IPhoneBaseNavigationController *navigation = [[SunboxSoft_IPhoneBaseNavigationController alloc] init];
    self.rootNavigation = navigation;
    self.rootNavigation.navigationBarHidden = YES;
    [_rootNavigation popToRootViewControllerAnimated:NO];
    NSArray *controllers2 = [NSArray arrayWithObject:_mainTabBarVC];
    _rootNavigation.viewControllers = controllers2;
    [self.window setRootViewController:_rootNavigation];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
