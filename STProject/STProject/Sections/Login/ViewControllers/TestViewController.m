//
//  TestViewController.m
//  STProject
//
//  Created by steven on 2017/9/15.
//  Copyright © 2017年 ist. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"TEST";
    self.view.backgroundColor = [UIColor blueColor];
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor yellowColor];
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
    
    
    scrollView.contentSize = CGSizeMake(1000, 500);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 1000, 80)];
    label.backgroundColor = [UIColor lightGrayColor];
    label.text = @"self.navigationController setNavigationBarHidden:NO animated:YESself.navigationController setNavigationBarHidden:NO animated:YESself.navigationController setNavigationBarHidden:NO animated:YESself.navigationController setNavigationBarHidden:NO animated:YESself.navigationController setNavigationBarHidden:NO animated:YESself.navigationController setNavigationBarHidden:NO animated:YESself.navigationController setNavigationBarHidden:NO animated:YESself.navigationController setNavigationBarHidden:NO animated:YESself.navigationController setNavigationBarHidden:NO animated:YESself.navigationController setNavigationBarHidden:NO animated:YESself.navigationController setNavigationBarHidden:NO animated:YESself.navigationController setNavigationBarHidden:NO animated:YES";
    [scrollView addSubview:label];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
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
