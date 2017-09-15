//
//  BaseNavigationController.m
//  STProject
//
//  Created by steven on 2017/9/15.
//  Copyright © 2017年 ist. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()
@property (strong, nonatomic) UIView *navLineV;
@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self hideBorderInView:self.navigationBar];
    if (!_navLineV) {
        _navLineV = [[UIView alloc]initWithFrame:CGRectMake(0, 44, kScreen_Width, 1.0/ [UIScreen mainScreen].scale)];
        _navLineV.backgroundColor = kColorD8DDE4;
        [self.navigationBar addSubview:_navLineV];
    }
}

- (void)hideNavBottomLine{
    [self hideBorderInView:self.navigationBar];
    if (_navLineV) {
        _navLineV.hidden = YES;
    }
}

- (void)showNavBottomLine{
    _navLineV.hidden = NO;
}

- (void)hideBorderInView:(UIView *)view{
    if ([view isKindOfClass:[UIImageView class]]
        && view.frame.size.height <= 1) {
        view.hidden = YES;
    }
    for (UIView *subView in view.subviews) {
        [self hideBorderInView:subView];
    }
}

- (BOOL)shouldAutorotate{
    return [self.visibleViewController shouldAutorotate];
    
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [self.visibleViewController preferredInterfaceOrientationForPresentation];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if (![self.visibleViewController isKindOfClass:[UIAlertController class]]) {//iOS9 UIWebRotatingAlertController
        return [self.visibleViewController supportedInterfaceOrientations];
    }else{
        return UIInterfaceOrientationMaskPortrait;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
