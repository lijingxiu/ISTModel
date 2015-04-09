
//
//  BaseTabBarController.m
//  WoAiPhoneApp
//
//  Created by 雷克 on 10-11-19.
//  Copyright 2010 Sharppoint Group Ltd. All rights reserved.
//

#import "MainTabBarController.h"


@interface MainTabBarController()<STTabBarTouchDelegate>

@property (nonatomic, strong) UIControl *currentBtn;
@property (nonatomic, strong) NSMutableArray *btns;

@end

@implementation MainTabBarController

- (id)init
{
    self = [super init];
    if(self)
    {
       //当状态栏高度变化
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(statusFrameChanged:)
                                                     name:UIApplicationWillChangeStatusBarFrameNotification
                                                   object:nil];
    }
    return self;
}
//当状态栏高度变化
- (void)statusFrameChanged:(NSNotification*)note
{
//    CGRect statusBarFrame = [note.userInfo[UIApplicationStatusBarFrameUserInfoKey] CGRectValue];
//    CGFloat statusHeight = statusBarFrame.size.height;
//    if (statusHeight == 40) {
//        self.customTabbarView.frame = CGRectMake(0, kScreen_Height-20-49, kScreen_Width, 49);
//        self.view.frame = CGRectMake(0, 20, kScreen_Width, kScreen_Height-20);
//        
//    }
//    else
//    {
//        self.customTabbarView.frame = CGRectMake(0, kScreen_Height-49, kScreen_Width, 49);
//        self.view.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height);
//        
//    }
}


- (void)makeTabBarHidden:(BOOL)hide 
{
	// Custom code to hide TabBar
	if([self.view.subviews count] < 2)
	{
		return;
	}
	
	UIView *contentView;
	if([[self.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]]) 
	{
		contentView = [self.view.subviews objectAtIndex:1];
	} 
	else 
	{
		contentView = [self.view.subviews objectAtIndex:0];
	}
	//NSLog(@"%@,%@",NSStringFromCGRect(_mainTabBarVC.view.bounds),NSStringFromCGRect(contentView.bounds));
	if(hide) 
	{
        contentView.frame = CGRectMake(self.view.bounds.origin.x,
									   self.view.bounds.origin.y,
									   self.view.bounds.size.width,
									   self.view.bounds.size.height);
	}
	else 
	{
		contentView.frame = CGRectMake(self.view.bounds.origin.x,
									   self.view.bounds.origin.y,
									   self.view.bounds.size.width,
									   self.view.bounds.size.height - self.tabBar.frame.size.height);
	}
	self.tabBar.hidden = hide;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
	if(self.customTabbarView)
	{
		[self.customTabbarView removeFromSuperview];
		self.customTabbarView = nil;
	}
}

- (void)doLogin
{
//    LoginViewController *loginVC = [[LoginViewController alloc] initWithNibName:nil
//                                                                         bundle:nil];
//    loginVC.loginBlock = ^{
//        [self loadMenuItems];
//    };
//    [self presentViewController:loginVC animated:NO completion:^{
//        
//    }];
}


- (void)loadMenuItems
{
    self.tabBar.hidden = YES;
    NSMutableArray *controllers = [NSMutableArray array];
    //读取plist文件加载模块
    NSString *parh = [[NSBundle mainBundle] pathForResource:@"STTabBarSetting" ofType:@"plist"];
    NSMutableDictionary *settingDic = [[NSMutableDictionary dictionaryWithContentsOfFile:parh]objectForKey:@"STTabBarSetting"];
    NSArray *items = [settingDic objectForKey:@"Items"];
    
    for(NSDictionary *aItem in items)
    {
        NSString *type = [aItem objectForKey:@"Type"];
        //首页
        if([type isEqualToString:@"HomePage"])
        {
//            MainPageViewController *main = [[MainPageViewController alloc] initWithNibName:nil bundle:nil];
//            SunboxSoft_IPhoneBaseNavigationController *navVC = [[SunboxSoft_IPhoneBaseNavigationController alloc]initWithRootViewController:main];
//            navVC.navigationBarHidden = YES;
//            [controllers addObject:navVC];
        }
        //我的
        else if ([type isEqualToString:@"Mine"])
        {
//            MineViewController *mine = [[MineViewController alloc] initWithNibName:nil bundle:nil];
//            SunboxSoft_IPhoneBaseNavigationController *navVC = [[SunboxSoft_IPhoneBaseNavigationController alloc]initWithRootViewController:mine];
//            navVC.navigationBarHidden = YES;
//            [controllers addObject:navVC];

        }
        //设置
        else if ([type isEqualToString:@"NewDepartment"])
        {
//            SettingViewController *set = [[SettingViewController alloc] initWithNibName:nil bundle:nil];
//            SunboxSoft_IPhoneBaseNavigationController *navVC = [[SunboxSoft_IPhoneBaseNavigationController alloc]initWithRootViewController:set];
//            navVC.navigationBarHidden = YES;
//            [controllers addObject:navVC];
        }
        //联系人
        else if ([type isEqualToString:@"Link"])
        {
//            LinkOperationViewController *linkVC = [[LinkOperationViewController alloc] init];
//            SunboxSoft_IPhoneBaseNavigationController *linkNavVC = [[SunboxSoft_IPhoneBaseNavigationController alloc]initWithRootViewController:linkVC];
//            linkNavVC.navigationBarHidden = YES;
//            [controllers addObject:linkNavVC];
        }
        //通讯录
        else if ([type isEqualToString:@"Phone"])
        {
//            LinkContactsViewController *linkContacts = [[LinkContactsViewController alloc] init];
//            SunboxSoft_IPhoneBaseNavigationController *linkNavVC = [[SunboxSoft_IPhoneBaseNavigationController alloc]initWithRootViewController:linkContacts];
//            linkNavVC.navigationBarHidden = YES;
//            [controllers addObject:linkNavVC];
        }
        //服务
        else if ([type isEqualToString:@"Service"])
        {
           // UIViewCtrl_News *news = [[UIViewCtrl_News alloc] initWithNibName:@"UIViewCtrl_News" bundle:nil] ;
//            serviceAppViewController*news = [[serviceAppViewController alloc]init];
//            SunboxSoft_IPhoneBaseNavigationController *newSvc = [[SunboxSoft_IPhoneBaseNavigationController alloc]initWithRootViewController:news];
//            newSvc.navigationBarHidden = YES;
//            [controllers addObject:newSvc];
//
        }
        //更多
        else if ([type isEqualToString:@"More"])
        {
       
        }
        
    }
    self.viewControllers = controllers;

    NSString *backgroundImage = [settingDic objectForKey:@"Background"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:backgroundImage]];
    
    if(_customTabbarView)
	{
		[self.customTabbarView removeFromSuperview];
		self.customTabbarView = nil;
	}
    NSMutableArray *menuArray = [NSMutableArray array];
    for(NSDictionary *aItem in [settingDic objectForKey:@"Items"])
    {
        NSDictionary *item = [NSDictionary dictionaryWithObjectsAndKeys:[aItem objectForKey:@"TabBarNormal"],@"Nomal",[aItem objectForKey:@"TabBarSelected"],@"Selected",[aItem objectForKey:@"Title"],@"Title", [aItem objectForKey:@"HomeNormal"], @"icon", nil];    
        [menuArray addObject:item];
    }

    
    self.btns = [NSMutableArray array];
    if(self.customTabbarView)
    {
        [self.customTabbarView removeFromSuperview];
        self.customTabbarView = nil;
    }

    STTabBarView *tabbar = [[STTabBarView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height-kTabbarHeight - (IOSVersion >= 7.0?0:20), kScreen_Width, kTabbarHeight) withContent:menuArray homeItemDic:nil];
    tabbar.delegate = self;
    [tabbar setSelectedIndex:0 animated:NO];
    self.customTabbarView = tabbar;
    
    //Raik add
    self.btns = [NSMutableArray arrayWithArray:[tabbar getItemArray]];
    [self.view addSubview:self.customTabbarView];
    [self.view bringSubviewToFront:self.customTabbarView];
    self.customTabbarView.clipsToBounds = NO;
    
    UIImageView *menuImageView = [[UIImageView alloc] initWithFrame:tabbar.frame];
    menuImageView.image = [UIImage imageNamed:@"menu_bg.png"];
    [self.view insertSubview:menuImageView belowSubview:self.customTabbarView];

    self.tabBar.hidden = YES;
}


#pragma mark -
#pragma mark Setting UITabBarController method
- (void)settingTabBarItemWithTitleArray:(NSArray *)titleArray
{
    return;
    
	if(!titleArray || [titleArray count] == 0)
	{
		return;
	}
	
	int i = 0;
	for(UITabBarItem *item in self.tabBar.items)
	{
		NSString *titleString = [titleArray objectAtIndex:i];
		//NSLog(@"%@",titleString);
		UINavigationController *controller = [self.viewControllers objectAtIndex:i];
		controller.topViewController.navigationItem.title = titleString;
		
		item.title = titleString;
		NSString *imageName = [NSString stringWithFormat:@"button%d@2x.png",++i];
		item.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageName ofType:nil]];
	}
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return UIInterfaceOrientationIsPortrait(UIInterfaceOrientationPortrait);//(interfaceOrientation == UIInterfaceOrientationLandscapeRight);//(interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}
- (NSUInteger) supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL) shouldAutorotate {
    return NO;
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma STTabBarTouchDelegate
- (void)didTabbarViewButtonTouched:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"STOP PLAY" object:nil];
    UIControl *btn = (UIControl *)sender;

    //点击当前选中的按钮
    if(_currentBtn == btn)
	{
		return;
	}
    if(btn)
	{
        self.currentBtn = btn;
        self.selectedIndex = btn.tag;
        self.moreNavigationController.viewControllers = [[NSArray alloc] initWithObjects:self.moreNavigationController.visibleViewController, nil];
        self.moreNavigationController.navigationBarHidden = NO;
        [self.moreNavigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"topIMG.png"] forBarMetrics:UIBarMetricsDefault];
	}
}


- (BOOL)prefersStatusBarHidden
{
    return NO; //返回NO表示要显示，返回YES将hiden
}

- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    self.btns = nil;
    self.customTabbarView = nil;
    self.currentBtn = nil;
}


@end
