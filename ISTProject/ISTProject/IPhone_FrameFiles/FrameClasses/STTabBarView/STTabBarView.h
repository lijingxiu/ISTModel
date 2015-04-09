//
//  STTabBarView.h
//  STTabbarDemo
//
//  Created by Xiaoming Han on 12-6-4.
//  Copyright (c) 2012年 ispirit. All rights reserved.
//


@protocol STTabBarTouchDelegate <NSObject>
- (void)didTabbarViewButtonTouched:(id)sender;
@end

#import <UIKit/UIKit.h>

@class STTabBarItem;

@interface STTabBarView : UIView<UIScrollViewDelegate>

@property (nonatomic, assign) id<STTabBarTouchDelegate> delegate;

- (id)initWithFrame:(CGRect)frame withContent:(NSArray *)array homeItemDic:(NSDictionary *)homeItemDic;
- (NSArray *)getItemArray;
- (void)setSelectedIndex:(int)index animated:(BOOL)animated;
- (void)reloadContentData;
- (void)performHomeButtonTapped;

@end
