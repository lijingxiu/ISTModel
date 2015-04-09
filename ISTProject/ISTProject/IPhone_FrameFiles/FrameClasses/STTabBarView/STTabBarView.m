//
//  STTabBarView.m
//  STTabbarDemo
//
//  Created by Xiaoming Han on 12-6-4.
//  Copyright (c) 2012年 ispirit. All rights reserved.
//

#import "STTabBarView.h"
#import "STTabBarItem.h"

@interface STTabBarView ()
{
    UIScrollView *_scrollView;
    NSInteger _selectedIndex;
    NSString *_memberIconName;
    BOOL isMemberIconChange;
}

@property (nonatomic, retain) NSArray *contentArray;


- (void)onTabbarItemTouched:(id)sender;
- (void)onReceiveButtonNotification:(NSNotification *)sender;

- (void)initMoreItemIndicator;
- (void)showMoreIndicator;
- (void)showHomeButtonView;
@end

@implementation STTabBarView

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    self.contentArray = nil;
    self.delegate = nil;
}

- (id)initWithFrame:(CGRect)frame withContent:(NSArray *)array homeItemDic:(NSDictionary *)homeItemDic
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.contentArray = array;
        
        float margin = 0;
        float offset = margin;
        
        self.backgroundColor = RGBCOLOR(47, 44, 43);
        float scrollWidth = frame.size.width - offset - margin;
        
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(offset, 0, scrollWidth, kTabbarHeight)];
        _scrollView .delegate = self;
        _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _scrollView.canCancelContentTouches = NO;
        _scrollView.clipsToBounds = NO;
        _scrollView.scrollEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:_scrollView];
        
        for (int i = 0; i < _contentArray.count; i++) {
            NSDictionary *dic = (NSDictionary *)[array objectAtIndex:i];
           
            //Raik modify
            STTabBarItem* barItem = [[STTabBarItem alloc] initWithFrame:CGRectMake(kTabbarItemWidth*i, 0, kTabbarItemWidth, kTabbarHeight) withItemInfo:dic];
            barItem.tag = i;
            [barItem addTarget:self action:@selector(onTabbarItemTouched:) forControlEvents:UIControlEventTouchUpInside];
            [_scrollView addSubview:barItem];
        }
        //Raik modify
        [_scrollView setContentSize:CGSizeMake(_contentArray.count*kTabbarItemWidth, frame.size.height)];
        
    }
    return self;
}

- (void)setSelectedIndex:(int)index animated:(BOOL)animated
{
    if (index < 0 || index > _contentArray.count - 1) {
        return;
    }
    STTabBarItem *item = [_scrollView.subviews objectAtIndex:index];
    [self onTabbarItemTouched:item];
    [_scrollView scrollRectToVisible:item.frame animated:animated];
}

- (NSArray *)getItemArray
{
    NSArray *array = [NSArray arrayWithArray:_scrollView.subviews];
    return array;
}

- (void)onTabbarItemTouched:(id)sender
{
    STTabBarItem *item = (STTabBarItem *)sender;

    if (!item.selected) {
        
        for (STTabBarItem *view in _scrollView.subviews) {
            if (view.selected) {
                [view changeState:NO];
            }
        }

        [item changeState:YES];
        _selectedIndex = item.tag;
    }
    [self.delegate didTabbarViewButtonTouched:sender];
}

- (void)onReceiveButtonNotification:(NSNotification *)sender
{
    UIButton *button = (UIButton *)sender.object;
    NSLog(@"%d",button.tag);
    [self setSelectedIndex:button.tag animated:YES];
}



@end
