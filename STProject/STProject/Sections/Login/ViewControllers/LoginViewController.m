//
//  LoginViewController.m
//  STProject
//
//  Created by steven on 2017/9/15.
//  Copyright © 2017年 ist. All rights reserved.
//

#import "LoginViewController.h"
#import "TestViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadUI];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
-(void)loadUI
{
    self.view.backgroundColor = [UIColor greenColor];
    UIButton *btn  =[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnTest) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnTest
{
    TestViewController *test = [TestViewController new];
    [self.navigationController pushViewController:test animated:YES];
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
