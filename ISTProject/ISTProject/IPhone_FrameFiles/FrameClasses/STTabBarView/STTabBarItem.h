//
//  STTabBarItem.h
//  STTabbarDemo
//
//  Created by Xiaoming Han on 12-6-4.
//  Copyright (c) 2012年 ispirit. All rights reserved.
//
#define kItemTitle              @"Title"
#define kItemBgNormal           @"Nomal"
#define kItemBgSelected         @"Selected"
#define kTitleOffsetX            0
#define kTitleOffsetY            17
#define kTitleFontSize           11.0f
#define kTabbarItemWidth        kScreen_Width/3



#import <UIKit/UIKit.h>

@interface STTabBarItem : UIControl


- (id)initWithFrame:(CGRect)frame withItemInfo:(NSDictionary *)infoDic;
- (void)changeState:(BOOL)selected;
@end
