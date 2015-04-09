//
//  STBaseViewController.m
//  IceMan
//
//  Created by steven_l on 15/3/4.
//  Copyright (c) 2015年 steven_l. All rights reserved.
//

#import "STBaseViewController.h"
static int kNavViewTag = 1000;
@interface STBaseViewController ()

@end

@implementation STBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        if (IOSVersion < 7.0) {
            self.iosChangeFloat = 0;
        }else{
            self.iosChangeFloat = 20;
        }

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTopStatusBar];
    // Do any additional setup after loading the view.
}
- (void)createTopStatusBar
{
    if (self.iosChangeFloat) {
        UIView *stausBarView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 20)];
        stausBarView.backgroundColor = [UIColor blackColor];
        [self.view addSubview:stausBarView];
    }
}

- (void)creatNavBar
{
    UIView *navView = [UIView initWithFrame:CGRectMake(0, self.iosChangeFloat, kScreen_Width, kNavHeight) backgroundColor:kSelectColor];
    navView.tag = kNavViewTag;
    [self.view addSubview:navView];
}

- (void)creatNavBarWithBackBtn
{
    UIView *navView = [UIView initWithFrame:CGRectMake(0, self.iosChangeFloat, kScreen_Width, kNavHeight) backgroundColor:kSelectColor];
    navView.tag = kNavViewTag;
    [self.view addSubview:navView];
    
    UIButton *back = [UIButton initWithFrame:CGRectMake(0, 0, 50, kNavHeight) image:[UIImage imageNamed:@"navBack.png"]];
    [back setImageEdgeInsets:UIEdgeInsetsMake((kNavHeight - 16)/2, 10, (kNavHeight - 16)/2, CGRectGetWidth(back.frame)-9-10)];
    [back addTarget:self action:@selector(backBtnTap) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:back];
}

- (void)backBtnTap
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setTitle:(NSString *)title
{
//    _title = title;
    UIFont *font = [UIFont boldSystemFontOfSize:17.0f];
    CGSize size = [title sizeWithAttributes:@{NSFontAttributeName : font}];
    if (size.width > 200) {
        size.width = 200;
    }
    
    UIView *view = [self.view viewWithTag:kNavViewTag];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.font = font;
    label.center = CGPointMake(kScreen_Width/2, kNavHeight/2);
    label.text = title;
    [view addSubview:label];
    
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
