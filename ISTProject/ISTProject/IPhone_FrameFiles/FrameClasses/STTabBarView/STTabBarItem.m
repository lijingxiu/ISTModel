//
//  STTabBarItem.m
//  STTabbarDemo
//
//  Created by Xiaoming Han on 12-6-4.
//  Copyright (c) 2012年 ispirit. All rights reserved.
//

#import "STTabBarItem.h"

@interface STTabBarItem()
{
    UIImageView *_bgImageView;
    UILabel *_titleLabel;
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *bgImageName;
@property (nonatomic, copy) NSString *bgImageSelectedName;

@end
@implementation STTabBarItem

- (void)dealloc
{
    self.title = nil;
    self.bgImageName = nil;
    self.bgImageSelectedName = nil;
}

- (id)initWithFrame:(CGRect)frame withItemInfo:(NSDictionary *)infoDic
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.title = (NSString *)[infoDic objectForKey:kItemTitle];
        self.bgImageName = (NSString *)[infoDic objectForKey:kItemBgNormal];
        self.bgImageSelectedName = (NSString *)[infoDic objectForKey:kItemBgSelected];
        
        CGSize size = [_title sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:kTitleFontSize]}];
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kTitleOffsetX, kTabbarHeight-size.height-3, kTabbarItemWidth, size.height)];
        [_titleLabel setBackgroundColor:[UIColor clearColor]];
        [_titleLabel setTextColor:[UIColor blackColor]];
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:kTitleFontSize]];
        [_titleLabel setText:_title];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_titleLabel];

        UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:_bgImageName ofType:nil]];
        _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake((kTabbarItemWidth-image.size.width/2)/2, 0, image.size.width/2, image.size.height/2)];
        _bgImageView.image =image;
        [self addSubview:_bgImageView];
        

        
    }
    return self;
}

- (void)changeState:(BOOL)selected
{
    [self setSelected:selected];
    NSString *imageUrl = nil;
    if (selected) {
        imageUrl = [[NSBundle mainBundle] pathForResource:_bgImageSelectedName ofType:nil];
    } else {
        imageUrl = [[NSBundle mainBundle] pathForResource:_bgImageName ofType:nil];
    }
    _bgImageView.image = [UIImage imageWithContentsOfFile:imageUrl];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
