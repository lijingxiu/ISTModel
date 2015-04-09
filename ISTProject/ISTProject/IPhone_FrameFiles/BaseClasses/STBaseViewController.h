//
//  STBaseViewController.h
//  IceMan
//
//  Created by steven_l on 15/3/4.
//  Copyright (c) 2015年 steven_l. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STBaseViewController : UIViewController

@property (nonatomic, copy) NSString *title;
//ios7和ios6的高度变化
@property (nonatomic, assign) CGFloat iosChangeFloat;

- (void)creatNavBar;
- (void)creatNavBarWithBackBtn;

@end
